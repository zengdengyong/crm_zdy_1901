package com.zdy.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zdy.base.BaseController;
import com.zdy.common.ResultBean;
import com.zdy.model.SysDept;

/**
 * 部门信息的操作
 * @author Administrator
 *
 */

//private String deptName;
//
//private String deptInfo;

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
	//通过部门id查询对应部门信息=====用于数据回显
	@RequestMapping("/selectByPrimaryKey")
	@ResponseBody
	public ResultBean selectByPrimaryKey(@Param("id")Integer id){
		SysDept dept = deptService.selectByPrimaryKey(id);
		return ResultBean.success(dept);
	}
	
	
	
	//修改部门信息
	@PostMapping("/updateDeptInfoById")
	public String updateDeptInfoById(SysDept dept){
		deptService.updateDeptInfoById(dept);
		return "forward:/dept/selectAllDeptInfo";
	}
	

	//通过部门id删除部门=====先判断是否该部门有员工,如果有则不能删除
	@PostMapping("/deleteByPrimaryKey")
	@ResponseBody
	public ResultBean deleteByPrimaryKey(@RequestParam(value="userDeptId",defaultValue="")Integer userDeptId){
		return deptService.deleteByPrimaryKey(userDeptId);
	} 
	
	
	//添加部门====接受异步请求====不能限制参数
	@RequestMapping("/insertDeptInfo")
	public String insertDeptInfo(SysDept dept){
		deptService.insertDeptInfo(dept);
		return "forward:/dept/selectAllDeptInfo";//注意:请求转发到url,不能请求转发到页面
	}
	//添加部门====接受同步请求====返回页面====功能同上👆
	/*@RequestMapping("/insertDeptInfo")
	public String insertDeptInfo(@RequestParam("deptName")String deptName,
			@RequestParam("deptInfo")String deptInfo){
		SysDept dept = new SysDept(null,deptName,deptInfo);
		deptService.insertDeptInfo(dept);
		return "index";//返回页面
	}*/
	
	

	
	
}
