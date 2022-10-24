package com.recruit.model;

import com.recruit.model.BaseModel;
import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * @author Eval
 * @since 2022-04-04
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("application")
public class ApplicationDO extends BaseModel {

    /**
     * 状态
     */
    private Integer state;

    /**
     * 申请时间
     */
    private LocalDateTime applyTime;

    /**
     * 简历id
     */
    private Integer resumeId;

    /**
     * 职位id
     */
    private Integer positionId;

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * HR id
     */
    private Integer hrId;

    /**
     * 公司 id
     */
    private Integer companyId;
}
