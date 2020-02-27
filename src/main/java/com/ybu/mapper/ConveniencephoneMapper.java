package com.ybu.mapper;

import com.ybu.entity.Conveniencephone;
import com.ybu.entity.ConveniencephoneExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ConveniencephoneMapper {
    int countByExample(ConveniencephoneExample example);

    int deleteByExample(ConveniencephoneExample example);

    int deleteByPrimaryKey(Integer cid);

    int insert(Conveniencephone record);

    int insertSelective(Conveniencephone record);

    List<Conveniencephone> selectByExample(ConveniencephoneExample example);

    Conveniencephone selectByPrimaryKey(Integer cid);

    int updateByExampleSelective(@Param("record") Conveniencephone record, @Param("example") ConveniencephoneExample example);

    int updateByExample(@Param("record") Conveniencephone record, @Param("example") ConveniencephoneExample example);

    int updateByPrimaryKeySelective(Conveniencephone record);

    int updateByPrimaryKey(Conveniencephone record);
}