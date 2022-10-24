package com.recruit.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.recruit.common.mybatis.Page;
import com.recruit.model.UserDO;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper extends BaseMapper<UserDO> {

    /**
     * 查询用户名为$username的人数
     *
     * @param username 用户名
     * @return 人数
     */
    int selectCountByUsername(String username);

    /**
     * 查询用户id为$id的人数
     *
     * @param id 用户id
     * @return 人数
     */
    int selectCountById(Integer id);

    /**
     * 通过分组id分页获取用户数据
     *
     * @param pager   分页
     * @param groupId 分组id
     * @param rootGroupId 超级用户组id(不返回超级用户组的用户)
     * @return 分页数据
     */
    IPage<UserDO> selectPageByGroupId(Page pager, Integer groupId, Integer rootGroupId);
}
