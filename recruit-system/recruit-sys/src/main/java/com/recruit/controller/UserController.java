package com.recruit.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.recruit.mapper.UserGroupMapper;
import com.recruit.model.UserGroupDO;
import com.recruit.service.MailService;
import io.github.talelin.autoconfigure.exception.NotFoundException;
import io.github.talelin.autoconfigure.exception.ParameterException;
import io.github.talelin.core.annotation.*;
import io.github.talelin.core.token.DoubleJWT;
import io.github.talelin.core.token.Tokens;
import com.recruit.common.LocalUser;
import com.recruit.common.util.ObserverGenerate;
import com.recruit.common.util.SingleUtil;
import com.recruit.dto.user.ChangePasswordDTO;
import com.recruit.dto.user.LoginDTO;
import com.recruit.dto.user.RegisterDTO;
import com.recruit.dto.user.UpdateInfoDTO;
import com.recruit.model.GroupDO;
import com.recruit.model.UserDO;
import com.recruit.service.GroupService;
import com.recruit.service.UserIdentityService;
import com.recruit.service.UserService;
import com.recruit.vo.CreatedVO;
import com.recruit.vo.UpdatedVO;
import com.recruit.vo.UserInfoVO;
import com.recruit.vo.UserPermissionVO;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/recruit/user")
@PermissionModule(value = "用户")
@Validated
public class UserController {
    @Resource
    private UserService userService;
    @Resource
    private GroupService groupService;
    @Resource
    private UserIdentityService userIdentityService;
    @Resource
    private UserGroupMapper userGroupMapper;
    @Resource
    private DoubleJWT jwt;
    @Resource
    private MailService mailService;

    /**
     * 用户注册
     */
    @PostMapping("/register")
    public CreatedVO register(@RequestBody @Validated RegisterDTO validator) {
        CreatedVO result = userService.userDataCheck(validator);
        if(result.getCode()!=400){
            userService.createUser(validator);
//            // 用户注册成功，创建一个该用户对应的观察者类
            ObserverGenerate.generate(validator.getUsername());
        }
        return result;
    }

    /**
     * 用户登陆
     */
    @PostMapping("/login")
    public Tokens login(@RequestBody @Validated LoginDTO validator) {
        UserDO user = userService.getUserByUsername(validator.getUsername());
        if (user == null) {
            throw new NotFoundException(10021);
        }
        boolean valid = userIdentityService.verifyUsernamePassword(
                user.getId(),
                user.getUsername(),
                validator.getPassword());
        if (!valid) {
            throw new ParameterException(10031);
        }
        // 保存当前登录用户到SingleUtil工具类中
        SingleUtil.userDO = user;
        return jwt.generateTokens(user.getId());
    }

    /**
     * 更新用户信息
     */
    @PutMapping
    @LoginRequired
    public UpdatedVO update(@RequestBody @Validated UpdateInfoDTO validator) {
        if (userService.updateUserInfo(validator)){
            return new UpdatedVO(6);
        }
        return new UpdatedVO(400);
    }

    /**
     * 修改密码
     */
    @PutMapping("/change_password")
    @LoginRequired
    public UpdatedVO updatePassword(@RequestBody @Validated ChangePasswordDTO validator) {
        userService.changeUserPassword(validator);
        return new UpdatedVO(4);
    }

    /**
     * 刷新令牌
     */
    @GetMapping("/refresh")
    @RefreshRequired
    public Tokens getRefreshToken() {
        UserDO user = LocalUser.getLocalUser();
        return jwt.generateTokens(user.getId());
    }

    /**
     * 查询拥有权限
     */
    @GetMapping("/permissions")
    @LoginRequired
    public UserPermissionVO getPermissions() {
        UserDO user = LocalUser.getLocalUser();
        boolean admin = groupService.checkIsRootByUserId(user.getId());
        boolean hr = groupService.checkHRExistById(user.getId());
        List<Map<String, List<Map<String, String>>>> permissions = userService.getStructuralUserPermissions(user.getId());
        UserPermissionVO userPermissions = new UserPermissionVO(user, permissions);
        userPermissions.setAdmin(admin);
        userPermissions.setHr(hr);
        return userPermissions;
    }

    /**
     * 查询用户角色
     */
    @GetMapping("/getGroup/{id}")
    @LoginRequired
    public int getUserGroup(@PathVariable Integer id) {
        LambdaQueryWrapper<UserGroupDO> queryWrapper=new QueryWrapper<UserGroupDO>().lambda();
        queryWrapper.eq(UserGroupDO::getUserId,id);
        UserGroupDO userGroupDO = userGroupMapper.selectOne(queryWrapper);
        return userGroupDO.getGroupId();
    }

    /**
     * 查询自己信息
     */
    @LoginRequired
    @GetMapping("/information")
    public UserInfoVO getInformation() {
        UserDO user = LocalUser.getLocalUser();
        List<GroupDO> groups = groupService.getUserGroupsByUserId(user.getId());
        return new UserInfoVO(user, groups);
    }

    /**
     * 请求邮箱验证码
     */
    @RequestMapping(value = "/getMailCode",method = RequestMethod.POST)
    public CreatedVO getMailCode(@RequestBody JSONObject mail){
        return mailService.SendCodeMail(mail.getString("mail"));
    }

    /**
     * 忘记密码
     */
    @RequestMapping(value = "forgot_password",method = RequestMethod.POST)
    public CreatedVO forgotPwd(@RequestBody JSONObject parma){
        return userService.forgotPwd(parma);
    }

    /**
     * 通过id获取到用户的名字和头像
     */
    @RequestMapping(value = "getID_UserData",method = RequestMethod.POST)
    public JSONObject getID_UserData(@RequestBody JSONObject parma){
        return userService.getID_user(parma.getInteger("data"));
    }

}
