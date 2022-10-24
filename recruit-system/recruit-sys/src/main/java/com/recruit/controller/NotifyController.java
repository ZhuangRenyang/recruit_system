package com.recruit.controller;

import com.recruit.service.NotifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.recruit.model.NotifyDO;
import com.recruit.vo.CreatedVO;
import com.recruit.vo.UpdatedVO;
import java.util.List;

/**
* @author Eval
* @since 2022-04-16
*/
@RestController
@RequestMapping("/recruit/notify")
public class NotifyController {

    @Autowired
    private NotifyService notifyService;

    /**
     * 新增消息通知
     * @param notifyDO
     * @return
     */
    @PostMapping("")
    public CreatedVO create(@RequestBody NotifyDO notifyDO) {
        notifyService.create(notifyDO);
        return new CreatedVO();
    }

    /**
     * 根据用户名修改消息状态为已读
     * @param userName
     * @return
     */
    @PutMapping("")
    public UpdatedVO update(@RequestParam String userName) {
        notifyService.update(userName);
        return new UpdatedVO();
    }

    /**
     * 根据用户名和状态码查询该用户收到的所有通知
     * @param userName
     * @param isRead
     * @return
     */
    @GetMapping()
    public List<NotifyDO> get(@RequestParam String userName, @RequestParam String isRead) {
        List<NotifyDO> notifyDOS = notifyService.get(userName, isRead);
        return notifyDOS;
    }

    /**
     * 根据用户名查询该用户收到的所有通知
     * @param userName
     * @return
     */
    @GetMapping("/all")
    public List<NotifyDO> getAll(@RequestParam String userName) {
        List<NotifyDO> notifyDOS = notifyService.getAll(userName);
        return notifyDOS;
    }
}
