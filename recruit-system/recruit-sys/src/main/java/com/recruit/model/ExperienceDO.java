package com.recruit.model;

import java.util.Date;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 *
 * @author Eval
 * @date 2022-03-24
 */
@Data
@Accessors(chain = true)
@TableName("experience")
public class ExperienceDO implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 简历id
     */
    private Integer resumeId;

    /**
     * 公司名称
     */
    private String name;

    /**
     * 职位
     */
    private String position;

    /**
     * 开始时间
     */
    private Date startTime;

    /**
     * 结束时间
     */
    private Date endTime;

    /**
     * 工作描述
     */
    private String performance;

}
