package com.zdy.service;

import java.util.List;





import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zdy.base.BaseService;
import com.zdy.common.ResultBean;
import com.zdy.model.SysDept;


@Service
@Transactional
public class DeptService extends BaseService {
	@Resource 
	private UserService userService;
	
	//查询所有的部门信息
	public List<SysDept> selectAllDeptInfo(){
		return deptMapper.selectAllDeptInfo();
	}
	//通过部门id查询对应部门信息=====用于数据回显
	public SysDept selectByPrimaryKey(Integer id){
		return deptMapper.selectByPrimaryKey(id);
	}
	
	
	//直接删除部门
	public ResultBean deleteByPrimaryKey(Integer userDeptId){
		boolean hasUserByDeptId = userService.hasUserByDeptId(userDeptId);
		if(!hasUserByDeptId){
			deptMapper.deleteByPrimaryKey(userDeptId);
			return ResultBean.success();
		}
		return ResultBean.fail("该部门有员工不能删除该部门!");
	}
	
	//添加部门信息
	public void insertDeptInfo(SysDept dept){
		deptMapper.insertDeptInfo(dept);
	}
	//更新部门信息
	public void updateDeptInfoById(SysDept dept){
		deptMapper.updateDeptInfoById(dept);
	}
	
	
}
