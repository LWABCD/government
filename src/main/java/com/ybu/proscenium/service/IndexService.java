package com.ybu.proscenium.service;

import com.ybu.entity.Announcement;

import java.util.List;

public interface IndexService{

    List<Announcement> announcements();

    Announcement announcementDetail(Integer aid);
}
