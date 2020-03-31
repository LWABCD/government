package com.ybu.admin.controller;

import com.ybu.admin.service.RoleService;
import com.ybu.entity.Result;
import com.ybu.entity.Role;
import com.ybu.utils.DataGridView;
import com.ybu.utils.ResultObj;
import com.ybu.utils.TreeNode;
import com.ybu.vo.MenuVo;
import com.ybu.vo.RoleVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 角色管理控制器
 * 
 * @author LJH
 *
 */
@Controller
@RequestMapping("/role")
public class RoleController {

	@Autowired
	private RoleService roleService;

	@RequestMapping("/toRoleManager")
	public String toRoleManager() {
		return "admin/roleManager";
	}

	@RequestMapping("loadAllRole")
    @ResponseBody
	public Result loadAllRole(RoleVo roleVo) {
		List<RoleVo> roleVos=roleService.queryAllRole(roleVo);
		Result result=new Result();
		result.setData(roleVos);
		return result;
	}

	/**
	 * 加载角色管理分配菜单的json
	 */
	@RequestMapping("/initRoleMenuTreeJson")
	@ResponseBody
	public Result initRoleMenuTreeJson(Integer roleid) {
		List<TreeNode> menuTree=roleService.initRoleMenuTreeJson(roleid);
		Result result=new Result();
		result.setData(menuTree);
		result.setCode(0);
		result.setMsg("");
		return result;
	}

	@RequestMapping("/saveRoleMenu")
	@ResponseBody
	public Result saveRoleMenu(RoleVo roleVo) {
		Result result=new Result();
		try {
			roleService.saveRoleMenu(roleVo);
			result.setMsg("保存成功");
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			result.setMsg("保存失败");
			return result;
		}
	}

	@RequestMapping("/addRole")
	@ResponseBody
	public Result saveRole(RoleVo roleVo){
		Result result=new Result();
		try {
			roleService.insertRole(roleVo);
			result.setMsg("添加成功");
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			result.setMsg("添加失败");
			return result;
		}
	}

	@RequestMapping("/updateRole")
	@ResponseBody
	public Result updateRole(RoleVo roleVo){
		Result result=new Result();
		try {
			roleService.updateRole(roleVo);
			result.setMsg("修改成功");
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			result.setMsg("修改失败");
			return result;
		}
	}

	@RequestMapping("/deleteBatchRole")
	@ResponseBody
	public Result deleteBatchRole(RoleVo roleVo){
		Result result=new Result();
		try {
			roleService.deleteBatchRole(roleVo.getIds());
			result.setMsg("批量删除成功");
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			result.setMsg("批量删除失败");
			return result;
		}
	}

	@RequestMapping("/deleteRole")
	@ResponseBody
	public Result deleteRole(RoleVo roleVo){
		Result result=new Result();
		try {
			roleService.deleteRole(roleVo.getRoleid());
			result.setMsg("删除成功");
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			result.setMsg("删除失败");
			return result;
		}
	}

}
