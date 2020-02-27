package com.ybu.mapper;

import com.ybu.entity.File;
import com.ybu.entity.FileExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FileMapper {
    int countByExample(FileExample example);

    int deleteByExample(FileExample example);

    int deleteByPrimaryKey(Integer fid);

    int insert(File record);

    int insertSelective(File record);

    List<File> selectByExample(FileExample example);

    File selectByPrimaryKey(Integer fid);

    int updateByExampleSelective(@Param("record") File record, @Param("example") FileExample example);

    int updateByExample(@Param("record") File record, @Param("example") FileExample example);

    int updateByPrimaryKeySelective(File record);

    int updateByPrimaryKey(File record);

    List<File> selectAllFiles();
}