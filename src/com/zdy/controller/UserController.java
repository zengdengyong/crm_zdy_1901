package com.zdy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;
import com.zdy.base.BaseController;
import com.zdy.common.ResultBean;
import com.zdy.model.SysUser;
import com.zdy.vo.UserVo;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController{
	
	
	//查询所有的用户
	@RequestMapping("/selectAllUsers")
	public String selectAllUsers(@RequestParam(value="page",defaultValue="1")Integer page,Model model){
		PageInfo<UserVo> pageInfo = userService.selectAllUsers(page);
		model.addAttribute("pageInfo", pageInfo);
		return "module/userManage";
	}
	
	//通过id查询对用的用户信息
	@GetMapping("/queryUser")
	public ResultBean selectUserById(@RequestParam("id")Integer id){
		SysUser sysUser = super.userService.selectUserById(id);
		return	ResultBean.success(sysUser);
		
		
	} 
	
	
}















