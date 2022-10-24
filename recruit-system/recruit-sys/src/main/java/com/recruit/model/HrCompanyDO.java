package com.recruit.model;

import com.recruit.model.BaseModel;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * @author Eval
 * @since 2022-04-05
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("hr_company")
public class HrCompanyDO extends BaseModel {

    /**
     * HR id
     */
    private Integer hrId;

    /**
     * 公司id
     */
    private Integer companyId;
}
