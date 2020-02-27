package com.ybu.proscenium.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ybu.entity.Announcement;
import com.ybu.entity.File;
import com.ybu.entity.Result;
import com.ybu.proscenium.service.PFileService;
import com.ybu.utils.FileDownload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/pFile")
public class PFileController{

    @Autowired
    private PFileService pFileService;

    @RequestMapping("/toFileDownload")
    public String toFileDownload(){
        return "proscenium/fileDownload";
    }

    @RequestMapping("/files")
    @ResponseBody
    public Result files(String pageNow) {
        //获取页码
        if (pageNow == null && "".equals(pageNow)) {
            pageNow = "1";
        }
        PageHelper.startPage(Integer.parseInt(pageNow), 5);
        List<File> files = pFileService.files();
        PageInfo<File> pageInfo = new PageInfo<>(files);
        Result<PageInfo<File>> result = new Result<>();
        result.setCode(files == null ? 1 : 0);
        result.setData(pageInfo);
        result.setCount(pageInfo.getTotal());
        return result;
    }

    @RequestMapping("/download")
    public void download(HttpServletResponse response, HttpServletRequest httpServletRequest) {
        String url = httpServletRequest.getHeader("url");
        String[] strArray=url.split("/");
        String path="G:";
        for(int i=1;i<strArray.length;i++){
            path+="//"+strArray[i];
        }
        FileDownload.download2(path, response);
    }
}
