package com.recruit.controller;

import io.github.talelin.autoconfigure.exception.NotFoundException;
import io.github.talelin.core.annotation.GroupRequired;
import io.github.talelin.core.annotation.Logger;
import io.github.talelin.core.annotation.PermissionMeta;
import io.github.talelin.core.annotation.PermissionModule;
import com.recruit.dto.resume.CreateOrUpdateResumeDTO;
import com.recruit.model.EducationDO;
import com.recruit.model.ExperienceDO;
import com.recruit.model.ProjectDO;
import com.recruit.service.EducationService;
import com.recruit.service.ExperienceService;
import com.recruit.service.ProjectService;
import com.recruit.service.ResumeService;
import com.recruit.vo.ResumeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import com.recruit.model.ResumeDO;
import com.recruit.vo.CreatedVO;
import com.recruit.vo.DeletedVO;
import com.recruit.vo.UpdatedVO;
import javax.validation.constraints.Positive;
import java.util.List;

/**
* @author Eval
* @since 2022-03-14
*/
@RestController
@RequestMapping("/recruit/resume")
@PermissionModule(value = "简历")
public class ResumeController {

    @Autowired
    private ResumeService resumeService;

    @Autowired
    private EducationService educationService;

    @Autowired
    private ProjectService projectService;

    @Autowired
    private ExperienceService experienceService;

    /**
     * 创建简历
     * @param validator
     * @return
     */
    @PostMapping("")
    @GroupRequired
    @PermissionMeta(value = "创建简历")
    public CreatedVO create(@RequestBody @Validated CreateOrUpdateResumeDTO validator) {
        resumeService.createResume(validator);
        return new CreatedVO(1000);
    }

    /**
     * 根据用户id更新简历
     * @param userId
     * @return
     */
    @PutMapping("/{userId}")
    @GroupRequired
    @PermissionMeta(value = "更新简历")
    public UpdatedVO update(@PathVariable @Positive(message = "{id.positive}") Integer userId, @RequestBody @Validated CreateOrUpdateResumeDTO validator) {
        // 根据用户id查询简历
        ResumeDO resumeDO =  resumeService.getSimpleByUserId(userId);
        if (resumeDO == null) {
            throw new NotFoundException(20010);
        }
        // 更新简历
        resumeService.updateResume(resumeDO, validator);
        return new UpdatedVO(1010);
    }

    /**
     * 根据用户id查询简历（每个用户只绑定一份简历）
     * @param userId
     * @return
     */
    @Logger(template = "查看简历")
    @GetMapping("/get/{userId}")
    @GroupRequired
    @PermissionMeta(value = "查询简历")
    public ResumeVO getByUserId(@PathVariable(value = "userId") @Positive(message = "{id.positive}") Integer userId) {
        ResumeVO resume = resumeService.getByUserId(userId);
        if (resume == null) {
            throw new NotFoundException(20010);
        }
        return resume;
    }

    /**
     * 根据id查询简历
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public ResumeVO get(@PathVariable(value = "id") @Positive(message = "{id.positive}") Integer id) {
        ResumeDO resume = resumeService.getById(id);
        ResumeVO resumeVO = resumeService.getByUserId(resume.getUserId());
        if (resumeVO == null) {
            throw new NotFoundException(20020);
        }
        return resumeVO;
    }

    /**
     * 根据简历id拿到所有教育经历
     * @param rid
     * @return
     */
    @GetMapping("/education/{rid}")
    public List<EducationDO> getEducations(@PathVariable(value = "rid") @Positive(message = "{rid.positive}") Integer rid) {
        List<EducationDO> educationDOS = educationService.getByResumeId(rid);
        return educationDOS;
    }

    /**
     * 更新教育经历
     * @param
     * @return
     */
    @PutMapping("/education/update")
    public UpdatedVO updateEducation( @RequestBody EducationDO educationDO) {
        // 更新
        boolean b = educationService.updateById(educationDO);
        return new UpdatedVO(1010);
    }

    /**添加教育经历
     * @param educationDO
     * @return
     */
    @PostMapping("/education")
    public CreatedVO addEducation( @RequestBody EducationDO educationDO) {
        // 新增
        boolean b = educationService.save(educationDO);
        return new CreatedVO(1000);
    }

    /**
     * 根据id删除教育经历
     * @param id
     * @return
     */
    @DeleteMapping("/education/{id}")
    public  DeletedVO delEducation(@PathVariable Integer id){
        educationService.removeById(id);
        return new DeletedVO(2000);
    }

    /**
     * 根据简历id拿到所有项目经历
     * @param rid
     * @return
     */
    @GetMapping("/project/{rid}")
    public List<ProjectDO> getProjects(@PathVariable(value = "rid") @Positive(message = "{rid.positive}") Integer rid) {
        List<ProjectDO> projectDOS = projectService.getByResumeId(rid);
        return projectDOS;
    }

    /**
     * 更新项目经历
     * @param
     * @return
     */
    @PutMapping("/project/update")
    public UpdatedVO updateProject( @RequestBody ProjectDO projectDO) {
        // 更新
        boolean b = projectService.updateById(projectDO);
        return new UpdatedVO(1010);
    }

    /**
     * @param projectDO
     * @return
     */
    @PostMapping("/project")
    public CreatedVO addProject( @RequestBody ProjectDO projectDO) {
        // 新增
        boolean b = projectService.save(projectDO);
        return new CreatedVO(1000);
    }

    /**
     * 根据id删除项目经历
     * @param id
     * @return
     */
    @DeleteMapping("/project/{id}")
    public  DeletedVO delProject(@PathVariable Integer id){
        projectService.removeById(id);
        return new DeletedVO(2000);
    }

    /**
     * 根据简历id拿到所有实习经历
     * @param rid
     * @return
     */
    @GetMapping("/experience/{rid}")
    public List<ExperienceDO> getExperiences(@PathVariable(value = "rid") @Positive(message = "{rid.positive}") Integer rid) {
        List<ExperienceDO> experienceDOS = experienceService.getByResumeId(rid);
        return experienceDOS;
    }

    /**
     * 更新项目经历
     * @param
     * @return
     */
    @PutMapping("/experience/update")
    public UpdatedVO updateExperience( @RequestBody ExperienceDO experienceDO) {
        // 更新
        boolean b = experienceService.updateById(experienceDO);
        return new UpdatedVO(1010);
    }

    /**
     * @param experienceDO
     * @return
     */
    @PostMapping("/experience")
    public CreatedVO addExperience( @RequestBody ExperienceDO experienceDO) {
        // 新增
        boolean b = experienceService.save(experienceDO);
        return new CreatedVO(1000);
    }

    /**
     * 根据id删除项目经历
     * @param id
     * @return
     */
    @DeleteMapping("/experience/{id}")
    public  DeletedVO delExperience(@PathVariable Integer id){
        experienceService.removeById(id);
        return new DeletedVO(2000);
    }

}
