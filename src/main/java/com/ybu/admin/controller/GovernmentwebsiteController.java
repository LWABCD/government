package com.ybu.admin.controller;

import com.ybu.entity.Governmentwebsite;
import com.ybu.entity.Result;
import com.ybu.admin.service.GovernmentwebsiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/governmentwebsite")
public class GovernmentwebsiteController{

    @Autowired
    private GovernmentwebsiteService governmentwebsiteService;

    @RequestMapping("/togovernmentwebsite")
    public String toGovernmentwebsite(){
        return "admin/governmentwebsite";
    }

    @RequestMapping("/governmentwebsites")
    @ResponseBody
    public Result governmentwebsites(){
        List<Governmentwebsite> governmentwebsites=governmentwebsiteService.governmentwebsites();
        Result result=new Result();
        result.setCode(0);
        result.setMsg("");
        result.setData(governmentwebsites);
        return result;
    }

    @RequestMapping("/savegovernmentwebsite")
    public String saveGovernmentwebsite(Governmentwebsite governmentwebsite){
        int code=governmentwebsiteService.saveGovernmentwebsite(governmentwebsite);
        return "admin/governmentwebsite";
    }

    @RequestMapping("/deletegovernmentwebsite")
    @ResponseBody
    public Result deleteGovernmentwebsite(Integer gid){
        int code=governmentwebsiteService.deleteGovernmentwebsite(gid);
        Result result=new Result();
        result.setCode(code);
        return result;
    }
}
