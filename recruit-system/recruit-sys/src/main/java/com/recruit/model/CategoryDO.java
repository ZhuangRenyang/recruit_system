package com.recruit.model;

import com.recruit.model.BaseModel;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 职位分类实体
 * @author Eval
 * @since 2022-04-04
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("category")
public class CategoryDO extends BaseModel {

    /**
     * 分类名称
     */
    private String name;

    /**
     * 分类关键字
     */
    private String keyWord;

    /**
     * 分类描述
     */
    private String description;
}
