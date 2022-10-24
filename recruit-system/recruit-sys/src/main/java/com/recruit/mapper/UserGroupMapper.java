package com.recruit.mapper;

import com.recruit.model.UserGroupDO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserGroupMapper extends BaseMapper<UserGroupDO> {

    int insertBatch(@Param("relations") List<UserGroupDO> relations);
}
