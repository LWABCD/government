package com.ybu.admin.service;

import com.ybu.entity.Governmentwebsite;

import java.util.List;

public interface GovernmentwebsiteService{

    List<Governmentwebsite> governmentwebsites();

    int saveGovernmentwebsite(Governmentwebsite governmentwebsite);

    int deleteGovernmentwebsite(Integer gid);
}
