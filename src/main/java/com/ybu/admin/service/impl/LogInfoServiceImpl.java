package com.ybu.admin.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.ybu.admin.service.LogInfoService;
import com.ybu.entity.LogInfo;
import com.ybu.entity.Result;
import com.ybu.mapper.LogInfoMapper;
import com.ybu.utils.DataGridView;
import com.ybu.vo.LogInfoVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LogInfoServiceImpl implements LogInfoService {
	
	@Autowired
	private LogInfoMapper logInfoMapper;

	@Override
	public Result queryAllLogInfo(LogInfoVo logInfoVo) {
		Page<Object> page=PageHelper.startPage(logInfoVo.getPage(), logInfoVo.getLimit());
		List<LogInfo> data = logInfoMapper.queryAllLogInfo(logInfoVo);
		Result result=new Result();
		result.setCount(page.getTotal());
		result.setData(data);
		return result;
	}

	@Override
	public void insertLogInfo(LogInfo logInfo) {
		logInfoMapper.insert(logInfo);
	}

	@Override
	public void deleteLogInfo(Integer id) {
		logInfoMapper.deleteByPrimaryKey(id);
	}

	@Override
	public void deleteBatchLogInfo(Integer[] ids) {
		for(Integer id:ids){
			logInfoMapper.deleteByPrimaryKey(id);
		}
	}

}
