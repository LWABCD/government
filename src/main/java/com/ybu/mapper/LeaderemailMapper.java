package com.ybu.mapper;

import com.ybu.entity.Leaderemail;
import com.ybu.entity.LeaderemailExample;
import java.util.List;

import com.ybu.vo.LeaderEmailVo;
import org.apache.ibatis.annotations.Param;

public interface LeaderemailMapper {
    int countByExample(LeaderemailExample example);

    int deleteByExample(LeaderemailExample example);

    int deleteByPrimaryKey(Integer leid);

    int insert(Leaderemail record);

    int insertSelective(Leaderemail record);

    List<Leaderemail> selectByExampleWithBLOBs(LeaderemailExample example);

    List<Leaderemail> selectByExample(LeaderemailExample example);

    Leaderemail selectByPrimaryKey(Integer leid);

    int updateByExampleSelective(@Param("record") Leaderemail record, @Param("example") LeaderemailExample example);

    int updateByExampleWithBLOBs(@Param("record") Leaderemail record, @Param("example") LeaderemailExample example);

    int updateByExample(@Param("record") Leaderemail record, @Param("example") LeaderemailExample example);

    int updateByPrimaryKeySelective(Leaderemail record);

    int updateByPrimaryKeyWithBLOBs(Leaderemail record);

    int updateByPrimaryKey(Leaderemail record);

    int updateStatus(Integer leid);

    List<Leaderemail> queryAllLeaderemail(LeaderEmailVo leaderEmailVo);
}