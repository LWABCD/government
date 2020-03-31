package com.ybu.mapper;

import com.ybu.entity.Role;
import com.ybu.entity.User;
import com.ybu.entity.UserExample;
import java.util.List;

import com.ybu.vo.UserVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

public interface UserMapper{
    int countByExample(UserExample example);

    int deleteByExample(UserExample example);

    int deleteByPrimaryKey(Integer uid);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

    User selectByPrimaryKey(Integer uid);

    int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

    int updateByExample(@Param("record") User record, @Param("example") UserExample example);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User login(User user);

    List<Role> selectRoleByUid(Integer uid);

    void insertUserRole(@Param("uid") Integer uid,@Param("rid") Integer rid);

    List<User> queryAllUser(UserVo userVo);
}