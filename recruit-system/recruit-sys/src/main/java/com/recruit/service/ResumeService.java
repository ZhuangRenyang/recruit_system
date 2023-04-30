package com.recruit.service;

import com.recruit.dto.resume.CreateOrUpdateResumeDTO;
import com.recruit.model.ResumeDO;
import com.baomidou.mybatisplus.extension.service.IService;
import com.recruit.vo.ResumeVO;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Eval
 * @since 2022-03-14
 */
public interface ResumeService extends IService<ResumeDO> {

    //获取用户简历信息
    ResumeVO getByUserId(Integer userId);

    boolean createResume(CreateOrUpdateResumeDTO validator);

    boolean updateResume(ResumeDO resumeDO, CreateOrUpdateResumeDTO validator);

    ResumeDO getSimpleByUserId(Integer userId);
}
