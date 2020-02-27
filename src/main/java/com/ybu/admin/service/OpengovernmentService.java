package com.ybu.admin.service;

import com.ybu.entity.Opengovernment;
import com.ybu.entity.Opengovtype;

import java.util.List;

public interface OpengovernmentService {
    List<Opengovernment> openGovernments(Integer ogtid);

    int saveOpengov(Opengovernment opengovernment);

    int deleteOpengov(Integer oid);

    List<Opengovtype> openGovTypes();

    Opengovernment openGovDetail(Integer oid);
}
