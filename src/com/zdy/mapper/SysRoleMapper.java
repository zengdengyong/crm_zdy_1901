package com.zdy.mapper;

import java.util.List;

import com.zdy.model.SysRole;
import com.zdy.vo.RoleVo;

public interface SysRoleMapper {
	//查询所有的角色
	List<RoleVo> selectAllRoles();
	
	
	
    
    int deleteByPrimaryKey(Integer id);
    
    int insert(SysRole record);
    
    int insertSelective(SysRole record);
    
    SysRole selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SysRole record);
    
    int updateByPrimaryKey(SysRole record);
}