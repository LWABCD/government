package com.ybu.admin.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.ybu.admin.service.OpengovernmentService;
import com.ybu.entity.*;
import com.ybu.mapper.OpengovernmentMapper;
import com.ybu.mapper.OpengovtypeMapper;
import com.ybu.vo.OpenGovernmentVo;
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
    public Result openGovernments(OpenGovernmentVo openGovernmentVo) {
        Page<Object> page= PageHelper.startPage(openGovernmentVo.getPage(), openGovernmentVo.getLimit());
        List<Opengovernment> data =opengovernmentMapper.queryAllOpenGovernment(openGovernmentVo);
        Result result=new Result();
        result.setCount(page.getTotal());
        result.setData(data);
        return result;
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

    @Override
    public void deleteBatchOpenGovernment(Integer[] ids) {
        for(Integer oid:ids){
            opengovernmentMapper.deleteByPrimaryKey(oid);
        }
    }
}
