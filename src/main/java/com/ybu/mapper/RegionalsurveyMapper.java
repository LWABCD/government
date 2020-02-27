package com.ybu.mapper;

import com.ybu.entity.Regionalsurvey;
import com.ybu.entity.RegionalsurveyExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface RegionalsurveyMapper {
    int countByExample(RegionalsurveyExample example);

    int deleteByExample(RegionalsurveyExample example);

    int deleteByPrimaryKey(Integer rid);

    int insert(Regionalsurvey record);

    int insertSelective(Regionalsurvey record);

    List<Regionalsurvey> selectByExample(RegionalsurveyExample example);

    Regionalsurvey selectByPrimaryKey(Integer rid);

    int updateByExampleSelective(@Param("record") Regionalsurvey record, @Param("example") RegionalsurveyExample example);

    int updateByExample(@Param("record") Regionalsurvey record, @Param("example") RegionalsurveyExample example);

    int updateByPrimaryKeySelective(Regionalsurvey record);

    int updateByPrimaryKey(Regionalsurvey record);
}