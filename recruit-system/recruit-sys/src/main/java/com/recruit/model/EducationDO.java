package com.recruit.model;

import java.util.Date;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * 教育经历实体
 * @author Eval
 * @date 2022-03-24
 */
@Data
@Accessors(chain = true)
@TableName("education")
public class EducationDO implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 简历ID
     */
    private Integer resumeId;

    /**
     * 学校名称
     */
    private String name;

    /**
     * 专业
     */
    private String major;

    /**
     * 学历
     */
    private Integer diploma;

    /**
     * 描述
     */
    private String descriptions;

    /**
     * 开始时间
     */
    private Date startTime;

    /**
     * 结束时间
     */
    private Date endTime;

}
