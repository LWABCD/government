package com.ybu.proscenium.service.impl;

import com.ybu.entity.Announcement;
import com.ybu.mapper.AnnouncementMapper;
import com.ybu.proscenium.service.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IndexServiceImpl implements IndexService{

    @Autowired
    private AnnouncementMapper announcementMapper;

    @Override
    public List<Announcement> announcements() {
        return announcementMapper.selectAllAnnouncements();
    }

    @Override
    public Announcement announcementDetail(Integer aid) {
        return announcementMapper.selectByPrimaryKey(aid);
    }
}
