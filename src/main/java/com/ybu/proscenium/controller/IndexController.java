package com.ybu.proscenium.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ybu.admin.service.AnnouncementService;
import com.ybu.entity.Announcement;
import com.ybu.entity.Result;
import com.ybu.proscenium.service.IndexService;
import com.ybu.utils.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.constraints.Max;
import java.util.List;

@Controller
@RequestMapping("/index")
public class IndexController{

    @Autowired
    private IndexService indexService;

    @RequestMapping("/toindex")
    public String toIndex(){
        return "proscenium/index";
    }

    @RequestMapping("/toallAnnouncement")
    public String toAllAnnouncement(){
        return "proscenium/allAnnouncement";
    }

    @RequestMapping("/announcements")
    @ResponseBody
    public Result announcements(String pageNow, String tiaojian) {
        if((tiaojian == null || "".equals(tiaojian))&&(pageNow == null || "".equals(pageNow))){
            List<Announcement> announcements = indexService.announcements();
            Result result=new Result();
            result.setData(announcements);
            return result;
        }
        if (tiaojian == null || "".equals(tiaojian)) {
            //获取页码
            if (pageNow == null && "".equals(pageNow)) {
                pageNow = "1";
            }
            PageHelper.startPage(Integer.parseInt(pageNow), 5);
            List<Announcement> announcements = indexService.announcements();
            PageInfo<Announcement> pageInfo = new PageInfo<>(announcements);
            Result<PageInfo<Announcement>> result = new Result<>();
            result.setCode(announcements == null ? 1 : 0);
            result.setData(pageInfo);
            result.setCount(pageInfo.getTotal());
            System.out.println(result);
            return result;
        } else {
            if (pageNow == null && "".equals(pageNow)) {
                pageNow = "1";
            }
            PageHelper.startPage(Integer.parseInt(pageNow), 5);
            List<Announcement> announcements = indexService.announcements();
            PageInfo<Announcement> pageInfo = new PageInfo<>(announcements);
            Result<PageInfo<Announcement>> result = new Result<>();
            result.setCode(announcements == null ? 1 : 0);
            result.setData(pageInfo);
            result.setCount(pageInfo.getTotal());
            System.out.println(result);
            return result;
        }
    }

    @RequestMapping("/announcementDetail")
    public ModelAndView announcements(Integer aid, ModelAndView modelAndView){
        Announcement announcement=indexService.announcementDetail(aid);
        modelAndView.addObject("announcement",announcement);
        String content= FileUtils.readText(announcement.getContenturl());
        modelAndView.addObject("content",content);
        modelAndView.setViewName("proscenium/announcementDetail");
        return modelAndView;
    }
}
