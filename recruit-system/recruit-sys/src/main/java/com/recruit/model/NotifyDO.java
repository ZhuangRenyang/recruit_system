package com.recruit.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.recruit.model.BaseModel;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.Date;

/**
 * @author Eval
 * @since 2022-04-16
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("notify")
public class NotifyDO extends BaseModel {

    /**
     * 消息内容
     */
    private String content;

    /**
     * 用户名
     */
    private String userName;

    /**
     * 消息是否已读，默认false代表未读
     */
    private String isRead;

    /**
     * 通知到达的时间
     */
    private Date time;
}
