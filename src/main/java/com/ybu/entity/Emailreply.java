package com.ybu.entity;

import java.util.Date;

public class Emailreply {
    private Integer lerid;

    private Date replytime;

    private Integer leid;

    private String replycontent;

    public Integer getLerid() {
        return lerid;
    }

    public void setLerid(Integer lerid) {
        this.lerid = lerid;
    }

    public Date getReplytime() {
        return replytime;
    }

    public void setReplytime(Date replytime) {
        this.replytime = replytime;
    }

    public Integer getLeid() {
        return leid;
    }

    public void setLeid(Integer leid) {
        this.leid = leid;
    }

    public String getReplycontent() {
        return replycontent;
    }

    public void setReplycontent(String replycontent) {
        this.replycontent = replycontent == null ? null : replycontent.trim();
    }
}