package com.recruit.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.recruit.model.EducationDO;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Eval
 * @since 2022-04-02
 */
public interface EducationService extends IService<EducationDO> {
    List<EducationDO> getByResumeId(Integer rid);
}
