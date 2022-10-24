package com.recruit.model.result;

import com.recruit.model.InterviewDO;
import lombok.Data;

/**
 * @author Eval
 */
@Data
public class InterviewResultDO extends InterviewDO {
    /**
     * 用户昵称
     */
    private String nickname;

    /**
     * 用户邮箱
     */
    private String email;

    /**
     * 手机
     */
    private String tel;

    /**
     * 职位名称
     */
    private String title;

    /**
     * 公司名称
     */
    private String name;

    /**
     * 工作地点
     */
    private String city;
}
