package com.recruit.service;

import com.alibaba.fastjson.JSONObject;

/**
 * @Param eval
 * @Time 2022/8/27 16:14
 */
public interface RedisService{
    // 设置验证码缓存, 如果没有使用,那么5分钟后删除这个key
    void setMailCode(String code);
    Object getMailCode(String code);

    void delMailCode(String code);

    // 将聊天内容存储
    void saveChatData(String token, String data);
    // 根据传进来的角色认证头字段,取到对应的聊天数据
    String getChatData(String token);
}
