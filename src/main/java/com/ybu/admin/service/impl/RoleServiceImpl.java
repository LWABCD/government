package com.ybu.admin.service.impl;

import com.ybu.admin.service.RoleService;
import com.ybu.constast.SysConstast;
import com.ybu.entity.Menu;
import com.ybu.entity.Result;
import com.ybu.entity.Role;
import com.ybu.entity.RoleExample;
import com.ybu.mapper.MenuMapper;
import com.ybu.mapper.RoleMapper;
import com.ybu.utils.DataGridView;
import com.ybu.utils.TreeNode;
import com.ybu.vo.RoleVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleMapper roleMapper;
	@Autowired
	private MenuMapper menuMapper;

	@Override
	public List<RoleVo> queryAllRole(RoleVo roleVo) {
		List<Role> roles=roleMapper.queryAllRole(roleVo);
		List<RoleVo> roleVos=new ArrayList<>();
		for(Role role:roles){
			RoleVo roleVo1=new RoleVo();
			roleVo1.setRoleid(role.getRoleid());
			roleVo1.setRolename(role.getRolename());
			roleVo1.setRoledesc(role.getRoledesc());
			roleVo1.setUserCount(roleMapper.selectUserCountByRoleid(role.getRoleid()));
			List<String> userNames=roleMapper.selectUserNamesByRoleid(role.getRoleid());
			roleVo1.setUserNames(userNames.toString());
			roleVos.add(roleVo1);
		}
		return roleVos;
	}

	@Override
	public List<TreeNode> initRoleMenuTreeJson(Integer roleid) {
		// 查询所有的可用的菜单
		Menu menu = new Menu();
		menu.setAvailable(SysConstast.AVAILABLE_TRUE);
		List<Menu> allMenu = menuMapper.queryAllMenu(menu);
		// 根据角色ID查询当前角色拥有的菜单
		List<Menu> roleMenu = menuMapper.queryMenuByRoleId(SysConstast.AVAILABLE_TRUE, roleid);

		List<TreeNode> nodes = new ArrayList<>();
		for (Menu m1 : allMenu) {
			String checkArr = SysConstast.CODE_ZERO+"";
			for (Menu m2 : roleMenu) {
				if (m1.getId() == m2.getId()) {
					checkArr = SysConstast.CODE_ONE+"";
					break;
				}
			}
			Integer id = m1.getId();
			Integer pid = m1.getPid();
			String title = m1.getTitle();
			Boolean spread = m1.getSpread() == SysConstast.SPREAD_TRUE ? true : false;
			Boolean last=m1.getPid()==1?false:m1.getPid()==0?false:true;
			nodes.add(new TreeNode(id, pid, title,last,checkArr,spread));
		}
		return nodes;
	}

	@Override
	public void saveRoleMenu(RoleVo roleVo) {
		Integer rid=roleVo.getRoleid();
		Integer [] mids=roleVo.getIds();
		//根据rid删除sys_role_menu里面所有数据
		this.roleMapper.deleteRolMenuByRid(rid);
		//保存角色和菜单的关系
		for (Integer mid : mids) {
			this.roleMapper.insertRoleMenu(rid,mid);
		}
	}

	@Override
	public void insertRole(RoleVo roleVo) {
		roleMapper.insert(roleVo);
	}

	@Override
	public void updateRole(RoleVo roleVo) {
		roleMapper.updateByPrimaryKey(roleVo);
	}

	@Override
	public void deleteBatchRole(Integer[] ids) {
		for(Integer rid:ids){
			roleMapper.deleteByPrimaryKey(rid);
		}
	}

	@Override
	public void deleteRole(Integer roleid) {
		roleMapper.deleteByPrimaryKey(roleid);
	}

	@Override
	public List<Role> searchRole(RoleVo roleVo) {
		return roleMapper.queryAllRole(roleVo);
	}

}
