package com.ybu.admin.service;

import com.ybu.entity.Governmentwebsite;
import com.ybu.entity.Result;
import com.ybu.vo.GovernmentWebsiteVo;

import java.util.List;

public interface GovernmentwebsiteService{

    Result governmentwebsites(GovernmentWebsiteVo governmentWebsiteVo);

    int saveGovernmentwebsite(Governmentwebsite governmentwebsite);

    int deleteGovernmentwebsite(Integer gid);

    void deleteBatchGovWebsite(Integer[] ids);
}
