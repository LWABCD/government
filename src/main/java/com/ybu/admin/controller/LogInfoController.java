package com.ybu.admin.controller;

import com.ybu.admin.service.LogInfoService;
import com.ybu.entity.LogInfo;
import com.ybu.entity.Result;
import com.ybu.utils.DataGridView;
import com.ybu.utils.ResultObj;
import com.ybu.vo.LogInfoVo;
import com.ybu.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * 日志管理控制器
 * 
 * @author LJH
 *
 */
@Controller
@RequestMapping("/logInfo")
public class LogInfoController {

	@Autowired
	private LogInfoService logInfoService;

	@RequestMapping("/toLogInfoManager")
	public String toLogInfoManager() {
		return "admin/logInfoManager";

	}

	/**
	 * 加载日志列表返回DataGridView
	 */
	@RequestMapping("loadAllLogInfo")
	@ResponseBody
	public Result loadAllLogInfo(LogInfoVo logInfoVo) {
		return logInfoService.queryAllLogInfo(logInfoVo);
	}

	/**
	 * 删除用户
	 */
	@RequestMapping("deleteLogInfo")
	@ResponseBody
	public Result deleteLogInfo(LogInfoVo logInfoVo) {
		Result result=new Result();
		try {
			logInfoService.deleteLogInfo(logInfoVo.getId());
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
	@RequestMapping("deleteBatchLogInfo")
	@ResponseBody
	public Result deleteBatchLogInfo(LogInfoVo logInfoVo) {
		Result result=new Result();
		try {
			logInfoService.deleteBatchLogInfo(logInfoVo.getIds());
			result.setMsg("批量删除成功");
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			result.setMsg("批量删除失败");
			return result;
		}
	}

}
