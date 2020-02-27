package com.ybu.mapper;

import com.ybu.entity.Opengovernment;
import com.ybu.entity.OpengovernmentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OpengovernmentMapper {
    int countByExample(OpengovernmentExample example);

    int deleteByExample(OpengovernmentExample example);

    int deleteByPrimaryKey(Integer oid);

    int insert(Opengovernment record);

    int insertSelective(Opengovernment record);

    List<Opengovernment> selectByExampleWithBLOBs(OpengovernmentExample example);

    List<Opengovernment> selectByExample(OpengovernmentExample example);

    Opengovernment selectByPrimaryKey(Integer oid);

    int updateByExampleSelective(@Param("record") Opengovernment record, @Param("example") OpengovernmentExample example);

    int updateByExampleWithBLOBs(@Param("record") Opengovernment record, @Param("example") OpengovernmentExample example);

    int updateByExample(@Param("record") Opengovernment record, @Param("example") OpengovernmentExample example);

    int updateByPrimaryKeySelective(Opengovernment record);

    int updateByPrimaryKeyWithBLOBs(Opengovernment record);

    int updateByPrimaryKey(Opengovernment record);
}