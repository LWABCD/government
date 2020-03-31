package com.ybu.proscenium.service;

import com.ybu.entity.Emailreply;
import com.ybu.entity.Leaderemail;

import java.util.List;

public interface PLeaderEmailService{

    List<Leaderemail> leaderEmails();

    Leaderemail leaderEmailDetail(Integer leid);

    Emailreply selectEmailReply(Integer leid);

    int saveLeaderEmail(Leaderemail leaderemail);
}
