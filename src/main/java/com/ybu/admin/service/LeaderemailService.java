package com.ybu.admin.service;

import com.ybu.entity.Emailreply;
import com.ybu.entity.Leaderemail;
import com.ybu.entity.Result;
import com.ybu.vo.LeaderEmailVo;

import java.util.List;

public interface LeaderemailService {
    Result leaderEmails(LeaderEmailVo leaderEmailVo);

    Leaderemail emailDetail(Integer leid);

    int saveEmailReply(Emailreply emailreply);

    Emailreply selectEmailReply(Integer leid);
}
