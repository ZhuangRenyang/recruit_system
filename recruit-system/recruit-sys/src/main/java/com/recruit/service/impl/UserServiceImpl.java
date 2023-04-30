package com.recruit.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.recruit.common.observer.user.user;
import com.recruit.service.*;
import com.recruit.vo.CreatedVO;
import io.github.talelin.autoconfigure.exception.FailedException;
import io.github.talelin.autoconfigure.exception.ForbiddenException;
import io.github.talelin.autoconfigure.exception.NotFoundException;
import io.github.talelin.autoconfigure.exception.ParameterException;
import com.recruit.common.LocalUser;
import com.recruit.common.enumeration.GroupLevelEnum;
import com.recruit.common.mybatis.Page;
import com.recruit.dto.user.ChangePasswordDTO;
import com.recruit.dto.user.RegisterDTO;
import com.recruit.dto.user.UpdateInfoDTO;
import com.recruit.mapper.UserGroupMapper;
import com.recruit.mapper.UserMapper;
import com.recruit.model.GroupDO;
import com.recruit.model.PermissionDO;
import com.recruit.model.UserDO;
import com.recruit.model.UserGroupDO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@Slf4j
public class UserServiceImpl extends ServiceImpl<UserMapper, UserDO> implements UserService {

    @Resource
    private UserIdentityService userIdentityService;

    @Resource
    private GroupService groupService;

    @Resource
    private PermissionService permissionService;

    @Resource
    private UserGroupMapper userGroupMapper;

    @Resource
    private  UserMapper userMapper;

    @Resource
    RedisService redisService;

    @Transactional
    @Override
    public UserDO createUser(RegisterDTO dto) {
        log.info("注册数据:{}",dto);
        boolean exist = this.checkUserExistByUsername(dto.getUsername());
        if (exist) {
            throw new ForbiddenException(10071);
        }
        if (StrUtil.isNotBlank(dto.getEmail())) {
            exist = this.checkUserExistByEmail(dto.getEmail());
            if (exist) {
                throw new ForbiddenException(10076);
            }
        } else {
            // bug 前端如果传入的email为 "" 时，由于数据库中存在""的email，会报duplication错误
            // 所以如果email为blank，必须显示设置为 null
            dto.setEmail(null);
        }
        UserDO user = new UserDO();

        BeanUtil.copyProperties(dto, user);
        log.info("用户id:{},用户名称:{},用户全部信息:{}",user.getId(),user.getUsername(),user);
        this.baseMapper.insert(user);
        if (dto.getGroupIds() != null && !dto.getGroupIds().isEmpty()) {
            log.info("------------------dto.getGroupIds() != null && !dto.getGroupIds().isEmpty()");
            checkGroupsValid(dto.getGroupIds());
            checkGroupsExist(dto.getGroupIds());
            List<UserGroupDO> relations = dto.getGroupIds()
                    .stream()
                    .map(groupId -> new UserGroupDO(user.getId(), groupId))
                    .collect(Collectors.toList());
            userGroupMapper.insertBatch(relations);
        } else {
            // id为2的分组为游客分组
            log.info("id为2的分组为游客分组");
            Integer guestGroupId = groupService.getParticularGroupIdByLevel(GroupLevelEnum.GUEST);
            UserGroupDO relation = new UserGroupDO(user.getId(), guestGroupId);
            userGroupMapper.insert(relation);
        }
        // 密码加密
        userIdentityService.createUsernamePasswordIdentity(user.getId(), dto.getUsername(), dto.getPassword());
        return user;
    }

    /**
     * 检测数据合法性
     * @param validator
     * @return CreatedVO
     */
    @Override
    public CreatedVO userDataCheck(RegisterDTO validator) {
        // 先判断元素是否有空
        if(validator.getUsername().isEmpty() || validator.getNickname().isEmpty() || validator.getGroupIds().isEmpty()
        || validator.getEmail().isEmpty() || validator.getTel().isEmpty() || validator.getPassword().isEmpty()){
            return new CreatedVO(400,"填写的账号内容有误,请检查");
        }
        // 判断验证码是否存在
        if(validator.getVer_code().isEmpty() || redisService.getMailCode(validator.getVer_code()) == null){
            return new CreatedVO(400,"无效验证码");
        }
        QueryWrapper wrapper = new QueryWrapper<>().eq("username",validator.getUsername().replace(" ","")).or().eq(
                "email",validator.getEmail().replace(" ","")).or().eq(
                "nickname",validator.getNickname().replace(" ",""));

        List<UserDO> users = userMapper.selectList(wrapper);
        for (UserDO u : users){
            if (u.getUsername().equalsIgnoreCase(validator.getUsername())){
                return new CreatedVO(400,"用户已存在,请更换其他账号进行注册");
            }
            if (u.getEmail().equals(validator.getEmail())){
                return new CreatedVO(400,"邮箱已被使用，请重新填入新的邮箱");
            }
            if (u.getNickname().equalsIgnoreCase(validator.getNickname())){
                return new CreatedVO(400,"昵称已被使用,请重新填入新的昵称");
            }
        }
        // 如果检测都通过了, 那么将这个验证码删除,并允许注册
        redisService.delMailCode(validator.getVer_code());
        return new CreatedVO(200);
    }

    @Transactional
    @Override
    public boolean updateUserInfo(UpdateInfoDTO dto) {
        // 判断数据库内是否已经存在相似的名字, 不区分大小写
        UserDO user = LocalUser.getLocalUser();
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("nickname",user.getNickname());

        if (userMapper.selectCount(wrapper)>1){
            return false;
        }
        if (StrUtil.isNotBlank(dto.getUsername())) {
            boolean exist = this.checkUserExistByUsername(dto.getUsername());
            if (exist) {
                throw new ForbiddenException(10071);
            }
            user.setUsername(dto.getUsername());
            userIdentityService.changeUsername(user.getId(), dto.getUsername());
        }
        BeanUtil.copyProperties(dto, user);
        this.baseMapper.updateById(user);
        return true;
    }

    @Override
    public UserDO changeUserPassword(ChangePasswordDTO dto) {
        UserDO user = LocalUser.getLocalUser();
        boolean valid = userIdentityService.verifyUsernamePassword(user.getId(), user.getUsername(), dto.getOldPassword());
        if (!valid) {
            throw new ParameterException(10032);
        }
        valid = userIdentityService.changePassword(user.getId(), dto.getNewPassword());
        if (!valid) {
            throw new FailedException(10011);
        }
        return user;
    }

    @Override
    public List<GroupDO> getUserGroups(Integer userId) {
        return groupService.getUserGroupsByUserId(userId);
    }

    @Override
    public List<Map<String, List<Map<String, String>>>> getStructuralUserPermissions(Integer userId) {
        List<PermissionDO> permissions = getUserPermissions(userId);
        return permissionService.structuringPermissions(permissions);
    }

    @Override
    public List<PermissionDO> getUserPermissions(Integer userId) {
        // 查找用户搜索分组，查找分组下的所有权限
        List<Integer> groupIds = groupService.getUserGroupIdsByUserId(userId);
        if (groupIds == null || groupIds.size() == 0) {
            return new ArrayList<>();
        }
        return permissionService.getPermissionByGroupIds(groupIds);
    }

    @Override
    public List<PermissionDO> getUserPermissionsByModule(Integer userId, String module) {
        List<Integer> groupIds = groupService.getUserGroupIdsByUserId(userId);
        if (groupIds == null || groupIds.size() == 0) {
            return new ArrayList<>();
        }
        return permissionService.getPermissionByGroupIdsAndModule(groupIds, module);
    }

    @Override
    public UserDO getUserByUsername(String username) {
        QueryWrapper<UserDO> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(UserDO::getUsername, username);
        return this.getOne(wrapper);
    }

    @Override
    public boolean checkUserExistByUsername(String username) {
        int rows = this.baseMapper.selectCountByUsername(username);
        return rows > 0;
    }

    @Override
    public boolean checkUserExistByEmail(String email) {
        QueryWrapper<UserDO> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(UserDO::getEmail, email);
        int rows = this.baseMapper.selectCount(wrapper);
        return rows > 0;
    }

    @Override
    public boolean checkUserExistById(Integer id) {
        int rows = this.baseMapper.selectCountById(id);
        return rows > 0;
    }

    @Override
    public IPage<UserDO> getUserPageByGroupId(Page<UserDO> pager, Integer groupId) {
        Integer rootGroupId = groupService.getParticularGroupIdByLevel(GroupLevelEnum.ROOT);
        return this.baseMapper.selectPageByGroupId(pager, groupId, rootGroupId);
    }

    @Override
    public Integer getRootUserId() {
        Integer rootGroupId = groupService.getParticularGroupIdByLevel(GroupLevelEnum.ROOT);
        QueryWrapper<UserGroupDO> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(UserGroupDO::getGroupId, rootGroupId);
        UserGroupDO userGroupDO = userGroupMapper.selectOne(wrapper);
        return userGroupDO == null ? 0 : userGroupDO.getUserId();
    }

    @Override
    public UserDO getUserByNickname(String nickName) {
        QueryWrapper<UserDO> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(UserDO::getNickname, nickName);
        return this.getOne(wrapper);
    }

    @Override
    public CreatedVO forgotPwd(JSONObject param) {
        JSONObject data = param.getJSONObject("data");
        if(data.getString("username").isEmpty() || data.getString("password").isEmpty() ||
        data.getString("email").isEmpty() || data.getString("ver_code").isEmpty()){
            return new CreatedVO(400,"提交的内容不能有空");
        }
        // 判断是否有这个账号
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("username",data.getString("username"));

        UserDO user = userMapper.selectOne(wrapper);
        // 判断用户填写的邮箱是否是注册时填写的邮箱,以及验证码是否存在
        if(user == null || !user.getEmail().equals(data.getString("email")) || redisService.getMailCode(data.getString("ver_code"))==null){
            return new CreatedVO(400,"重置密码错误,请确保用户名,邮箱或验证码正确");
        }
        // 删除对应的验证码
        redisService.delMailCode(data.getString("ver_code"));
        boolean valid = userIdentityService.changePassword(user.getId(), data.getString("password"));
        if (!valid) {
            return new CreatedVO(404,"重置密码失败");
        }
        return new CreatedVO(200,"重置密码成功");
    }

//    @Override
//    public JSONObject getById(Integer id) {
//        QueryWrapper<UserDO> queryWrapper=new QueryWrapper<>();
//        queryWrapper.lambda().eq(UserDO::getId,id);
//        UserDO userDO = userMapper.selectOne(queryWrapper);
//        JSONObject user = new JSONObject();
//        // 只返回名字和头像
//        user.put("name",userDO.getNickname());
//        user.put("avatar",userDO.getAvatar());
//        return user;
//    }
    @Override
    public JSONObject getID_user(Integer id) {
        QueryWrapper<UserDO> queryWrapper=new QueryWrapper<>();
        queryWrapper.lambda().eq(UserDO::getId,id);
        UserDO userDO = userMapper.selectOne(queryWrapper);
        JSONObject user = new JSONObject();
        // 只返回名字和头像
        user.put("name",userDO.getNickname());
        if(userDO.getAvatar()!=null){
            user.put("avatar","http://localhost:5000/assets/"+userDO.getAvatar());
        }else{
            user.put("avatar",null);
        }
        return user;
    }

    private void checkGroupsExist(List<Integer> ids) {
        for (Integer id : ids) {
            if (!groupService.checkGroupExistById(id)) {
                throw new NotFoundException(10023);
            }
        }
    }

    private void checkGroupsValid(List<Integer> ids) {
        Integer rootGroupId = groupService.getParticularGroupIdByLevel(GroupLevelEnum.ROOT);
        boolean anyMatch = ids.stream().anyMatch(it -> it.equals(rootGroupId));
        if (anyMatch) {
            throw new ForbiddenException(10073);
        }
    }
}
