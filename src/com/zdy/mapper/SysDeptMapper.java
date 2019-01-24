package com.zdy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zdy.model.SysDept;

public interface SysDeptMapper {
	
	//通过部门id查询单个部门信息=====用于数据回显
	SysDept selectByPrimaryKey(Integer id);
	//查询所有的部门信息
	List<SysDept> selectAllDeptInfo();
	
	//通过部门id删除部门
    int deleteByPrimaryKey(Integer id);
    //添加部门信息
    void insertDeptInfo(@Param("dept")SysDept dept);
    //通过部门id修改部门信息
    int updateDeptInfoById(@Param("dept")SysDept dept);
    
    
    
    
    int insertSelective(SysDept dept);
    
    
    int insert(SysDept record);


    

    

    
    int updateByPrimaryKey(SysDept record);
}