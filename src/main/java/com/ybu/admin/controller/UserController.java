package com.ybu.admin.controller;

import com.ybu.entity.Result;
import com.ybu.entity.User;
import com.ybu.admin.service.UserService;
import com.ybu.utils.ResultObj;
import com.ybu.vo.UserVo;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * 用户管理控制器
 * 
 * @author LJH
 *
 */
@Controller
@RequestMapping("user")
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping("/touserinfo")
	public String touserinfo(){
		return "admin/userinfo";
	}

	@RequestMapping("/tochangepwd")
	public String toChangepwd(){
		return "admin/changepwd";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.removeAttribute("user");
		return "admin/login";
	}

	@RequestMapping("/upload")
	@ResponseBody
	public Result upload(@RequestParam("mf") CommonsMultipartFile photo){
		//获取真实文件名
		String fileName = photo.getOriginalFilename();
		fileName= UUID.randomUUID().toString()+fileName.substring(fileName.lastIndexOf("."));
		String newFileName="G://images//"+fileName;
		System.out.println(newFileName);
		File file=new File(newFileName);
		//保存文件
		try {
			photo.transferTo(file);//保存文件
		} catch (IOException e) {
			e.printStackTrace();
		}
		Result result=new Result();
		Map<String,Object> data=new HashMap<>();
		data.put("src", "localhost:8080/governmentfile/images/"+fileName);
		result.setData(data);
		return result;
	}

	@RequestMapping("/updateuser")
	public String updateUser(User user,HttpSession session){
		User u = (User) session.getAttribute("user");
		u.setPhone(user.getPhone());
		u.setPhoto(user.getPhoto());
		session.setAttribute("user", u);
		int code=userService.updateUser(u);
		return "redirect:/user/touserinfo";
	}

	@RequestMapping("/checkpwd")
	@ResponseBody
	public Result checkPwd(String password,HttpSession session){
		User user= (User) session.getAttribute("user");
		Md5Hash md5Hash=new Md5Hash(password);
		Result result=new Result();
		if(!user.getPassword().equals(md5Hash.toString())){
			result.setCode(0);
			return result;
		}
		result.setCode(1);
		return result;
	}

	@RequestMapping("/changepwd")
	public String changePwd(String newpwd,HttpSession session){
		User user= (User) session.getAttribute("user");
		Md5Hash md5Hash=new Md5Hash(newpwd);
		user.setPassword(md5Hash.toString());
		int code=userService.updateUser(user);
		if(code==1){
			session.setAttribute("user", user);
		}
		return "redirect:/user/tochangepwd";
	}

	/**
	 * 重置用户密码
	 */
	@RequestMapping("resetUserPwd")
	public ResultObj resetUserPwd(UserVo userVo) {
		try {
			this.userService.resetUserPwd(userVo.getUid());
			return ResultObj.RESET_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.RESET_ERROR;
		}
	}

}
