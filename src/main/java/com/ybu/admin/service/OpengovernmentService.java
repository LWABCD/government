package com.ybu.admin.service;

import com.ybu.entity.Opengovernment;
import com.ybu.entity.Opengovtype;
import com.ybu.entity.Result;
import com.ybu.vo.OpenGovernmentVo;

import java.util.List;

public interface OpengovernmentService {
    Result openGovernments(OpenGovernmentVo openGovernmentVo);

    int saveOpengov(Opengovernment opengovernment);

    int deleteOpengov(Integer oid);

    List<Opengovtype> openGovTypes();

    Opengovernment openGovDetail(Integer oid);

    void deleteBatchOpenGovernment(Integer[] ids);
}
