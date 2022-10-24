package com.recruit.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.recruit.common.mybatis.Page;
import com.recruit.mapper.LogMapper;
import com.recruit.model.LogDO;
import com.recruit.service.LogService;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;

@Service
public class LogServiceImpl extends ServiceImpl<LogMapper, LogDO> implements LogService {

    @Override
    public IPage<LogDO> getLogPage(Integer page, Integer count, String name, Date start, Date end) {
        Page<LogDO> pager = new Page<>(page, count);
//        IPage<LogDO> iPage = this.baseMapper.findLogsByUsernameAndRange(pager, name, start, end);
        LambdaQueryWrapper<LogDO> lq=new LambdaQueryWrapper<>();
        if(!StringUtils.isEmpty(name)){
            lq.eq(LogDO::getUsername,name);
        }
        if(!StringUtils.isEmpty(start)&&!StringUtils.isEmpty(end)){
            lq.gt(LogDO::getCreateTime,start);
            lq.lt(LogDO::getCreateTime,end);
        }
        lq.orderByDesc(LogDO::getCreateTime);
        IPage<LogDO> logDOIPage = this.baseMapper.selectPage(pager, lq);
        return logDOIPage;
    }

    @Override
    public IPage<LogDO> searchLogPage(Integer page, Integer count, String name, String keyword, Date start, Date end) {
        Page<LogDO> pager = new Page<>(page, count);
        IPage<LogDO> iPage = this.baseMapper.searchLogsByUsernameAndKeywordAndRange(pager, name, "%" + keyword + "%", start, end);
        return iPage;
    }

    @Override
    public IPage<String> getUserNamePage(Integer page, Integer count) {
        Page<LogDO> pager = new Page<>(page, count);
        IPage<String> iPage = this.baseMapper.getUserNames(pager);
        return iPage;
    }

    @Override
    public boolean createLog(String message, String permission, Integer userId, String username, String method, String path, Integer status) {
        LogDO record = LogDO.builder()
                .message(message)
                .userId(userId)
                .username(username)
                .statusCode(status)
                .method(method)
                .path(path)
                .build();
        if (permission != null) {
            record.setPermission(permission);
        }
        record.setCreateTime(new Date());
        return this.baseMapper.insert(record) > 0;
    }
}
