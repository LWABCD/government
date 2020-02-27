package com.ybu.admin.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.ybu.entity.Menu;
import com.ybu.mapper.MenuMapper;
import com.ybu.admin.service.MenuService;
import com.ybu.utils.DataGridView;
import com.ybu.vo.MenuVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {


	@Autowired
	private MenuMapper menuMapper;

	@Override
	public List<Menu> queryAllMenuForList(MenuVo menuVo) {
		return menuMapper.queryAllMenu(menuVo);
	}

	@Override
	public DataGridView queryAllMenu(MenuVo menuVo) {
		Page<Object> page=PageHelper.startPage(menuVo.getPage(), menuVo.getLimit());
		List<Menu> data = this.menuMapper.queryAllMenu(menuVo);
		return new DataGridView(page.getTotal(), data);
	}

	@Override
	public Integer queryMenuByPid(Integer pid) {
		return this.menuMapper.queryMenuByPid(pid);
	}

	@Override
	public void deleteMenu(MenuVo menuVo) {

		//删除菜单表的数据
		this.menuMapper.deleteByPrimaryKey(menuVo.getId());

		//根据菜单id删除sys_role_menu里面的数据
		this.menuMapper.deleteRoleMenuByMid(menuVo.getId());
	}

}
