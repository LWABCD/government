package com.ybu.proscenium.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ybu.entity.Leaderemail;
import com.ybu.entity.Opengovernment;
import com.ybu.entity.Opengovtype;
import com.ybu.entity.Result;
import com.ybu.proscenium.service.POpenGovernmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/pOpenGovernment")
public class POpenGovernmentController {

    @Autowired
    private POpenGovernmentService pOpenGovernmentService;

    @RequestMapping("/toOpenGovernment")
    public String toOpenGovernment(){
        return "proscenium/openGovernment";
    }

    @RequestMapping("/openGovTypes")
    @ResponseBody
    public Result openGovTypes(){
        List<Opengovtype> opengovtypes=pOpenGovernmentService.openGovTypes();
        Result result=new Result();
        result.setData(opengovtypes);
        return result;
    }

    @RequestMapping("openGovernments")
    @ResponseBody
    public Result openGovernments(String pageNow,Integer ogtid){
        if(pageNow==null||"".equals(pageNow)){
            pageNow="1";
        }
        PageHelper.startPage(Integer.parseInt(pageNow), 10);
        List<Opengovernment> opengovernments =pOpenGovernmentService.openGovernments(ogtid);
        PageInfo<Opengovernment> pageInfo = new PageInfo<>(opengovernments);
        Result<PageInfo<Opengovernment>> result = new Result<>();
        result.setCode(opengovernments == null ? 1 : 0);
        result.setData(pageInfo);
        result.setCount(pageInfo.getTotal());
        return result;
    }

    @RequestMapping("/openGovDetail/{oid}")
    public ModelAndView openGovDetail(@PathVariable("oid")Integer oid,ModelAndView modelAndView){
        Opengovernment opengovernment=pOpenGovernmentService.openGovDetail(oid);
        modelAndView.addObject("pOpenGov", opengovernment);
        modelAndView.setViewName("proscenium/openGovernmentDetail");
        return modelAndView;
    }
}
