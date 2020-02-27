package com.ybu.admin.service.impl;

import com.ybu.entity.User;
import com.ybu.entity.UserExample;
import com.ybu.mapper.UserMapper;
import com.ybu.admin.service.UserService;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper;

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
	public void resetUserPwd(Integer userid) {

	}

	@Override
	public int updateUser(User user) {
		return userMapper.updateByPrimaryKey(user);
	}
}
