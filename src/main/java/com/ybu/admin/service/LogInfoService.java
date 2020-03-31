package com.ybu.admin.service;

import com.ybu.entity.LogInfo;
import com.ybu.entity.Result;
import com.ybu.utils.DataGridView;
import com.ybu.vo.LogInfoVo;

/**
 * 日志管理的服务接口
 * @author LJH
 *
 */
public interface LogInfoService {
	/**
	 * 查询所有日志
	 * @param logInfoVo
	 * @return
	 */
	public Result queryAllLogInfo(LogInfoVo logInfoVo);

	void insertLogInfo(LogInfo logInfo);

	void deleteLogInfo(Integer id);

	void deleteBatchLogInfo(Integer[] ids);
}
