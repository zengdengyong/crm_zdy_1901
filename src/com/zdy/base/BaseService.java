package com.zdy.base;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import com.zdy.mapper.SysDeptMapper;
import com.zdy.mapper.SysUserMapper;

/**
 * 注入业务对象
 * @author Administrator
 *
 */
public abstract class BaseService {
	@Resource
	protected HttpSession session;
	@Resource
	protected SysUserMapper userMapper;
	@Resource
	protected SysDeptMapper deptMapper;
}
