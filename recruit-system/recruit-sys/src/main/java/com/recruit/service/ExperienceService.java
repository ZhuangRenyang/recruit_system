package com.recruit.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.recruit.model.ExperienceDO;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Eval
 * @since 2022-04-02
 */
public interface ExperienceService extends IService<ExperienceDO> {
    List<ExperienceDO> getByResumeId(Integer rid);
}
