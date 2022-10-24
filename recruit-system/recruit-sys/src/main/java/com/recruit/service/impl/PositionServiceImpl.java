package com.recruit.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.recruit.common.mybatis.Page;
import com.recruit.dto.position.CreateOrUpdatePositionDTO;
import com.recruit.model.PositionDO;
import com.recruit.mapper.PositionMapper;
import com.recruit.model.result.PositionResultDO;
import com.recruit.service.PositionService;
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
public class PositionServiceImpl extends ServiceImpl<PositionMapper, PositionDO> implements PositionService {

    @Resource
    private PositionMapper positionMapper;

    @Override
    public PositionResultDO getById(Integer id) {
        return positionMapper.getById(id);
    }

    @Override
    public boolean updateState(Integer id, Integer state) {
        return positionMapper.updateState(id, state);
    }

    @Override
    public boolean updateHits(Integer id) {
        return positionMapper.updateHits(id);
    }

    @Override
    public PositionDO findById(Integer id) {
        return positionMapper.selectById(id);
    }

    @Override
    public boolean createPosition(CreateOrUpdatePositionDTO validator) {
        PositionDO positionDO = new PositionDO();
        positionDO.setTitle(validator.getTitle());
        positionDO.setRequirement(validator.getRequirement());
        positionDO.setQuantity(validator.getQuantity());
        positionDO.setCity(validator.getCity());
        positionDO.setSalaryUp(validator.getSalaryUp());
        positionDO.setSalaryDown(validator.getSalaryDown());
        positionDO.setCategoryId(validator.getCategoryId());
        positionDO.setHrId(validator.getHrId());
        positionDO.setCompanyId(validator.getCompanyId());
        positionDO.setEduBack(validator.getEduBack());
        return positionMapper.insert(positionDO) > 0;
    }

    @Override
    public boolean updatePosition(PositionDO positionDO, CreateOrUpdatePositionDTO validator) {
        positionDO.setTitle(validator.getTitle());
        positionDO.setRequirement(validator.getRequirement());
        positionDO.setQuantity(validator.getQuantity());
        positionDO.setCity(validator.getCity());
        positionDO.setSalaryUp(validator.getSalaryUp());
        positionDO.setSalaryDown(validator.getSalaryDown());
        positionDO.setCategoryId(validator.getCategoryId());
        positionDO.setHrId(validator.getHrId());
        positionDO.setCompanyId(validator.getCompanyId());
        positionDO.setEduBack(validator.getEduBack());
        // 更新职位信息之后，需要管理员重新审核，把职位状态state改为0
        positionDO.setState(0);
        return positionMapper.updateById(positionDO) > 0;
    }

    @Override
    public List<PositionResultDO> sort() {
        return positionMapper.sortByHits();
    }

    @Override
    public IPage<PositionDO> getPage(Page<PositionDO> pager, Integer state) {
        return positionMapper.getPage(pager,state);
    }

    @Override
    public IPage<PositionResultDO> getPageByKeyword(Page<PositionResultDO> pager, String keyword) {
        return positionMapper.getPageByKeyword(pager,keyword);
    }
}
