package com.ybu.mapper;

import com.ybu.entity.Governmentwebsite;
import com.ybu.entity.GovernmentwebsiteExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface GovernmentwebsiteMapper {
    int countByExample(GovernmentwebsiteExample example);

    int deleteByExample(GovernmentwebsiteExample example);

    int deleteByPrimaryKey(Integer gid);

    int insert(Governmentwebsite record);

    int insertSelective(Governmentwebsite record);

    List<Governmentwebsite> selectByExample(GovernmentwebsiteExample example);

    Governmentwebsite selectByPrimaryKey(Integer gid);

    int updateByExampleSelective(@Param("record") Governmentwebsite record, @Param("example") GovernmentwebsiteExample example);

    int updateByExample(@Param("record") Governmentwebsite record, @Param("example") GovernmentwebsiteExample example);

    int updateByPrimaryKeySelective(Governmentwebsite record);

    int updateByPrimaryKey(Governmentwebsite record);

    List<Governmentwebsite> selectAllWebsites();
}