package com.zdy.mapper;

import com.zdy.model.SysResource;

public interface SysResourceMapper {
    
    int deleteByPrimaryKey(Integer id);

    
    int insert(SysResource record);

    
    int insertSelective(SysResource record);

    
    SysResource selectByPrimaryKey(Integer id);

    
    int updateByPrimaryKeySelective(SysResource record);

    
    int updateByPrimaryKey(SysResource record);
}