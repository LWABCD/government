package com.ybu.admin.controller;

import com.ybu.admin.service.OpengovernmentService;
import com.ybu.entity.Opengovernment;
import com.ybu.entity.Opengovtype;
import com.ybu.entity.Result;
import com.ybu.vo.AnnouncementVo;
import com.ybu.vo.OpenGovernmentVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/opengovernment")
public class OpengovernmentController{

    @Autowired
    private OpengovernmentService opengovernmentService;

    @RequestMapping("toopengovernment")
    public String toOpengovernment(){
        return "admin/opengovernment";
    }

    @RequestMapping("toopengovedit")
    public String toOpengovedit(){
        return "admin/opengovedit";
    }

    @RequestMapping("opengovernments")
    @ResponseBody
    public Result openGovernments(OpenGovernmentVo openGovernmentVo){
        return opengovernmentService.openGovernments(openGovernmentVo);
    }

    @RequestMapping("/saveopengov")
    @ResponseBody
    public Result saveOpengov(Opengovernment opengovernment){
        int code=opengovernmentService.saveOpengov(opengovernment);
        Result result=new Result();
        result.setCode(code);
        return result;
    }

    @RequestMapping("deleteopengov")
    @ResponseBody
    public Result deleteOpengov(Integer oid){
        int code=opengovernmentService.deleteOpengov(oid);
        Result result=new Result();
        result.setCode(code);
        return result;
    }

    @RequestMapping("/deleteBatchOpenGovernment")
    @ResponseBody
    public Result deleteBatchOpenGovernment(OpenGovernmentVo openGovernmentVo){
        Result result=new Result();
        try {
            opengovernmentService.deleteBatchOpenGovernment(openGovernmentVo.getIds());
            result.setMsg("批量删除成功");
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            result.setMsg("批量删除失败");
            return result;
        }
    }

    @RequestMapping("/opengovdetail")
    public String openGovDetail(Integer oid, HttpServletRequest request){
        Opengovernment opengovernment=opengovernmentService.openGovDetail(oid);
        request.setAttribute("opengov",opengovernment);
        return "admin/opengovedit";
    }

    @RequestMapping("opengovtype")
    @ResponseBody
    public Result openGovType(){
        List<Opengovtype> opengovtypes=opengovernmentService.openGovTypes();
        Result result=new Result();
        result.setData(opengovtypes);
        return result;
    }
}
