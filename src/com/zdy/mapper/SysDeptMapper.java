package com.zdy.mapper;

import java.util.List;

import com.zdy.model.SysDept;

public interface SysDeptMapper {
	
	//查询所有的部门信息
	List<SysDept> selectAllDeptInfo();
	
	
	
    int deleteByPrimaryKey(Integer id);

    int insert(SysDept record);

    
    int insertSelective(SysDept record);

    
    SysDept selectByPrimaryKey(Integer id);

    
    int updateByPrimaryKeySelective(SysDept record);

    
    int updateByPrimaryKey(SysDept record);
}