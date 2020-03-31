package com.ybu.proscenium.service;

import com.ybu.entity.Announcement;
import com.ybu.entity.Governmentwebsite;
import com.ybu.entity.News;

import java.util.List;

public interface IndexService{

    List<Announcement> announcements();

    Announcement announcementDetail(Integer aid);

    List<Governmentwebsite> governmentwebsites();

    List<News> news();

    News newsDetail(Integer nid);
}
