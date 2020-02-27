package com.ybu.admin.controller;

import com.ybu.entity.Announcement;
import com.ybu.entity.Result;
import com.ybu.admin.service.AnnouncementService;
import com.ybu.utils.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/announcement")
public class AnnouncementController{

    @Autowired
    private AnnouncementService announcementService;

    @RequestMapping("/toannouncement")
    public String toAnnouncement(){
        return "admin/announcement";
    }

    @RequestMapping("/toannouncementedit")
    public String toAnnouncementEdit(){
        return "admin/announcementedit";
    }

    @RequestMapping("/announcements")
    @ResponseBody
    public Result announcements(){
        List<Announcement> announcements=announcementService.announcements();
        Result result=new Result();
        result.setCode(0);
        result.setMsg("");
        result.setData(announcements);
        return result;
    }

    @RequestMapping("/saveannouncement")
    @ResponseBody
    public Result saveAnnouncement(Announcement announcement,String content){
        int code=announcementService.saveAnnouncement(announcement,content);
        Result result=new Result();
        result.setCode(code);
        return result;
    }

    @RequestMapping("/announcementdetail")
    public ModelAndView announcementDetail(Integer aid, ModelAndView modelAndView){
        Announcement announcement=announcementService.selectAnnouncement(aid);
        modelAndView.addObject("announcement",announcement);
        String content= FileUtils.readText(announcement.getContenturl());
        modelAndView.addObject("content",content);
        modelAndView.setViewName("admin/announcementedit");
        return modelAndView;
    }

    @RequestMapping("/deleteannouncement")
    @ResponseBody
    public Result deleteAnnouncement(Integer aid,String contenturl){
        int code=announcementService.deleteAnnouncement(aid,contenturl);
        Result result=new Result();
        result.setCode(code);
        return result;
    }
}
