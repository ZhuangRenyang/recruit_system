package com.recruit.model;

import com.recruit.model.BaseModel;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * @author Eval
 * @since 2022-04-01
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("company")
public class CompanyDO extends BaseModel {

    /**
     * 公司名称
     */
    private String name;

    /**
     * 外文名
     */
    private String foreignName;

    /**
     * 总部地点
     */
    private String city;

    /**
     * 公司logo
     */
    private String logo;

    /**
     * 公司海报
     */
    private String poster;

    /**
     * 使命
     */
    private String mission;

    /**
     * 公司简介
     */
    private String description;

    /**
     * 是否审核，0未审核，1审核通过，2审核不通过
     */
    private Integer state;
}
