package com.recruit.mapper;

import com.recruit.model.CompanyDO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Eval
 * @since 2022-04-01
 */
public interface CompanyMapper extends BaseMapper<CompanyDO> {

    boolean updateState(Integer id, Integer state);

    List<CompanyDO> findHotCompany();
}
