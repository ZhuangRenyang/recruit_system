package com.recruit.model;

import com.recruit.model.BaseModel;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * @author Eval
 * @since 2022-03-14
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("resume")
public class ResumeDO extends BaseModel {

    /**
     * 专业技能
     */
    private String ability;

    /**
     * 个人总结
     */
    private String personalSummary;

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 英语等级
     */
    private String english;

    /**
     * 居住地
     */
    private String home;

    /**
     * 求职意向
     */
    private String jobIntention;

    /**
     * 年龄
     */
    private Integer age;

    /**
     * 性别
     */
    private Integer sex;

}
