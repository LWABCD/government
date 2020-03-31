package com.ybu.proscenium.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ybu.entity.Announcement;
import com.ybu.entity.Emailreply;
import com.ybu.entity.Leaderemail;
import com.ybu.entity.Result;
import com.ybu.proscenium.service.PLeaderEmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/pLeaderEmail")
public class PLeaderEmailController{

    @Autowired
    private PLeaderEmailService pLeaderEmailService;

    @RequestMapping("/toLeaderEmail")
    public String toLeaderEmail(){
        return "proscenium/leaderEmail";
    }

    @RequestMapping("/toLeaderEmailDetail")
    public String toLeaderEmailDetail(){
        return "proscenium/leaderEmailDetail";
    }

    @RequestMapping("/toLeaderEmailEdit")
    public String toLeaderEmailEdit(){
        return "proscenium/leaderEmailEdit";
    }

    @RequestMapping("/leaderemails")
    @ResponseBody
    public Result leaderEmails(String pageNow, String tiaojian){
            if((tiaojian == null || "".equals(tiaojian))&&(pageNow == null || "".equals(pageNow))){
                List<Leaderemail> leaderemails = pLeaderEmailService.leaderEmails();
                Result result=new Result();
                result.setData(leaderemails);
                return result;
            }
            if (tiaojian == null || "".equals(tiaojian)) {
                //获取页码
                if (pageNow == null && "".equals(pageNow)) {
                    pageNow = "1";
                }
                PageHelper.startPage(Integer.parseInt(pageNow), 5);
                List<Leaderemail> leaderemails = pLeaderEmailService.leaderEmails();
                PageInfo<Leaderemail> pageInfo = new PageInfo<>(leaderemails);
                Result<PageInfo<Leaderemail>> result = new Result<>();
                result.setCode(leaderemails == null ? 1 : 0);
                result.setData(pageInfo);
                result.setCount(pageInfo.getTotal());
                System.out.println(result);
                return result;
            } else {
                if (pageNow == null && "".equals(pageNow)) {
                    pageNow = "1";
                }
                PageHelper.startPage(Integer.parseInt(pageNow), 5);
                List<Leaderemail> leaderemails = pLeaderEmailService.leaderEmails();
                PageInfo<Leaderemail> pageInfo = new PageInfo<>(leaderemails);
                Result<PageInfo<Leaderemail>> result = new Result<>();
                result.setCode(leaderemails == null ? 1 : 0);
                result.setData(pageInfo);
                result.setCount(pageInfo.getTotal());
                System.out.println(result);
                return result;
            }
        }

    @RequestMapping("/leaderEmailDetail")
    @ResponseBody
    public Result emailDetail(Integer leid, HttpSession session){
        Leaderemail leaderemail=pLeaderEmailService.leaderEmailDetail(leid);
        Result result=new Result();
        if(leaderemail!=null){
            session.setAttribute("ped", leaderemail);
            Emailreply emailreply=pLeaderEmailService.selectEmailReply(leaderemail.getLeid());
            session.setAttribute("per", emailreply);
            result.setCode(1);
        }else{
            result.setCode(0);
        }
        return result;
    }

    @RequestMapping("/saveLeaderEmail")
    @ResponseBody
    public Result saveLeaderEmail(Leaderemail leaderemail){
        int code=pLeaderEmailService.saveLeaderEmail(leaderemail);
        Result result=new Result();
        result.setCode(code);
        return result;
    }
}
