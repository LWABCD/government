package com.ybu.proscenium.service.impl;

import com.ybu.entity.Emailreply;
import com.ybu.entity.EmailreplyExample;
import com.ybu.entity.Leaderemail;
import com.ybu.entity.LeaderemailExample;
import com.ybu.mapper.EmailreplyMapper;
import com.ybu.mapper.LeaderemailMapper;
import com.ybu.proscenium.service.PLeaderEmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class PLeaderEmailServiceImpl implements PLeaderEmailService{

    @Autowired
    private LeaderemailMapper leaderemailMapper;
    @Autowired
    private EmailreplyMapper emailreplyMapper;

    @Override
    public List<Leaderemail> leaderEmails() {
        LeaderemailExample example=new LeaderemailExample();
        LeaderemailExample.Criteria criteria=example.createCriteria();
        criteria.andStatusEqualTo(1);
        return leaderemailMapper.selectByExampleWithBLOBs(example);
    }

    @Override
    public Leaderemail leaderEmailDetail(Integer leid) {
        return leaderemailMapper.selectByPrimaryKey(leid);
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

    @Override
    public int saveLeaderEmail(Leaderemail leaderemail) {
        leaderemail.setSendtime(new Date());
        leaderemail.setStatus(0);
        return leaderemailMapper.insert(leaderemail);
    }
}
