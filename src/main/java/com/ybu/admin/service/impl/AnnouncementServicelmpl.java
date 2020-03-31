package com.ybu.admin.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.ybu.entity.Announcement;
import com.ybu.entity.AnnouncementExample;
import com.ybu.entity.LogInfo;
import com.ybu.entity.Result;
import com.ybu.mapper.AnnouncementMapper;
import com.ybu.admin.service.AnnouncementService;
import com.ybu.utils.FileUtils;
import com.ybu.vo.AnnouncementVo;
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
    public Result announcements(AnnouncementVo announcementVo) {
        Page<Object> page= PageHelper.startPage(announcementVo.getPage(), announcementVo.getLimit());
        List<Announcement> data = announcementMapper.queryAllAnnouncement(announcementVo);
        Result result=new Result();
        result.setCount(page.getTotal());
        result.setData(data);
        return result;
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

    @Override
    public void deleteBatchAnnouncement(Integer[] ids) {
        for(Integer aid:ids){
            announcementMapper.deleteByPrimaryKey(aid);
        }
    }
}
