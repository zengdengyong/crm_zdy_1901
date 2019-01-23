package com.zdy.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zdy.base.BaseService;
import com.zdy.common.Constants;
import com.zdy.model.SysUser;
import com.zdy.vo.UserVo;


@Service
@Transactional
public class UserService extends BaseService {
	
	//查询所有的用户=====分页
	public PageInfo<UserVo> selectAllUsers(Integer page){
		PageHelper.startPage(page,Constants.PAGE_SIZE);
		return new PageInfo<UserVo>(userMapper.selectAllUsers());
	}
	
	
	//通过id查询对用的用户信息
	public SysUser selectUserById(Integer id){
		return super.userMapper.selectUserById(id);
	}
	
	//通过用户名密码查询=====用于shiro认证
	public SysUser selectUserByNameAndPwd(String userNameOrMail){
		return userMapper.selectUserByNameAndPwd(userNameOrMail);
	}
	//判断是否有对应的用户名或者邮箱
	public boolean hasUser(String userNameOrMail){
		SysUser user = selectUserByNameAndPwd(userNameOrMail);
		boolean flag = false;
		if(user!=null){
			flag = true;
		}
		return flag;
	}
	//修改密码
	public void updatePassword(String userMail,String userPassword){
		userMapper.updatePassword(userMail, userPassword);
	}
	
	
	
	
	
	
	
	
	
	
	
	//检查用户登录=====用于自定义拦截器
		/*public boolean isUser(String userNameOrMail, String password) {
			//调用上面面的方法===名字或者通过邮箱密码查询对应用户
			SysUser user = userMapper.selectUserAuth(userNameOrMail, password);
			if(user!=null){
				super.session.setAttribute("user", user);
				return true;
			}else{
				return false;
			}
			
		}*/
	
}












