package com.ybu.mapper;

import com.ybu.entity.Announcement;
import com.ybu.entity.AnnouncementExample;
import java.util.List;

import com.ybu.vo.AnnouncementVo;
import org.apache.ibatis.annotations.Param;

public interface AnnouncementMapper {
    int countByExample(AnnouncementExample example);

    int deleteByExample(AnnouncementExample example);

    int deleteByPrimaryKey(Integer aid);

    int insert(Announcement record);

    int insertSelective(Announcement record);

    List<Announcement> selectByExample(AnnouncementExample example);

    Announcement selectByPrimaryKey(Integer aid);

    int updateByExampleSelective(@Param("record") Announcement record, @Param("example") AnnouncementExample example);

    int updateByExample(@Param("record") Announcement record, @Param("example") AnnouncementExample example);

    int updateByPrimaryKeySelective(Announcement record);

    int updateByPrimaryKey(Announcement record);

    List<Announcement> selectAllAnnouncements();

    List<Announcement> queryAllAnnouncement(AnnouncementVo announcementVo);
}