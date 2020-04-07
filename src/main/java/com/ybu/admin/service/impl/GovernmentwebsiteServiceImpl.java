package com.ybu.admin.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.ybu.entity.Announcement;
import com.ybu.entity.Governmentwebsite;
import com.ybu.entity.Result;
import com.ybu.mapper.GovernmentwebsiteMapper;
import com.ybu.admin.service.GovernmentwebsiteService;
import com.ybu.vo.GovernmentWebsiteVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GovernmentwebsiteServiceImpl implements GovernmentwebsiteService{

    @Autowired
    private GovernmentwebsiteMapper governmentwebsiteMapper;

    @Override
    public Result governmentwebsites(GovernmentWebsiteVo governmentWebsiteVo) {
        Page<Object> page= PageHelper.startPage(governmentWebsiteVo.getPage(), governmentWebsiteVo.getLimit());
        List<Governmentwebsite> data = governmentwebsiteMapper.queryAllGovWebsite(governmentWebsiteVo);
        Result result=new Result();
        result.setCount(page.getTotal());
        result.setData(data);
        return result;
    }

    @Override
    public int saveGovernmentwebsite(Governmentwebsite governmentwebsite) {
        if(governmentwebsite.getGid()==null){
            return governmentwebsiteMapper.insert(governmentwebsite);
        }
        return governmentwebsiteMapper.updateByPrimaryKey(governmentwebsite);
    }

    @Override
    public int deleteGovernmentwebsite(Integer gid) {
        return governmentwebsiteMapper.deleteByPrimaryKey(gid);
    }

    @Override
    public void deleteBatchGovWebsite(Integer[] ids) {
        for(Integer gid:ids){
            governmentwebsiteMapper.deleteByPrimaryKey(gid);
        }
    }
}
