package com.recruit.dto.resume;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

/**
 * @author Eval
 * @create 2021/4/1 13:03
 */
@Data
@NoArgsConstructor
public class CreateOrUpdateResumeDTO {

    @NotEmpty(message = "{resume.ability.not-empty}")
    @Length(max = 1000, message = "{resume.ability.length}")
    private String ability;


    @Length(max = 1000, message = "{resume.personalSummary.length}")
    private String personalSummary;

    @NotNull(message = "{resume.userId.not-empty}")
    private Integer userId;

    /**
     * 英语等级
     */
    private String english;

    /**
     * 求职意向
     */
    private String jobIntention;

    /**
     * 居住地
     */
    private String home;

    /**
     * 年龄
     */
    private Integer age;

    /**
     * 性别
     */
    private Integer sex;
}
