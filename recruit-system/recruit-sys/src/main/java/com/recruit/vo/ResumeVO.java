package com.recruit.vo;

import com.recruit.model.EducationDO;
import com.recruit.model.ExperienceDO;
import com.recruit.model.ProjectDO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;


/**
 * 统一API响应结果封装
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ResumeVO {
    private Integer resumeId;
    // 用户昵称
    private String name;
    //头像
    private String avatar;
    // 求职意向
    private String jobIntention;
    // 性别
    private int sex;

    // 居住地
    private String home;
    // 年龄
    private int age;
    // 英语水平
    private String english;
    // 电话
    private String tel;
    // 邮箱
    private String email;
    // 专业技能
    private String ability;
    // 个人总结
    private String personalSummary;

    //教育经历
    private List<EducationDO> educations;

    //项目经历
    private List<ProjectDO> projects;

    //工作经历
    private List<ExperienceDO> experiences;

}
