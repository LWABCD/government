package com.ybu.admin.service.impl;

import com.ybu.constast.SysConstast;
import com.ybu.entity.Role;
import com.ybu.entity.RoleExample;
import com.ybu.entity.User;
import com.ybu.entity.UserExample;
import com.ybu.mapper.RoleMapper;
import com.ybu.mapper.UserMapper;
import com.ybu.admin.service.UserService;
import com.ybu.utils.DataGridView;
import com.ybu.vo.UserVo;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper;
	@Autowired
	private RoleMapper roleMapper;

	@Override
	public List<User> login(User user) {
		UserExample userExample=new UserExample();
		UserExample.Criteria criteria=userExample.createCriteria();
		criteria.andUsernameEqualTo(user.getUsername());
        Md5Hash md5HashPassword = new Md5Hash(user.getPassword());
		criteria.andPasswordEqualTo(md5HashPassword.toString());
		List<User> u=userMapper.selectByExample(userExample);
		return u;
	}

	@Override
	public void resetUserPwd(Integer uid) {
		User user = new User();
		user.setUid(uid);
		// 设置默认密码
		user.setPassword(new Md5Hash(SysConstast.USER_DEFAULT_PWD).toString());
		//更新
		this.userMapper.updateByPrimaryKeySelective(user);
	}

	@Override
	public int updateUser(UserVo userVo) {
		return userMapper.updateByPrimaryKey(userVo);
	}

	@Override
	public List<User> users(UserVo userVo) {
		return userMapper.queryAllUser(userVo);
	}

	@Override
	public List<Role> userRoles(Integer uid) {
		return userMapper.selectRoleByUid(uid);
	}

	@Override
	public List<Role> roles() {
		RoleExample example=new RoleExample();
		RoleExample.Criteria criteria=example.createCriteria();
		criteria.andRoleidIsNotNull();
		return roleMapper.selectByExample(example);
	}

	@Override
	public List<Map<String,Object>> initUserRole(Integer uid) {
		//1,查询所有可用的角色
		Role role=new Role();
		role.setAvailable(SysConstast.AVAILABLE_TRUE);
		List<Role> allRole=roleMapper.queryAllRole(role);
		//2,根据用户ID查询已拥有的角色
		List<Role> userRole=this.roleMapper.queryRoleByUid(SysConstast.AVAILABLE_TRUE,uid);

		List<Map<String,Object>> data=new ArrayList<>();
		for (Role r1 : allRole) {
			Boolean LAY_CHECKED=false;
			for (Role r2 : userRole) {
				if(r1.getRoleid()==r2.getRoleid()) {
					LAY_CHECKED=true;
				}
			}
			Map<String, Object> map=new HashMap<String, Object>();

			map.put("roleid", r1.getRoleid());
			map.put("rolename", r1.getRolename());
			map.put("roledesc", r1.getRoledesc());
			map.put("LAY_CHECKED", LAY_CHECKED);
			data.add(map);
		}
		return data;
	}

	@Override
	public void saveUserRole(UserVo userVo) {
		Integer uid = userVo.getUid();
		Integer[] roleIds = userVo.getIds();
		//根据用户id删除sys_role_user里面的数据
		roleMapper.deleteRoleUserByUid(uid);
		//保存关系
		if(roleIds!=null&& roleIds.length>0) {
			for (Integer rid : roleIds) {
				userMapper.insertUserRole(uid,rid);
			}
		}
	}

	@Override
	public void addUser(UserVo userVo) {
		userMapper.insert(userVo);
	}

	@Override
	public void deleteUser(Integer uid) {
		userMapper.deleteByPrimaryKey(uid);
	}

	@Override
	public void deleteBatchUser(Integer[] ids) {
		for(Integer uid:ids){
			userMapper.deleteByPrimaryKey(uid);
		}
	}
}
