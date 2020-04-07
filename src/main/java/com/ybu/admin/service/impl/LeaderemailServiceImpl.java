package com.ybu.admin.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.ybu.admin.service.LeaderemailService;
import com.ybu.entity.*;
import com.ybu.mapper.EmailreplyMapper;
import com.ybu.mapper.LeaderemailMapper;
import com.ybu.vo.LeaderEmailVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class LeaderemailServiceImpl implements LeaderemailService{

    @Autowired
    private LeaderemailMapper leaderemailMapper;
    @Autowired
    private EmailreplyMapper emailreplyMapper;

    @Override
    public Result leaderEmails(LeaderEmailVo leaderEmailVo) {
        Page<Object> page= PageHelper.startPage(leaderEmailVo.getPage(), leaderEmailVo.getLimit());
        if(leaderEmailVo.getStatus()==null){
            leaderEmailVo.setStatus(0);
        }
        List<Leaderemail> data = leaderemailMapper.queryAllLeaderemail(leaderEmailVo);
        Result result=new Result();
        result.setCount(page.getTotal());
        result.setData(data);
        return result;

    }

    @Override
    public Leaderemail emailDetail(Integer leid) {
        return leaderemailMapper.selectByPrimaryKey(leid);
    }

    @Override
    @Transactional
    public int saveEmailReply(Emailreply emailreply) {
        int code=0;
        code+=leaderemailMapper.updateStatus(emailreply.getLeid());
        code+=emailreplyMapper.insert(emailreply);
        return code;
    }

    @Override
    public Emailreply selectEmailReply(Integer leid) {
        EmailreplyExample example=new EmailreplyExample();
        EmailreplyExample.Criteria criteria=example.createCriteria();
        criteria.andLeidEqualTo(leid);
        List<Emailreply> emailreplies=emailreplyMapper.selectByExampleWithBLOBs(example);
        if(emailreplies.size()>0){
            return emailreplies.get(0);
        }
        return null;
    }
}
