package com.ybu.utils;

import com.ybu.entity.Menu;
import com.ybu.mapper.MenuMapper;
import com.ybu.vo.MenuVo;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * 初始化菜单数据
 * @author LJH
 *
 */
public class TestDataSource {

	private static ApplicationContext context;

	public static void main(String[] args) {
		context = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		
		MenuMapper menuMapper = context.getBean(MenuMapper.class);
		
		List<Menu> queryAllMenu = menuMapper.queryAllMenu(new MenuVo());
		System.out.println(queryAllMenu.size());
		System.out.println(menuMapper);
		System.out.println("初始化完成");
		
	}
}
