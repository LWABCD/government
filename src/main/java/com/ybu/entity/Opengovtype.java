package com.ybu.entity;

public class Opengovtype {
    private Integer ogtid;

    private String name;

    public Integer getOgtid() {
        return ogtid;
    }

    public void setOgtid(Integer ogtid) {
        this.ogtid = ogtid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
}