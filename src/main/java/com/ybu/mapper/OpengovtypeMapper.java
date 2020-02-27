package com.ybu.mapper;

import com.ybu.entity.Opengovtype;
import com.ybu.entity.OpengovtypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OpengovtypeMapper {
    int countByExample(OpengovtypeExample example);

    int deleteByExample(OpengovtypeExample example);

    int deleteByPrimaryKey(Integer ogtid);

    int insert(Opengovtype record);

    int insertSelective(Opengovtype record);

    List<Opengovtype> selectByExample(OpengovtypeExample example);

    Opengovtype selectByPrimaryKey(Integer ogtid);

    int updateByExampleSelective(@Param("record") Opengovtype record, @Param("example") OpengovtypeExample example);

    int updateByExample(@Param("record") Opengovtype record, @Param("example") OpengovtypeExample example);

    int updateByPrimaryKeySelective(Opengovtype record);

    int updateByPrimaryKey(Opengovtype record);

    List<Opengovtype> selectAllOpengovtype();
}