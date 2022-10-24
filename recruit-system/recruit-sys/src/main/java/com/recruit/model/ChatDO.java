package com.recruit.model;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * @Param eval
 * @Time 2022/9/28 12:13
 */
@Data
@TableName("chat")

public class ChatDO {
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 消息的内容
     */
    private String content;

    /**
     * 发送者id
     */
    private String sendId;

    /**
     * 接收者id
     */
    private String recvId;


    /**
     * 发送者信息
     */
    private String self;

    /**
     * 接收者信息
     */
    private String target;

    /**
     * 发送的时间
     */
    private String timestamp;

}
