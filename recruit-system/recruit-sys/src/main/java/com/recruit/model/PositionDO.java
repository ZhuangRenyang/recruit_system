package com.recruit.model;

import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 招聘职位实体
 * @author Eval
 * @since 2022-04-02
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("position")
public class PositionDO extends BaseModel {

    /**
     * 职位名称
     */
    private String title;

    /**
     * 学历要求
     */
    private String eduBack;

    /**
     * 职位要求
     */
    private String requirement;

    /**
     * 招聘人数
     */
    private Integer quantity;

    /**
     * 工作城市
     */
    private String city;

    /**
     * 最高薪资
     */
    private Integer salaryUp;

    /**
     * 最低薪资
     */
    private Integer salaryDown;

    /**
     * 职位发布时间
     */
    private LocalDateTime releaseDate;

    /**
     * 是否审核，0未审核，1审核通过，2审核不通过
     */
    private Integer state;

    /**
     * 职位浏览量
     */
    private Integer hits;

    /**
     * 分类id
     */
    private Integer categoryId;

    /**
     * HR id
     */
    private Integer hrId;

    /**
     * 公司id
     */
    private Integer companyId;
}
