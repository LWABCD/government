package com.ybu.mapper;

import com.ybu.entity.Emailreply;
import com.ybu.entity.EmailreplyExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EmailreplyMapper {
    int countByExample(EmailreplyExample example);

    int deleteByExample(EmailreplyExample example);

    int deleteByPrimaryKey(Integer lerid);

    int insert(Emailreply record);

    int insertSelective(Emailreply record);

    List<Emailreply> selectByExampleWithBLOBs(EmailreplyExample example);

    List<Emailreply> selectByExample(EmailreplyExample example);

    Emailreply selectByPrimaryKey(Integer lerid);

    int updateByExampleSelective(@Param("record") Emailreply record, @Param("example") EmailreplyExample example);

    int updateByExampleWithBLOBs(@Param("record") Emailreply record, @Param("example") EmailreplyExample example);

    int updateByExample(@Param("record") Emailreply record, @Param("example") EmailreplyExample example);

    int updateByPrimaryKeySelective(Emailreply record);

    int updateByPrimaryKeyWithBLOBs(Emailreply record);

    int updateByPrimaryKey(Emailreply record);
}