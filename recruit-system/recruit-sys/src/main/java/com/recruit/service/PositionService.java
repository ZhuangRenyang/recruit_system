package com.recruit.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.recruit.common.mybatis.Page;
import com.recruit.dto.position.CreateOrUpdatePositionDTO;
import com.recruit.model.PositionDO;
import com.baomidou.mybatisplus.extension.service.IService;
import com.recruit.model.result.PositionResultDO;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Eval
 * @since 2022-04-02
 */
public interface PositionService extends IService<PositionDO> {

    PositionResultDO getById(Integer id);

    boolean updateState(Integer id, Integer state);

    boolean updateHits(Integer id);

    PositionDO findById(Integer id);

    boolean createPosition(CreateOrUpdatePositionDTO validator);

    boolean updatePosition(PositionDO positionDO, CreateOrUpdatePositionDTO validator);

    List<PositionResultDO> sort();

    IPage<PositionDO> getPage(Page<PositionDO> pager, Integer state);

    IPage<PositionResultDO> getPageByKeyword(Page<PositionResultDO> pager, String keyword);
}
