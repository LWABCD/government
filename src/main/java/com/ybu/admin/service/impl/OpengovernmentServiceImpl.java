package com.ybu.admin.service.impl;

import com.ybu.admin.service.OpengovernmentService;
import com.ybu.entity.Opengovernment;
import com.ybu.entity.OpengovernmentExample;
import com.ybu.entity.Opengovtype;
import com.ybu.mapper.OpengovernmentMapper;
import com.ybu.mapper.OpengovtypeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class OpengovernmentServiceImpl implements OpengovernmentService{

    @Autowired
    private OpengovernmentMapper opengovernmentMapper;
    @Autowired
    private OpengovtypeMapper opengovtypeMapper;

    @Override
    public List<Opengovernment> openGovernments(Integer ogtid) {
        OpengovernmentExample example=new OpengovernmentExample();
        OpengovernmentExample.Criteria criteria=example.createCriteria();
        criteria.andOgtidEqualTo(ogtid);
        return opengovernmentMapper.selectByExampleWithBLOBs(example);
    }

    @Override
    public int saveOpengov(Opengovernment opengovernment) {
        opengovernment.setUpdatetime(new Date());
        if(opengovernment.getOid()==null){
            opengovernment.setCreatetime(new Date());
            opengovernment.setReadnumber(0);
            return opengovernmentMapper.insert(opengovernment);
        }
        return opengovernmentMapper.updateByPrimaryKeyWithBLOBs(opengovernment);
    }

    @Override
    public int deleteOpengov(Integer oid) {
        return opengovernmentMapper.deleteByPrimaryKey(oid);
    }

    @Override
    public List<Opengovtype> openGovTypes() {
        return opengovtypeMapper.selectAllOpengovtype();
    }

    @Override
    public Opengovernment openGovDetail(Integer oid) {
        return opengovernmentMapper.selectByPrimaryKey(oid);
    }
}
