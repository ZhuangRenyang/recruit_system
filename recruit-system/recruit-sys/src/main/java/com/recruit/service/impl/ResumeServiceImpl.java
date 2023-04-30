package com.recruit.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.recruit.dto.resume.CreateOrUpdateResumeDTO;
import com.recruit.mapper.*;
import com.recruit.model.*;
import com.recruit.service.EducationService;
import com.recruit.service.ResumeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.recruit.service.UserService;
import com.recruit.vo.ResumeVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Eval
 * @since 2022-03-14
 */
@Service
public class ResumeServiceImpl extends ServiceImpl<ResumeMapper, ResumeDO> implements ResumeService {

    @Resource
    private ResumeMapper resumeMapper;

    @Resource
    private UserService userService;

    @Resource
    private EducationMapper educationMapper;

    @Resource
    private ProjectMapper projectMapper;

    @Resource
    private ExperienceMapper experienceMapper;

    //根据用户Id获取用户简历信息
    @Override
    public ResumeVO getByUserId(Integer userId) {
        LambdaQueryWrapper<ResumeDO> queryWrapper = new LambdaQueryWrapper<ResumeDO>();
        queryWrapper.eq(ResumeDO::getUserId,userId);
        queryWrapper.isNull(ResumeDO::getDeleteTime);

        ResumeDO resume = resumeMapper.selectOne(queryWrapper);
        ResumeVO res=new ResumeVO();
        UserDO user=userService.getById(userId);
        if(resume!=null){
            QueryWrapper<EducationDO> educationDOQueryWrapper= new QueryWrapper<>();
            educationDOQueryWrapper.lambda().eq(EducationDO::getResumeId,resume.getId());
            List<EducationDO> educationDOS = educationMapper.selectList(educationDOQueryWrapper);
            QueryWrapper<ProjectDO> projectDOQueryWrapper=new QueryWrapper<>();
            projectDOQueryWrapper.lambda().eq(ProjectDO::getResumeId,resume.getId());
            List<ProjectDO> projectDOS = projectMapper.selectList(projectDOQueryWrapper);

            QueryWrapper<ExperienceDO> experienceDOQueryWrapper=new QueryWrapper<>();
            experienceDOQueryWrapper.lambda().eq(ExperienceDO::getResumeId,resume.getId());
            List<ExperienceDO> experienceDOS = experienceMapper.selectList(experienceDOQueryWrapper);
            if(resume.getId()!=null){
                res.setResumeId(resume.getId());
            }
            if(resume.getAbility()!=null){
                res.setAbility(resume.getAbility());
            }
            if(resume.getEnglish()!=null){
                res.setEnglish(resume.getEnglish());
            }
            if(resume.getHome()!=null){
                res.setHome(resume.getHome());
            }
            if(resume.getJobIntention()!=null){
                res.setJobIntention(resume.getJobIntention());
            }
            if(resume.getAbility()!=null){
                res.setAbility(resume.getAbility());
            }
            if(resume.getPersonalSummary()!=null){
                res.setPersonalSummary(resume.getPersonalSummary());
            }
            if(user.getEmail()!=null){
                res.setEmail(user.getEmail());
            }
            if(user.getEmail()!=null){
                res.setEmail(user.getEmail());
            }
            if(user.getAvatar()!=null){
                res.setAvatar(user.getAvatar());
            }
            if(user.getNickname()!=null){
                res.setName(user.getNickname());
            }
            if(user.getTel()!=null){
                res.setTel(user.getTel());
            }
            if(resume.getAge()!=null){
                res.setAge(resume.getAge());
            }
            if(resume.getSex()!=null){
                res.setSex(resume.getSex());
            }
            res.setEducations(educationDOS);
            res.setProjects(projectDOS);
            res.setExperiences(experienceDOS);
        }

        return res;
    }

    @Override
    public boolean createResume(CreateOrUpdateResumeDTO validator) {
        ResumeDO resumeDO = new ResumeDO();
        resumeDO.setAbility(validator.getAbility());
        resumeDO.setPersonalSummary(validator.getPersonalSummary());
        resumeDO.setUserId(validator.getUserId());
        resumeDO.setEnglish(validator.getEnglish());
        resumeDO.setJobIntention(validator.getJobIntention());
        return resumeMapper.insert(resumeDO) > 0;
    }

    @Override
    public boolean updateResume(ResumeDO resumeDO, CreateOrUpdateResumeDTO validator) {
        resumeDO.setAbility(validator.getAbility());
        resumeDO.setPersonalSummary(validator.getPersonalSummary());
        resumeDO.setUserId(validator.getUserId());
        resumeDO.setEnglish(validator.getEnglish());
        resumeDO.setJobIntention(validator.getJobIntention());
        resumeDO.setAge(validator.getAge());
        resumeDO.setSex(validator.getSex());
        resumeDO.setHome(validator.getHome());
        return resumeMapper.updateById(resumeDO) > 0;
    }

    @Override
    public ResumeDO getSimpleByUserId(Integer userId) {
        LambdaQueryWrapper<ResumeDO> queryWrapper = new LambdaQueryWrapper<ResumeDO>();
        queryWrapper.eq(ResumeDO::getUserId,userId);
        queryWrapper.isNull(ResumeDO::getDeleteTime);

        ResumeDO resume = resumeMapper.selectOne(queryWrapper);
        return resume;
    }


}
