package com.recruit.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.recruit.mapper.EducationMapper;
import com.recruit.model.EducationDO;
import com.recruit.service.EducationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Eval
 * @since 2022-04-01
 */
@Service
public class EducationServiceImpl extends ServiceImpl<EducationMapper, EducationDO> implements EducationService {

    @Resource
    private EducationMapper educationMapper;

    @Override
    public List<EducationDO> getByResumeId(Integer rid) {
        QueryWrapper<EducationDO> educationDOQueryWrapper=new QueryWrapper<>();
        educationDOQueryWrapper.lambda().eq(EducationDO::getResumeId,rid);
        List<EducationDO> educationDOS = educationMapper.selectList(educationDOQueryWrapper);
        return educationDOS;
    }
}
