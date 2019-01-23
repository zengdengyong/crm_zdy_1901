package com.zdy.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zdy.base.BaseController;
import com.zdy.model.SysDept;

/**
 * 部门信息的操作
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/dept")
public class DeptController extends BaseController {
	//查询所有部门
	@RequestMapping("/selectAllDeptInfo")
	public String selectAllDeptInfo(Model model){
		List<SysDept> allDeptInfo = deptService.selectAllDeptInfo();
		model.addAttribute("allDeptInfo", allDeptInfo);
		return "module/deptManage";
		
	}
	
	
	
	
}
