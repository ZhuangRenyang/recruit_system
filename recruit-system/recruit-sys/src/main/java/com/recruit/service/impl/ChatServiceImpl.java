package com.recruit.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.recruit.mapper.ChatMapper;
import com.recruit.model.ChatDO;
import com.recruit.service.ChatService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Param eval
 * @Time 2022/9/28 12:58
 */
@Service
public class ChatServiceImpl implements ChatService {
    @Resource
    ChatMapper chatMapper;

    @Resource
    RedisServiceImpl redisService;

    @Override
    public List<ChatDO> getChatById(Integer id) {
        QueryWrapper<ChatDO> wrapper = new QueryWrapper<>();
//        wrapper.
        wrapper.eq("send_id",id).or().eq("recv_id",id);
        return chatMapper.selectList(wrapper);
    }

    @Override
    public void insertChat(ChatDO chat) {
        chatMapper.insert(chat);
    }

    @Override
    public boolean getChatExistById(Integer selfID, Integer targetID) {
        QueryWrapper<ChatDO> wrapper = new QueryWrapper<>();
        wrapper.eq("send_id",selfID).eq("recv_id",targetID);
        return chatMapper.selectCount(wrapper) > 0;
    }

    @Override
    public void changeChatState(String sendID, String recvID,boolean code) {
        String data = getChatState(recvID);
        if(!code && data.indexOf("^"+sendID+"&") ==-1){
            data += "^"+sendID+"&";
            redisService.set("chatState_"+recvID,data);
            return;
        }
        data = data.replace("^"+sendID+"&","");
        if(data.isEmpty()){
            redisService.del("chatState_"+recvID);
            return;
        }
        redisService.set("chatState_"+recvID,data);
    }

    /**
     * @param userID
     * @return
     */
    @Override
    public String getChatState(String userID) {
        String data = String.valueOf(redisService.get("chatState_"+userID));
        return data.equals("null") ? "" : data;
    }
}
