package com.recruit.service;

import com.recruit.model.NotifyDO;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Eval
 * @since 2022-04-16
 */
public interface NotifyService extends IService<NotifyDO> {

    boolean create(NotifyDO notifyDO);

    List<NotifyDO> get(String userName, String isRead);

    List<NotifyDO> getAll(String userName);

    boolean update(String userName);
}
