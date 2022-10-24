package com.recruit.service.impl;

import io.github.talelin.autoconfigure.exception.NotFoundException;
import com.recruit.model.FavorDO;
import com.recruit.mapper.FavorMapper;
import com.recruit.model.PositionDO;
import com.recruit.service.FavorService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Eval
 * @since 2022-04-02
 */
@Service
public class FavorServiceImpl extends ServiceImpl<FavorMapper, FavorDO> implements FavorService {

    @Resource
    private FavorMapper favorMapper;

    @Override
    public List<PositionDO> getAllByUserId(Integer userId) {
        return favorMapper.getByUserId(userId);
    }

    @Override
    public boolean cancelFavor(Integer userId, Integer positionId) {
        // 根据用户id和职位id查询收藏信息
        FavorDO favor = favorMapper.getByUserIdAndFavorId(userId, positionId);
        if (favor == null) {
            throw new NotFoundException(45000);
        }
        // 删除该收藏
        return favorMapper.deleteById(favor.getId()) > 0;
    }

    @Override
    public boolean create(FavorDO favorDO) {
        return favorMapper.insert(favorDO) > 0;
    }
}
