package com.zdy.base;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zdy.service.DeptService;
import com.zdy.service.RoleService;
import com.zdy.service.UserService;

/**
 * 注入服务对象
 * 注入业务对象
 * 注入常用功能
 * @author Administrator
 *
 */
public abstract class BaseController {
	//服务器对象
	@Resource
	protected HttpSession session;
	@Resource
	protected HttpServletRequest request;
	@Resource
	protected HttpServletResponse response;
//	@Resource
//	protected Model model;
	
	//业务对象
	@Resource
	protected UserService userService;
	@Resource
	protected DeptService deptService;
	@Resource
	protected RoleService roleService;
	
	
	
}











