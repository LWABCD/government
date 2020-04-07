package com.ybu.admin.service;

import com.ybu.entity.Role;
import com.ybu.entity.User;
import com.ybu.utils.DataGridView;
import com.ybu.vo.UserVo;

import java.util.List;
import java.util.Map;

/**
 * 用户服务接口
 * @author LJH
 *
 */
public interface UserService {

	List<User> login(User user);
	
	/**
	 * 重置密码
	 * @param userid
	 */
	public void resetUserPwd(Integer uid);

	int updateUser(User user);

    List<User> users(UserVo userVo);

	List<Role> userRoles(Integer uid);

	List<Role> roles();

    List<Map<String,Object>> initUserRole(Integer uid);

	void saveUserRole(UserVo userVo);

	void addUser(UserVo userVo);

	void deleteUser(Integer uid);

	void deleteBatchUser(Integer[] ids);
}
