package com.recruit.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.recruit.model.InterviewDO;
import com.recruit.model.PositionDO;
import com.recruit.model.result.InterviewResultDO;
import com.recruit.service.InterviewService;
import com.recruit.vo.PageResponseVO;
import com.recruit.vo.UpdatedVO;
import io.github.talelin.autoconfigure.exception.NotFoundException;
import io.github.talelin.core.annotation.GroupRequired;
import io.github.talelin.core.annotation.PermissionMeta;
import io.github.talelin.core.annotation.PermissionModule;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Positive;

/**
 * @author Eval
 * @since 2022-04-16
 */
@RestController
@RequestMapping("/recruit/interview")
@PermissionModule(value = "面试")
public class InterviewController {

    @Autowired
    private InterviewService interviewService;

    @GetMapping("/page/{hrID}")
    @GroupRequired
    @PermissionMeta(value = "面试管理")
    public PageResponseVO<InterviewResultDO> page(
            @RequestParam(name = "count", required = false, defaultValue = "10")
            @Min(value = 1, message = "{page.count.min}")
            @Max(value = 30, message = "{page.count.max}") Integer count,
            @RequestParam(name = "page", required = false, defaultValue = "0")
            @Min(value = 0, message = "{page.number.min}") Integer page,
            @PathVariable(value = "hrID") @Positive(message = "{id.positive}") Integer hrID,
            @RequestParam Integer state
    ) {
        return interviewService.getByHrId(count, page, hrID);
    }

    @GetMapping("/page/find/{userId}")
    @GroupRequired
    @PermissionMeta(value = "我的面试")
    public PageResponseVO<InterviewResultDO> pageByUserId(
            @RequestParam(name = "count", required = false, defaultValue = "10")
            @Min(value = 1, message = "{page.count.min}")
            @Max(value = 30, message = "{page.count.max}") Integer count,
            @RequestParam(name = "page", required = false, defaultValue = "0")
            @Min(value = 0, message = "{page.number.min}") Integer page,
            @PathVariable(value = "userId") @Positive(message = "{id.positive}") Integer userId,
            @RequestParam Integer state
    ) {
        return interviewService.getByUserId(count, page, userId);
    }

    @PostMapping("/sendInterviewNotify")
    @GroupRequired
    @PermissionMeta(value = "面试管理")
    public UpdatedVO sendInterviewNotify(@RequestBody InterviewDO interviewDO){
        QueryWrapper<InterviewDO> wrapper = new QueryWrapper<>();
        wrapper.eq("id", interviewDO.getId());
        InterviewDO result = interviewService.getOne(wrapper);
        if (result == null) {
            throw new NotFoundException(41000);
        }
        result.setStatus(1);
        result.setAddress(interviewDO.getAddress());
        result.setMemo(interviewDO.getMemo());
        result.setTime(interviewDO.getTime());
        interviewService.updateById(result);
        return new UpdatedVO(4100);
    }

    @PostMapping("/updateInterviewResult")
    @GroupRequired
    @PermissionMeta(value = "面试管理")
    public UpdatedVO updateInterviewResult(@RequestBody InterviewDO interviewDO){
        QueryWrapper<InterviewDO> wrapper = new QueryWrapper<>();
        wrapper.eq("id", interviewDO.getId());
        InterviewDO result = interviewService.getOne(wrapper);
        if (result == null) {
            throw new NotFoundException(41000);
        }
        result.setStatus(interviewDO.getStatus());
        result.setComments(interviewDO.getComments());
        interviewService.updateById(result);
        return new UpdatedVO(4100);
    }
}
