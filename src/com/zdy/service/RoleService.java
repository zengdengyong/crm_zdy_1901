package com.zdy.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zdy.base.BaseService;
import com.zdy.model.SysDept;
import com.zdy.vo.RoleVo;

@Service
@Transactional
public class RoleService extends BaseService {
	//查询所有的部门信息
	public List<RoleVo> selectAllRoles(){
		return roleMapper.selectAllRoles();
	}
	
	
}
