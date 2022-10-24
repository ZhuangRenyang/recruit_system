package com.recruit.mapper;

import com.recruit.model.ResumeDO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Eval
 * @since 2022-03-14
 */
public interface ResumeMapper extends BaseMapper<ResumeDO> {

    ResumeDO getByUserId(@Param("userId") Integer userId);
}
