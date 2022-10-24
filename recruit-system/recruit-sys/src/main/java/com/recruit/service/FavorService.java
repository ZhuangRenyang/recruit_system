package com.recruit.service;

import com.recruit.model.FavorDO;
import com.baomidou.mybatisplus.extension.service.IService;
import com.recruit.model.PositionDO;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Eval
 * @since 2022-04-02
 */
public interface FavorService extends IService<FavorDO> {
    List<PositionDO> getAllByUserId(Integer userId);

    boolean cancelFavor(Integer userId, Integer positionId);

    boolean create(FavorDO favorDO);
}
