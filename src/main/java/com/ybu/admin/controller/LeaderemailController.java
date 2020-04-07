package com.ybu.admin.controller;

import com.ybu.admin.service.LeaderemailService;
import com.ybu.entity.Emailreply;
import com.ybu.entity.Leaderemail;
import com.ybu.entity.Result;
import com.ybu.vo.LeaderEmailVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/leaderemail")
public class LeaderemailController{

    @Autowired
    private LeaderemailService leaderemailService;

    @RequestMapping("/toleaderemail")
    public String toLeaderemail(){
        return "admin/leaderemail";
    }

    @RequestMapping("/toemaildetail")
    public String toEmaildetail(){
        return "admin/emaildetail";
    }

    @RequestMapping("/leaderemails")
    @ResponseBody
    public Result leaderEmails(LeaderEmailVo leaderEmailVo){
        return leaderemailService.leaderEmails(leaderEmailVo);
    }

    @RequestMapping("/emaildetail")
    @ResponseBody
    public Result emailDetail(Integer leid, HttpSession session){
        Leaderemail leaderemail=leaderemailService.emailDetail(leid);
        Result result=new Result();
        if(leaderemail!=null){
            session.setAttribute("ed", leaderemail);
            if(leaderemail.getStatus()==1){
                Emailreply emailreply=leaderemailService.selectEmailReply(leaderemail.getLeid());
                session.setAttribute("er", emailreply);
            }
            result.setCode(1);
        }else{
            result.setCode(0);
        }
        return result;
    }

    @RequestMapping("/reply")
    @ResponseBody
    public Result reply(Emailreply emailreply){
        emailreply.setReplytime(new Date());
        int code=leaderemailService.saveEmailReply(emailreply);
        Result result=new Result();
        result.setCode(code==2?1:0);
        return result;
    }
}
