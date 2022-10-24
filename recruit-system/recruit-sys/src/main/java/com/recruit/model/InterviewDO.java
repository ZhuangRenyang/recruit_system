package com.recruit.model;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import java.io.Serializable;
import java.util.Date;

/**
 * @author Eval
 * @since 2022-04-05
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("interview")
@EqualsAndHashCode(callSuper = true)
public class InterviewDO extends BaseModel implements Serializable {

    /**
     *  简历编号
     */
    private Integer resumeId;

    /**
     *  求职者ID
     */
    private Integer userId;

    /**
     * 公司ID
     */
    private Integer companyId;

    /**
     * hrID
     */
    private Integer hrId;

    /**
     *  职位ID
     */
    private Integer positionId;

    /**
     * 面试时间
     */
    private Date time;

    /**
     * 面试地点
     */
    private String address;

    /**
     *  面试备注
     */
    private String memo;

    /**
     *  面试评价
     */
    private String comments;

    /**
     *  面试状态
     */
    private Integer status;
}