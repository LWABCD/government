package com.ybu.admin.service.impl;

import com.ybu.entity.Governmentwebsite;
import com.ybu.mapper.GovernmentwebsiteMapper;
import com.ybu.admin.service.GovernmentwebsiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GovernmentwebsiteServiceImpl implements GovernmentwebsiteService{

    @Autowired
    private GovernmentwebsiteMapper governmentwebsiteMapper;

    @Override
    public List<Governmentwebsite> governmentwebsites() {
        return governmentwebsiteMapper.selectAllWebsites();
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
}
