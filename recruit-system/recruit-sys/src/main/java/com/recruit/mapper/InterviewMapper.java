package com.recruit.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.recruit.common.mybatis.Page;
import com.recruit.model.InterviewDO;
import com.recruit.model.result.InterviewResultDO;
import org.springframework.stereotype.Repository;


/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Eval
 * @since 2022-04-04
 */
@Repository
public interface InterviewMapper extends BaseMapper<InterviewDO> {
    /**
     *
     * @param pager
     * @param hrID
     * @return
     */
    IPage<InterviewResultDO> getByHrId(Page<InterviewResultDO> pager, Integer hrID);

    /**
     *
     * @param pager
     * @param userId
     * @return
     */
    IPage<InterviewResultDO> getByUserId(Page<InterviewResultDO> pager, Integer userId);
}
