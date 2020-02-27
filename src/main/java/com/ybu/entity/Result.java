package com.ybu.entity;

import java.io.Serializable;

public class Result<T> implements Serializable {
    private int code;//表示成功还是失败
    public static final int NOT_LOGIN = 2;//代表未登录

    public static final int SUCCESS = 1;//代表成功

    public static final int FAILURE = 0;//代表失败

    private String msg;//原因是什么

    private T data;

    private long count;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public long getCount() {
        return count;
    }

    public void setCount(long count) {
        this.count = count;
    }
}
