package com.ybu.admin.service;

import com.ybu.entity.Menu;
import com.ybu.utils.DataGridView;
import com.ybu.vo.MenuVo;

import java.util.List;

/**
 * 菜单管理的服务接口
 * @author LJH
 *
 */
public interface MenuService {

	/**
	 * 查询所有菜单返回
	 * List<Menu>
	 */
	public List<Menu> queryAllMenuForList(MenuVo menuVo);

	/**
	 * 查询所有菜单
	 * @param menuVo
	 * @return
	 */
	public DataGridView queryAllMenu(MenuVo menuVo);

	/**
	 * 根据pid查询菜单数量
	 * @param pid
	 * @return
	 */
	public Integer queryMenuByPid(Integer pid);

	/**
	 * 根据id删除菜单
	 * @param menuVo
	 */
	public void deleteMenu(MenuVo menuVo);

    List<Menu> queryMenuByUId(MenuVo menuVo, Integer uid);
}
