package com.recruit.model;

import com.recruit.model.BaseModel;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * @author Eval
 * @since 2022-04-02
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("favor")
public class FavorDO extends BaseModel {

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 职位id
     */
    private Integer positionId;
}
