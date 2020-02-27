package com.ybu.admin.service;

import com.ybu.entity.Emailreply;
import com.ybu.entity.Leaderemail;

import java.util.List;

public interface LeaderemailService {
    List<Leaderemail> leaderEmails(Integer status);

    Leaderemail emailDetail(Integer leid);

    int saveEmailReply(Emailreply emailreply);

    Emailreply selectEmailReply(Integer leid);
}
