package com.recruit.model;


import java.util.Date;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;
import java.io.Serializable;

/**
 * 项目经历实体
 * @author Eval
 * @date 2022-03-24
 */
@Data
@Accessors(chain = true)
@TableName("project")
public class ProjectDO implements Serializable{

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
     * 项目名称
     */
    private String name;

    /**
     * 开始时间
     */
    private Date startTime;

    /**
     * 结束时间
     */
    private Date endTime;

    /**
     * 项目描述
     */
    private String performance;

    /**
     * 项目背景
     */
    private String background;

}
