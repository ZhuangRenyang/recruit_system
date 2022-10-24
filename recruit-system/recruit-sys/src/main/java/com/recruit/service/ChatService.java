package com.recruit.service;

import com.recruit.model.ChatDO;

import java.util.List;

/**
 * @Param eval
 * @Time 2022/9/28 12:50
 */
public interface ChatService {
    /**
     * 根据id获取到所有的聊天记录
     * @param id
     * @return
     */
    List<ChatDO> getChatById(Integer id);

    /**
     * 将双方的聊天记录插入数据库
     * ps: 反正就是个毕设, 暂不用考虑性能问题
     */
    void insertChat(ChatDO chat);

    /**
     * 根据id判断是否已经存在了聊天数据, 如果存在 则不用重新写入认证信息
     * @param selfID
     * @param targetID
     * @return
     */
    boolean getChatExistById(Integer selfID,Integer targetID);

    /**
     * 修改当前消息的已读状态
     * @param sendID
     * @param recvID
     * @param code   0 增加 ,1 删除
     */
    void changeChatState(String sendID,String recvID,boolean code);

    /**
     * 获取自己所有的未读消息id
     * @param userID
     * @return
     */
    String getChatState(String userID);
}
