package com.recruit.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.recruit.mapper.EducationMapper;
import com.recruit.mapper.ProjectMapper;
import com.recruit.model.EducationDO;
import com.recruit.model.ProjectDO;
import com.recruit.service.ProjectService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Eval
 * @since 2022-04-04
 */
@Service
public class ProjectServiceImpl  extends ServiceImpl<ProjectMapper, ProjectDO> implements ProjectService {

    @Resource
    private ProjectMapper projectMapper;

    @Override
    public List<ProjectDO> getByResumeId(Integer rid) {
        QueryWrapper<ProjectDO> projectDOQueryWrapper=new QueryWrapper<>();
        projectDOQueryWrapper.lambda().eq(ProjectDO::getResumeId,rid);
        List<ProjectDO> projectDOS = projectMapper.selectList(projectDOQueryWrapper);
        return projectDOS;
    }
}
