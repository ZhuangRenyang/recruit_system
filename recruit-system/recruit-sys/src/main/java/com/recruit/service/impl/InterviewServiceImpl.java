package com.recruit.service.impl;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.recruit.common.mybatis.Page;
import com.recruit.common.util.PageUtil;
import com.recruit.mapper.InterviewMapper;
import com.recruit.model.InterviewDO;
import com.recruit.model.result.ApplicationResultDO;
import com.recruit.model.result.InterviewResultDO;
import com.recruit.service.InterviewService;
import com.recruit.vo.PageResponseVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;


/**
 * @author Eval
 */
@Service
public class InterviewServiceImpl extends ServiceImpl<InterviewMapper, InterviewDO> implements InterviewService {

    @Resource
    private InterviewMapper interviewMapper;

    @Override
    public PageResponseVO<InterviewResultDO> getByHrId(Integer count, Integer page, Integer hrID) {
        Page<InterviewResultDO> pager = new Page<>(page, count);
        IPage<InterviewResultDO> paging = interviewMapper.getByHrId(pager, hrID);
        return PageUtil.build(paging);
    }

    @Override
    public PageResponseVO<InterviewResultDO> getByUserId(Integer count, Integer page, Integer userId) {
        Page<InterviewResultDO> pager = new Page<>(page, count);
        IPage<InterviewResultDO> paging = interviewMapper.getByUserId(pager, userId);
        return PageUtil.build(paging);
    }
}
