package com.ybu.admin.controller;

import com.ybu.entity.File;
import com.ybu.entity.Result;
import com.ybu.admin.service.FileService;
import com.ybu.vo.AnnouncementVo;
import com.ybu.vo.FileVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/file")
public class FileController{

    @Autowired
    private FileService fileService;

    @RequestMapping("/tofile")
    public String toFile(){
        return "admin/file";
    }

    @RequestMapping("/files")
    @ResponseBody
    public Result files(FileVo fileVo){
        return fileService.files(fileVo);
    }

    @RequestMapping("/upload")
    @ResponseBody
    public Result upload(@RequestParam("cmf") CommonsMultipartFile cmf){
        //获取真实文件名
        String fileName =cmf.getOriginalFilename();
        String fileType=fileName.substring(fileName.lastIndexOf("."));
        if(".png".equals(fileType)||".jpg".equals(fileType)){
            fileName= UUID.randomUUID().toString()+fileType;
        }
        String newFileName="G://governmentfile//file//"+fileName;
        java.io.File file=new java.io.File(newFileName);
        //保存文件
        try {
            cmf.transferTo(file);//保存文件
        } catch (IOException e) {
            e.printStackTrace();
        }
        Result result=new Result();
        result.setCode(0);
        result.setMsg("");
        Map<String,Object> data=new HashMap<>();
        data.put("url", "localhost:8080/governmentfile/file/"+fileName);
        result.setData(data);
        return result;
    }

    @RequestMapping("/savefile")
    public String saveFile(File file){
        file.setCreatetime(new Date());
        int code=fileService.saveFile(file);
        return "admin/file";
    }

    @RequestMapping("/deletefile")
    @ResponseBody
    public Result deleteFile(FileVo fileVo){
        Result result=new Result();
        try{
            fileService.deleteFile(fileVo);
            result.setCode(1);
            return result;
        }catch (Exception e){
            result.setCode(0);
            return result;
        }
    }

    @RequestMapping("/deleteBatchFile")
    @ResponseBody
    public Result deleteBatchFile(FileVo fileVo){
        Result result=new Result();
        try {
            fileService.deleteBatchFile(fileVo.getIds());
            result.setMsg("批量删除成功");
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            result.setMsg("批量删除失败");
            return result;
        }
    }

}
