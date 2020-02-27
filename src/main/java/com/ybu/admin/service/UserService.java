package com.ybu.admin.service;

import com.ybu.entity.User;
import com.ybu.utils.DataGridView;
import com.ybu.vo.UserVo;

import java.util.List;

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
	public void resetUserPwd(Integer userid);

	int updateUser(User user);
}
