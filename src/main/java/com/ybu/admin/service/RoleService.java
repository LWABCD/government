package com.ybu.admin.service;

import com.ybu.entity.Result;
import com.ybu.entity.Role;
import com.ybu.utils.DataGridView;
import com.ybu.utils.TreeNode;
import com.ybu.vo.RoleVo;

import java.util.List;

/**
 * 角色管理的服务接口
 * @author LJH
 *
 */
public interface RoleService {

	List<RoleVo> queryAllRole(RoleVo roleVo);

	List<TreeNode> initRoleMenuTreeJson(Integer roleid);

	void saveRoleMenu(RoleVo roleVo);

    void insertRole(RoleVo roleVo);

	void updateRole(RoleVo roleVo);

	void deleteBatchRole(Integer[] ids);

	void deleteRole(Integer roleid);

	List<Role> searchRole(RoleVo roleVo);
}