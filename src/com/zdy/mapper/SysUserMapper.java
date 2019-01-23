package com.zdy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zdy.model.SysUser;
import com.zdy.vo.UserVo;

public interface SysUserMapper {
	//查询所有的用户
	List<UserVo> selectAllUsers();
	
	//通过id查询对用的用户信息
	SysUser selectUserById(Integer id);
    
	//查询用户名和密码是否有对应的user====用于自定义拦截器认证===暂时不用这个方法
	SysUser selectUserAuth(
			@Param("userNameOrMail")String userNameOrMail,
			@Param("password")String password);
	
	//通过用户名或者邮箱查询====shiro认证
	SysUser selectUserByNameAndPwd(@Param("userNameOrMail")String userNameOrMail);
	
	//修改密码
	void updatePassword(@Param("userMail")String userMail,@Param("userPassword")String userPassword);
	
	
	
    int deleteByPrimaryKey(Integer id);
    
    int insert(SysUser record);

    int insertSelective(SysUser record);

    int updateByPrimaryKeySelective(SysUser record);
    //批量更新
    int updateByPrimaryKey(SysUser record);
}