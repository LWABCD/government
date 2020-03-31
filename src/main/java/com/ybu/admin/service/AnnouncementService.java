package com.ybu.admin.service;

import com.ybu.entity.Announcement;
import com.ybu.entity.Result;
import com.ybu.vo.AnnouncementVo;

import java.util.List;

public interface AnnouncementService{
    Result announcements(AnnouncementVo announcementVo);

    int saveAnnouncement(Announcement announcement,String content);

    int deleteAnnouncement(Integer aid,String contenturl);

    Announcement selectAnnouncement(Integer aid);

    void deleteBatchAnnouncement(Integer[] ids);
}
