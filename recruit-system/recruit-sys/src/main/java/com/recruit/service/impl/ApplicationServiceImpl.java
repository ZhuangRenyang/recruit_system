package com.recruit.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.recruit.common.mybatis.Page;
import com.recruit.common.util.PageUtil;
import com.recruit.model.ApplicationDO;
import com.recruit.mapper.ApplicationMapper;
import com.recruit.model.result.ApplicationResultDO;
import com.recruit.service.ApplicationService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.recruit.vo.PageResponseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Eval
 * @since 2022-04-04
 */
@Service
public class ApplicationServiceImpl extends ServiceImpl<ApplicationMapper, ApplicationDO> implements ApplicationService {

    @Resource
    private ApplicationMapper applicationMapper;

    @Override
    public boolean create(ApplicationDO applicationDO) {
        return applicationMapper.insert(applicationDO) > 0;
    }

    @Override
    public PageResponseVO<ApplicationResultDO> getByHrId(Integer count, Integer page, Integer hrID, Integer state) {
        Page<ApplicationResultDO> pager = new Page<>(page, count);
        IPage<ApplicationResultDO> paging = applicationMapper.getByHrId(pager, hrID, state);
        return PageUtil.build(paging);
    }

    @Override
    public boolean updateState(Integer id, Integer state) {
        return applicationMapper.updateState(id, state);
    }

    @Override
    public PageResponseVO<ApplicationResultDO> sort(Integer count, Integer page, Integer hrID) {
        Page<ApplicationResultDO> pager = new Page<>(page, count);
        IPage<ApplicationResultDO> paging = applicationMapper.sortByGrade(pager, hrID);
        return PageUtil.build(paging);
    }

    @Override
    public PageResponseVO<ApplicationResultDO> getByUserId(Integer count, Integer page, Integer userId) {
        Page<ApplicationResultDO> pager = new Page<>(page, count);
        IPage<ApplicationResultDO> paging = applicationMapper.getByUserId(pager, userId);
        return PageUtil.build(paging);
    }

}
