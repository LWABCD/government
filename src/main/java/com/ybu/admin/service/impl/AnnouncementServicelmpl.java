package com.ybu.admin.service.impl;

import com.ybu.entity.Announcement;
import com.ybu.mapper.AnnouncementMapper;
import com.ybu.admin.service.AnnouncementService;
import com.ybu.utils.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class AnnouncementServicelmpl implements AnnouncementService{

    @Autowired
    private AnnouncementMapper announcementMapper;

    @Override
    public List<Announcement> announcements() {
        return announcementMapper.selectAllAnnouncements();
    }

    @Override
    public int saveAnnouncement(Announcement announcement,String content) {
        announcement.setUpdatetime(new Date());
        if(announcement.getAid()==null){
            announcement.setCreatetime(new Date());
            announcement.setReadnumber(0);
            String textFilePath="text//"+UUID.randomUUID().toString()+".txt";
            FileUtils.saveText(content,textFilePath);
            announcement.setContenturl(textFilePath);
            return announcementMapper.insert(announcement);
        }else{
            String textFilePath=announcement.getContenturl();
            if(textFilePath==null||"".equals(textFilePath)){
                textFilePath="text//"+UUID.randomUUID().toString()+".txt";
                announcement.setContenturl(textFilePath);
            }
            FileUtils.saveText(content,textFilePath);
            return announcementMapper.updateByPrimaryKey(announcement);
        }
    }

    @Override
    public int deleteAnnouncement(Integer aid,String contenturl) {
        String textFilePath="G://governmentfile//"+contenturl;
        File file=new File(textFilePath);
        if(file.exists()){
            file.delete();
        }
        return announcementMapper.deleteByPrimaryKey(aid);
    }

    @Override
    public Announcement selectAnnouncement(Integer aid) {
        return announcementMapper.selectByPrimaryKey(aid);
    }
}
