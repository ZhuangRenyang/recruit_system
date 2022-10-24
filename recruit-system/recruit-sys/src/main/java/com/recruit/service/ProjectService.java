package com.recruit.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.recruit.model.ProjectDO;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Eval
 * @since 2022-03-14
 */
public interface ProjectService extends IService<ProjectDO> {

     List<ProjectDO> getByResumeId(Integer rid);
}