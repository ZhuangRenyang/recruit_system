package com.recruit.module.message;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.recruit.model.ChatDO;
import com.recruit.service.ChatService;
import com.recruit.service.RedisService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;

/**
 * @Param eval
 * @Time 2022/9/23 15:35
 */
@Component
@Slf4j
@ServerEndpoint("/ws/message/{uID}")
public class WebSocket {
    //与某个客户端的连接会话，需要通过它来给客户端发送数据
    private Session session;
    // 存储当前连接的用户id
    private Integer uID;
    //concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。
    //虽然@Component默认是单例模式的，但springboot还是会为每个websocket连接初始化一个bean，所以可以用一个静态set保存起来。
    //  注：底下WebSocket是当前类名
    private static CopyOnWriteArraySet<WebSocket> webSockets = new CopyOnWriteArraySet<>();
    // 用来存在线连接数
    private static Map<String, Session> sessionPool = new ConcurrentHashMap<>();

    Integer  ContactID = -1;

    private static ChatService chatService;
    @Resource
    public void setChatService(ChatService chatService){WebSocket.chatService = chatService;}

    /**
     * 链接成功调用的方法
     */
    @OnOpen
    public void onOpen(Session session, @PathParam(value = "uID") String userId) {
        this.session = session;
        if(userId.equals("undefined")){
            log.error("【websocket消息】连接失败,userIdw为空("+userId+")");
            return;
        }
        this.uID = Integer.valueOf(userId);
        if(sessionPool.get(userId) == null){
            webSockets.add(this);
        }
        sessionPool.put(userId, session);
        log.info("【websocket消息】有新的连接，总数为:" + webSockets.size());
    }

    /**
     * 链接关闭调用的方法
     */
    @OnClose
    public void onClose() {
        try {
            webSockets.remove(this);
            sessionPool.remove(String.valueOf(this.uID));
            log.info("【websocket消息】用户"+this.uID+"连接断开，剩余在线数为:" + webSockets.size());
        } catch (Exception e) {
            log.error("【websocket消息】用户"+this.uID+"连接断开，剩余在线数为:" + webSockets.size());
        }
    }

    /**
     * 收到客户端消息后调用的方法
     *
     * @param//message
     * @param//session
     */
    @OnMessage
    public void onMessage(String message) {
        // 解析聊天数据
        JSONObject content = JSONObject.parseObject(message);
//        System.out.println("内容:"+content);
        switch (content.getString("type")){
            case "handToken":
                // 发起沟通认证请求时
                ws_handler_request(content);
                break;
            case "token":
                // 如果传入的类型是认证头 ,那么将当前用户所有的聊天对象返回给目标
                ws_handler_token(content);
                break;
            case "group":
                // 广播消息
                sendAllMessage(content.getString("content"));
                break;
            case "alone":
                // 私聊消息
                ws_message_alone(content);
                break;
            case "state":
                //  修改消息状态
                chatService.changeChatState(content.getString("readID"),String.valueOf(uID),true);
                break;
            case "tips":
                // 登录时,告诉客户端是否有新消息
                content.put("isTip", !chatService.getChatState(String.valueOf(uID)).isEmpty());
                content.put("recvID",uID);
                content.put("type","tips");
                sendOneMessage(content);
                break;

            case "ping":
                content.put("type","ping");
                content.put("recvID",uID);
                // 客户端每隔一段时间发起请求,获取当前客户端的聊天列表在线情况
                content.put("content",ws_heartbeat(content));
                sendOneMessage(content);
        }
    }

    /**
     * 发送错误时的处理
     * @param session
     * @param error
     */
    @OnError
    public void onError(Session session, Throwable error) {
        log.error("用户错误,原因:" + error.getMessage());
        error.printStackTrace();
    }


    // 此为广播消息
    public void sendAllMessage(String message) {
        log.info("【websocket消息】广播消息:" + message);
        for (WebSocket webSocket : webSockets) {
            try {
                if (webSocket.session.isOpen()) {
                    webSocket.session.getAsyncRemote().sendText(message);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    // 此为单点消息
    public void sendOneMessage(String userId, String message) {
        Session session = sessionPool.get(userId);
        if (session != null && session.isOpen()) {
            try {
                log.info("【websocket消息】 单点消息:" + message);
                session.getAsyncRemote().sendText(message);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    public void sendOneMessage(JSONObject data) {
        Session session = sessionPool.get(data.getString("recvID"));
        if (session != null && session.isOpen()) {
            try {
                if (data.getString("type").equals("token")){
                    String uuid = String.valueOf(UUID.randomUUID()).substring(0,8);
                    data.put("target",uuid);
                    data.put("_id",uuid);
                }
//                log.info("【websocket消息】 单点消息:" + data.getString("content"));
                session.getAsyncRemote().sendText(String.valueOf(data));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else{
            System.out.println("被拦住了"+session);
        }
    }

    // 此为单点消息(多人)
    public void sendMoreMessage(String[] userIds, String message) {
        for (String userId : userIds) {
            Session session = sessionPool.get(userId);
            if (session != null && session.isOpen()) {
                try {
                    log.info("【websocket消息】 单点消息:" + message);
                    session.getAsyncRemote().sendText(message);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }

    // 封装消息体结构
    public JSONObject packMsg(JSONObject content,String msgType){
        JSONObject msg = new JSONObject();
        msg.put("type",msgType);
        msg.put("text",content.getString("content"));
        ArrayList msgData = new ArrayList();
        msgData.add(msg);
        JSONObject data = new JSONObject();
        data.put("id",content.getString("target"));
        data.put("name",content.getString("nickName"));
        data.put("type","alone");
        data.put("time",content.getString("time"));
        data.put("icon",content.getJSONObject("self").getString("icon"));
        data.put("msg",msgData);
        data.put("head",null);
        data.put("isRead",1);
        return data;
    }
    public JSONObject packMsg(String id,String name,String type,String time,String icon,String msg,String head,Integer isRead,String msgType){
        JSONObject data = new JSONObject();
        JSONObject msgJSON = new JSONObject();
        msgJSON.put("type",msgType);
        msgJSON.put("text",msg);
        ArrayList msgData = new ArrayList();
        msgData.add(msg);

        data.put("id",id);
        data.put("name",name);
        data.put("type",type);
        data.put("time",time);
        data.put("icon",icon);
        data.put("msg",msgData);
        data.put("head",head);
        data.put("isRead",isRead);
        return data;
    }


    // 处理认证请求
    public void ws_handler_request(JSONObject content){
        String recvId = content.getJSONObject("info").getString("recvId");
        this.ContactID = Integer.valueOf(recvId);
        // 如果目标已经被当前用户认证, 那么跳出
        if(chatService.getChatExistById(uID,this.ContactID)) return;
        ChatDO chat = new ChatDO();
        chat.setSendId(String.valueOf(uID));
        chat.setRecvId(recvId);
        chat.setTimestamp(content.getJSONObject("info").getString("time"));
        chat.setSelf(content.getJSONObject("info").getString("self"));
        chat.setTarget(content.getJSONObject("info").getString("target"));
        chat.setContent("您好，我非常喜欢贵公司，有信心能够胜任这个职位，期待您的回复。");
        chatService.insertChat(chat);
        // 修改消息已读状态
        chatService.changeChatState(String.valueOf(uID),recvId,false);
        // 如果对方hr在线,那么将本次的通知推送给对方
        if(sessionPool.get(recvId)!=null){
            content.put("self",content.getJSONObject("info").getString("self"));
            content.put("target",content.getJSONObject("info").getString("target"));
            content.put("time",content.getJSONObject("info").getString("time"));
            content.put("type","alone");
            content.put("content","您收到一位求职者的新消息");
            content.put("recvID",recvId);
            sendOneMessage(content);
        }
    }

    // 处理认证头
    public void ws_handler_token(JSONObject content){
        content.put("header","Eval认证");
        content.put("target",uID);
        content.put("_id",uID);
        content.put("ContactID",this.ContactID);
        // 认证时,将当前用户所有的聊天数据返回至前端
        content.put("content",chatService.getChatById(uID));
        content.put("recvID",uID);
        content.put("readList",chatService.getChatState(String.valueOf(uID)));
        sendOneMessage(content);
    }

    // 处理私聊消息
    public void ws_message_alone(JSONObject content){
        // 将信息反馈到用户,-1是机器人,不用修改数据库
        if(content.getJSONObject("target").getInteger("id")==-1){
            content.put("recvID",uID);
            content.put("type","system");
            content.put("content",content.getString("content"));
        }else{
            ChatDO chat = new ChatDO();
            chat.setContent(content.getString("content"));
            chat.setSendId(String.valueOf(uID));
            chat.setRecvId(content.getString("recvID"));
            chat.setSelf(content.getString("self"));
            chat.setTarget(content.getString("target"));
            chat.setTimestamp(content.getString("time"));
            chatService.insertChat(chat);
            // 修改消息已读状态
            chatService.changeChatState(String.valueOf(uID),content.getString("recvID"),false);
        }
        sendOneMessage(content);
    }

    public String ws_heartbeat(JSONObject content){
        String user_online = "";
        String[] user_list = content.getString("friends_list").split("\\|");
        for (String id:user_list) {
            if (sessionPool.get(id) !=null){
                user_online += id+"|";
            }
        }
        return user_online;
    }
}