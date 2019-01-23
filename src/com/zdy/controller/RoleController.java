package com.zdy.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zdy.base.BaseController;
import com.zdy.vo.RoleVo;

/**
 * 角色的操作
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/role")
public class RoleController extends BaseController {
	//查询所有部门
	@RequestMapping("/selectAllRoles")
	public String selectAllRoles(Model model){
		List<RoleVo> roles = roleService.selectAllRoles();
		model.addAttribute("roles", roles);
		
		return "module/roleManage";
		
	}
	
	
	
	
}
