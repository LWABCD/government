package com.ybu.admin.controller;

import com.ybu.admin.service.LogInfoService;
import com.ybu.constast.SysConstast;
import com.ybu.entity.LogInfo;
import com.ybu.entity.User;
import com.ybu.admin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * 用户登陆控制器
 * @author LJH
 *
 */
@Controller
@RequestMapping("login")
public class LoginController {

	@Autowired
	private UserService userService;
	@Autowired
	private LogInfoService logInfoService;
	
	
	/**
	 * 跳转到登陆页面
	 */
	@RequestMapping("toLogin")
	public String toLogin() {
		return "admin/login";
	}
	
	
	/**
	 * 登陆方法
	 */
	@RequestMapping("login")
	public String login(User user, Model model, HttpSession session, HttpServletRequest request) {
		User curUser= (User) session.getAttribute("user");
		if(curUser!=null){
			return "admin/index";
		}
		List<User> users=userService.login(user);
		if(users.size()>0){
			User u=users.get(0);
			//放到session
			session.setAttribute("user",u);
			//记录登陆日志 向sys_login_log里面插入数据
			LogInfo logInfo=new LogInfo();
			logInfo.setLoginname(u.getUsername());
			String loginip=request.getRemoteAddr();
			logInfo.setLoginip(loginip);
			logInfo.setLogintime(new Date());
			logInfoService.insertLogInfo(logInfo);
			return "admin/index";
		}else{
			model.addAttribute("error", SysConstast.USER_LOGIN_ERROR_MSG);
			return "admin/login";
		}
		
	}
	
}
