package com.ybu.admin.service;

import com.ybu.entity.Announcement;

import java.util.List;

public interface AnnouncementService{
    List<Announcement> announcements();

    int saveAnnouncement(Announcement announcement,String content);

    int deleteAnnouncement(Integer aid,String contenturl);

    Announcement selectAnnouncement(Integer aid);
}
