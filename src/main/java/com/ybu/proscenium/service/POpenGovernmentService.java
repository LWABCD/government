package com.ybu.proscenium.service;

import com.ybu.entity.Opengovernment;
import com.ybu.entity.Opengovtype;

import java.util.List;

public interface POpenGovernmentService{

    List<Opengovernment> openGovernments(Integer ogtid);

    List<Opengovtype> openGovTypes();

    Opengovernment openGovDetail(Integer oid);
}
