package com.ybu.proscenium.service.impl;

import com.ybu.entity.Announcement;
import com.ybu.entity.Governmentwebsite;
import com.ybu.entity.News;
import com.ybu.entity.NewsExample;
import com.ybu.mapper.AnnouncementMapper;
import com.ybu.mapper.GovernmentwebsiteMapper;
import com.ybu.mapper.NewsMapper;
import com.ybu.proscenium.service.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IndexServiceImpl implements IndexService{

    @Autowired
    private AnnouncementMapper announcementMapper;
    @Autowired
    private GovernmentwebsiteMapper governmentwebsiteMapper;
    @Autowired
    private NewsMapper newsMapper;

    @Override
    public List<Announcement> announcements() {
        return announcementMapper.selectAllAnnouncements();
    }

    @Override
    public Announcement announcementDetail(Integer aid) {
        Announcement announcement=announcementMapper.selectByPrimaryKey(aid);
        //每点击公告详情一次就把该公告的阅读数加1并保存到数据库中
        announcement.setReadnumber(announcement.getReadnumber()+1);
        announcementMapper.updateByPrimaryKey(announcement);
        return announcement;
    }

    @Override
    public List<Governmentwebsite> governmentwebsites() {
        return governmentwebsiteMapper.selectAllWebsites();
    }

    @Override
    public List<News> news() {
        return newsMapper.selectAllNews();
    }

    @Override
    public News newsDetail(Integer nid) {
        News news=newsMapper.selectByPrimaryKey(nid);
        news.setReadnumber(news.getReadnumber()+1);
        newsMapper.updateByPrimaryKeyWithBLOBs(news);
        return news;
    }
}
