package com.ybu.vo;

import com.ybu.entity.Role;

public class RoleVo extends Role {
	
	/**
	 * 分页参数
	 */
	private Integer page;
	private Integer limit;
	
	//接收多个角色id
	private Integer [] ids;

	private Integer userCount;
	private String userNames;

	public Integer getUserCount() {
		return userCount;
	}

	public void setUserCount(Integer userCount) {
		this.userCount = userCount;
	}

	public String getUserNames() {
		return userNames;
	}

	public void setUserNames(String userNames) {
		this.userNames = userNames;
	}

	public Integer[] getIds() {
		return ids;
	}
	public void setIds(Integer[] ids) {
		this.ids = ids;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getLimit() {
		return limit;
	}
	public void setLimit(Integer limit) {
		this.limit = limit;
	}
	
	
	
}
