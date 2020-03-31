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
        return announcementMapper.selectByPrimaryKey(aid);
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
        NewsExample example=new NewsExample();
        NewsExample.Criteria criteria=example.createCriteria();
        criteria.andNidEqualTo(nid);
        List<News> news=newsMapper.selectByExampleWithBLOBs(example);
        if(news.size()>0){
            return news.get(0);
        }
        return null;
    }
}
