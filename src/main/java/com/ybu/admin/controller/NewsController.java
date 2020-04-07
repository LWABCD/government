package com.ybu.admin.controller;

import com.ybu.admin.service.NewsService;
import com.ybu.entity.News;
import com.ybu.entity.Result;
import com.ybu.vo.NewsVo;
import com.ybu.vo.OpenGovernmentVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/news")
public class NewsController{

    @Autowired
    private NewsService newsService;

    @RequestMapping("/tonews")
    public String toNews(){
        return "admin/news";
    }

    @RequestMapping("/tonewsedit")
    public String toNewsEdit(){
        return "admin/newsedit";
    }

    @RequestMapping("/newsList")
    @ResponseBody
    public Result newsList(NewsVo newsVo){
       return newsService.newsList(newsVo);
    }

    @RequestMapping("/saveNews")
    @ResponseBody
    public Result saveNews(News news){
        int code=newsService.saveNews(news);
        Result result=new Result();
        result.setCode(code);
        return result;
    }

    @RequestMapping("/newsDetail")
    public String newsList(Integer nid, HttpServletRequest request){
        News news=newsService.newDetail(nid);
        request.setAttribute("news", news);
        String newsPicStr=news.getUrl();
        if(newsPicStr!=null&&!"".equals(newsPicStr)){
            String[] newsPics=newsPicStr.split(",");
            request.setAttribute("newsPics", newsPics);
        }
        return "admin/newsedit";
    }

    @RequestMapping("/deleteNews")
    @ResponseBody
    public Result newsList(Integer nid,String url){
        int code=newsService.deleteNews(nid);
        //删除新闻时顺便把该新闻存在硬盘中的图片也一起删除
        String[] imgUrls=url.split(",");
        for(String imgUrl:imgUrls){
            deleteImage(imgUrl);
        }
        Result result = new Result();
        result.setCode(code);
        return result;
    }

    @RequestMapping("/deleteBatchNews")
    @ResponseBody
    public Result deleteBatchNews(NewsVo newsVo) {
        Result result = new Result();
        try {
            newsService.deleteBatchNews(newsVo.getIds());
            result.setMsg("批量删除成功");
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            result.setMsg("批量删除失败");
            return result;
        }
    }

    @RequestMapping("/upload")
    @ResponseBody
    public Result upload(@RequestParam("cmf")CommonsMultipartFile cmf){
        //获取真实文件名
        String originFileName = cmf.getOriginalFilename();
        String fileName= UUID.randomUUID().toString()+originFileName.substring(originFileName.lastIndexOf("."));
        String newFileName="G://governmentfile//file//"+fileName;
        System.out.println(newFileName);
        File file=new File(newFileName);
        //保存文件
        try {
            cmf.transferTo(file);//保存文件
        } catch (IOException e) {
            e.printStackTrace();
        }
        Result result=new Result();
        result.setCode(1);
        Map<String,Object> data=new HashMap<>();
        data.put("src", "http://localhost:8080/governmentfile/file/"+fileName);
        result.setData(data);
        result.setMsg(originFileName);
        return result;
    }

    @RequestMapping("/deleteImage")
    @ResponseBody
    public Result deleteImage(String delimgurl){
        String delfilename="G://governmentfile//file/"+delimgurl.substring(delimgurl.lastIndexOf("/"));
        File file=new File(delfilename);
        Result result=new Result();
        if(file.exists()){
            file.delete();
            result.setCode(1);
        }else{
            result.setCode(0);
            result.setMsg("图片并没有上传成功");
        }
        return result;
    }
}
