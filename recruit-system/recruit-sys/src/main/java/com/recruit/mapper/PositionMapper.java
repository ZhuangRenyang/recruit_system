package com.recruit.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.recruit.common.mybatis.Page;
import com.recruit.model.PositionDO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.recruit.model.result.PositionResultDO;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Eval
 * @since 2022-04-02
 */
public interface PositionMapper extends BaseMapper<PositionDO> {

    PositionResultDO getById(Integer id);

    boolean updateState(Integer id, Integer state);

    boolean updateHits(Integer id);

    List<PositionResultDO> sortByHits();

    IPage<PositionDO> getPage(Page<PositionDO> pager, Integer state);

    IPage<PositionResultDO> getPageByKeyword(Page<PositionResultDO> pager, String keyword);
}
