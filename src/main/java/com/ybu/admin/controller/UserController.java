package com.ybu.admin.controller;

import com.ybu.entity.Result;
import com.ybu.entity.Role;
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
import sun.util.resources.cldr.st.LocaleNames_st;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
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

	@RequestMapping("/toUserManager")
	public String toUserManager(){
		return "admin/userManager";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.removeAttribute("user");
		return "admin/login";
	}

	@RequestMapping("/upload")
	@ResponseBody
	public Result upload(@RequestParam("mf") CommonsMultipartFile photo,HttpSession session){
		//获取真实文件名
		String fileName = photo.getOriginalFilename();
		fileName= UUID.randomUUID().toString()+fileName.substring(fileName.lastIndexOf("."));
		String newFileName="G://governmentfile//images//"+fileName;
		System.out.println(newFileName);
		File file=new File(newFileName);
		//保存文件
		try {
			photo.transferTo(file);//保存文件
		} catch (IOException e) {
			e.printStackTrace();
		}
		//用户更换头像后把信息保存到数据库，把session中的用户头像也更换掉
		User user= (User) session.getAttribute("user");
		String imageUrl="http://localhost:8080/governmentfile/images/"+fileName;
		user.setPhoto(imageUrl);
		userService.updateUser(user);
		session.setAttribute("user", user);
		Result result=new Result();
		Map<String,Object> data=new HashMap<>();
		data.put("src", imageUrl);
		result.setData(data);
		return result;
	}

	@RequestMapping("/updateuser")
	public String updateUser(User user,HttpSession session){
		UserVo u = (UserVo) session.getAttribute("user");
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
	@ResponseBody
	public Result changePwd(String newpwd,HttpSession session){
		System.out.println("newpwd:"+newpwd);
		User user= (User) session.getAttribute("user");
		Md5Hash md5Hash=new Md5Hash(newpwd);
		user.setPassword(md5Hash.toString());
		Result result=new Result();
		try {
			userService.updateUser(user);
			session.setAttribute("user", user);
			result.setCode(1);
			return result;
		}catch (Exception e){
			result.setCode(0);
			return result;
		}
//		int code=userService.updateUser(user);
//		if(code==1){
//			session.setAttribute("user", user);
//		}
//		return "redirect:/user/tochangepwd";
	}

	@RequestMapping("/loadAllUser")
	@ResponseBody
	public Result loadAllUser(UserVo userVo) {
		List<User> users=userService.users(userVo);
		Result result=new Result();
		result.setData(users);
		result.setCode(0);
		return result;
	}

	@RequestMapping("/initUserRole")
	@ResponseBody
	public Result initUserRole(UserVo userVo) {
		List<Map<String,Object>> userRoles=userService.initUserRole(userVo.getUid());
		Result result=new Result();
		result.setData(userRoles);
		return result;
	}

	@RequestMapping("/saveUserRole")
	@ResponseBody
	public Result saveUserRole(UserVo userVo) {
		Result result=new Result();
		try {
			userService.saveUserRole(userVo);
			result.setMsg("保存成功");
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			result.setMsg("保存失败");
			return result;
		}
	}

	/**
	 * 添加用户
	 */
	@RequestMapping("addUser")
	@ResponseBody
	public Result addUser(UserVo userVo) {
		Result result=new Result();
		try {
			Md5Hash md5Hash=new Md5Hash(userVo.getPassword());
			userVo.setPassword(md5Hash.toString());
			userService.addUser(userVo);
			result.setMsg("添加成功");
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			result.setMsg("添加失败");
			return result;
		}
	}

	/**
	 * 修改用户
	 */
	@RequestMapping("updateUser")
	@ResponseBody
	public Result updateUser(UserVo userVo) {
		Result result=new Result();
		try {
			userService.updateUser(userVo);
			result.setMsg("修改成功");
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			result.setMsg("修改失败");
			return result;
		}
	}

	/**
	 * 删除用户
	 */
	@RequestMapping("deleteUser")
	@ResponseBody
	public Result deleteUser(UserVo userVo) {
		Result result=new Result();
		try {
			this.userService.deleteUser(userVo.getUid());
			result.setMsg("删除成功");
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			result.setMsg("删除失败");
			return result;
		}
	}

	/**
	 * 批量删除用户
	 */
	@RequestMapping("deleteBatchUser")
	@ResponseBody
	public Result deleteBatchUser(UserVo userVo) {
		Result result=new Result();
		try {
			userService.deleteBatchUser(userVo.getIds());
			result.setMsg("批量删除成功");
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			result.setMsg("批量删除失败");
			return result;
		}
	}
	/**
	 * 重置用户密码
	 */
	@RequestMapping("resetUserPwd")
	@ResponseBody
	public Result resetUserPwd(UserVo userVo) {
		Result result=new Result();
		try {
			userService.resetUserPwd(userVo.getUid());
			result.setMsg("重置成功");
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			result.setMsg("重置失败");
			return result;
		}
	}

}
