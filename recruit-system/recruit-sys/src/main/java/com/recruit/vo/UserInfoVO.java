package com.recruit.vo;

import cn.hutool.core.bean.BeanUtil;
import com.recruit.model.GroupDO;
import com.recruit.model.UserDO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 用户信息 view object
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserInfoVO {

    private Integer id;

    /**
     * 用户名，唯一
     */
    private String username;

    /**
     * 用户昵称
     */
    private String nickname;

    /**
     * 头像url
     */
    private String avatar;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 电话
     */
    private String tel;

    /**
     * 分组
     */
    private List<GroupDO> groups;

    public UserInfoVO(UserDO user, List<GroupDO> groups) {
        BeanUtil.copyProperties(user, this);
        this.groups = groups;
    }
}
