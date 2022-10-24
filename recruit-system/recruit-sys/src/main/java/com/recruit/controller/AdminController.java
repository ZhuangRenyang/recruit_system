package com.recruit.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.recruit.service.PermissionService;
import io.github.talelin.core.annotation.AdminRequired;
import io.github.talelin.core.annotation.Logger;
import io.github.talelin.core.annotation.PermissionMeta;
import io.github.talelin.core.annotation.PermissionModule;
import com.recruit.bo.GroupPermissionBO;
import com.recruit.common.util.PageUtil;
import com.recruit.dto.admin.DispatchPermissionDTO;
import com.recruit.dto.admin.DispatchPermissionsDTO;
import com.recruit.dto.admin.NewGroupDTO;
import com.recruit.dto.admin.RemovePermissionsDTO;
import com.recruit.dto.admin.ResetPasswordDTO;
import com.recruit.dto.admin.UpdateGroupDTO;
import com.recruit.dto.admin.UpdateUserInfoDTO;
import com.recruit.model.GroupDO;
import com.recruit.model.PermissionDO;
import com.recruit.model.UserDO;
import com.recruit.service.AdminService;
import com.recruit.service.GroupService;
import com.recruit.vo.CreatedVO;
import com.recruit.vo.DeletedVO;
import com.recruit.vo.PageResponseVO;
import com.recruit.vo.UpdatedVO;
import com.recruit.vo.UserInfoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Positive;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Validated
@RestController
@RequestMapping("/recruit/admin")
@PermissionModule(value = "管理员")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private GroupService groupService;

    @GetMapping("/permission")
    @PermissionMeta(value = "查询所有可分配的权限")
    public Map<String, List<PermissionDO>> getAllPermissions() {
        return adminService.getAllStructuralPermissions();
    }

    @GetMapping("/users")
    @PermissionMeta(value = "查询所有用户")
    public PageResponseVO<UserInfoVO> getUsers(
            @RequestParam(name = "group_id", required = false)
            @Min(value = 1, message = "{group.id.positive}") Integer groupId,
            @RequestParam(name = "count", required = false, defaultValue = "10")
            @Min(value = 1, message = "{page.count.min}")
            @Max(value = 30, message = "{page.count.max}") Integer count,
            @RequestParam(name = "page", required = false, defaultValue = "0")
            @Min(value = 0, message = "{page.number.min}") Integer page) {
        IPage<UserDO> iPage = adminService.getUserPageByGroupId(groupId, count, page);
        List<UserInfoVO> userInfos = iPage.getRecords().stream().map(user -> {
            List<GroupDO> groups = groupService.getUserGroupsByUserId(user.getId());
            return new UserInfoVO(user, groups);
        }).collect(Collectors.toList());
        return PageUtil.build(iPage, userInfos);
    }


    @PutMapping("/user/{id}/password")
    @PermissionMeta(value = "修改用户密码")
    public UpdatedVO changeUserPassword(@PathVariable @Positive(message = "{id.positive}") Integer id, @RequestBody @Validated ResetPasswordDTO validator) {
        adminService.changeUserPassword(id, validator);
        return new UpdatedVO(4);
    }


    @DeleteMapping("/user/{id}")
    @PermissionMeta(value = "删除用户")
    public DeletedVO deleteUser(@PathVariable @Positive(message = "{id.positive}") Integer id) {
        adminService.deleteUser(id);
        return new DeletedVO(5);
    }


    @PutMapping("/user/{id}")
    @PermissionMeta(value = "管理员更新用户信息")
    public UpdatedVO updateUser(@PathVariable @Positive(message = "{id.positive}") Integer id, @RequestBody @Validated UpdateUserInfoDTO validator) {
        adminService.updateUserInfo(id, validator);
        return new UpdatedVO(6);
    }


    @GetMapping("/group")
    @PermissionMeta(value = "查询所有权限组及其权限")
    public PageResponseVO<GroupDO> getGroups(
            @RequestParam(name = "count", required = false, defaultValue = "10")
            @Min(value = 1, message = "{page.count.min}")
            @Max(value = 30, message = "{page.count.max}") Integer count,
            @RequestParam(name = "page", required = false, defaultValue = "0")
            @Min(value = 0, message = "{page.number.min}") Integer page) {
        IPage<GroupDO> iPage = adminService.getGroupPage(page, count);
        return PageUtil.build(iPage);
    }


    @GetMapping("/group/all")
    @PermissionMeta(value = "查询所有权限组")
    public List<GroupDO> getAllGroup() {
        return adminService.getAllGroups();
    }


    @GetMapping("/group/{id}")
    @PermissionMeta(value = "查询一个权限组及其权限")
    public GroupPermissionBO getGroup(@PathVariable @Positive(message = "{id.positive}") Integer id) {
        return adminService.getGroup(id);
    }


    @PostMapping("/group")
    @PermissionMeta(value = "新建权限组")
    public CreatedVO createGroup(@RequestBody @Validated NewGroupDTO validator) {
        adminService.createGroup(validator);
        return new CreatedVO(15);
    }

    @PutMapping("/group/{id}")
    @PermissionMeta(value = "更新一个权限组")
    public UpdatedVO updateGroup(@PathVariable @Positive(message = "{id.positive}") Integer id,
                                 @RequestBody @Validated UpdateGroupDTO validator) {
        adminService.updateGroup(id, validator);
        return new UpdatedVO(7);
    }


    @DeleteMapping("/group/{id}")
    @PermissionMeta(value = "删除一个权限组")
    public DeletedVO deleteGroup(@PathVariable @Positive(message = "{id.positive}") Integer id) {
        adminService.deleteGroup(id);
        return new DeletedVO(8);
    }

    @PostMapping("/permission/dispatch")
    @PermissionMeta(value = "分配单个权限")
    public CreatedVO dispatchPermission(@RequestBody @Validated DispatchPermissionDTO validator) {
        adminService.dispatchPermission(validator);
        return new CreatedVO(9);
    }


    @PostMapping("/permission/dispatch/batch")
    @PermissionMeta(value = "分配多个权限")
    public CreatedVO dispatchPermissions(@RequestBody @Validated DispatchPermissionsDTO validator) {
        adminService.dispatchPermissions(validator);
        return new CreatedVO(9);
    }


    @PostMapping("/permission/remove")
    @PermissionMeta(value = "删除多个权限")
    public DeletedVO removePermissions(@RequestBody @Validated RemovePermissionsDTO validator) {
        adminService.removePermissions(validator);
        return new DeletedVO(10);
    }

}
