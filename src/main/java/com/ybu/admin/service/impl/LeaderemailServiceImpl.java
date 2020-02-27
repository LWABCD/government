package com.ybu.admin.service.impl;

import com.ybu.admin.service.LeaderemailService;
import com.ybu.entity.Emailreply;
import com.ybu.entity.EmailreplyExample;
import com.ybu.entity.Leaderemail;
import com.ybu.entity.LeaderemailExample;
import com.ybu.mapper.EmailreplyMapper;
import com.ybu.mapper.LeaderemailMapper;
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
    public List<Leaderemail> leaderEmails(Integer status) {
        if(status==null){
            status=0;
        }
        LeaderemailExample example=new LeaderemailExample();
        LeaderemailExample.Criteria criteria=example.createCriteria();
        criteria.andStatusEqualTo(status);
        return leaderemailMapper.selectByExampleWithBLOBs(example);
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
