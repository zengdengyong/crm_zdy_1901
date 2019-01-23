
package com.zdy.security.realm;

import java.util.Arrays;

import javax.annotation.Resource;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

import com.zdy.common.Constants;
import com.zdy.model.SysUser;
import com.zdy.service.UserService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
public class UserRealm extends AuthorizingRealm {
	@Resource 
	private UserService userService;
	//授权
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection arg0) {
		
		log.info("======执行授权");
		
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		
		authorizationInfo.addStringPermissions(
				Arrays.asList(
						"course:create",
						"course:update",
						"course:query",
						"student:create",
						"student:update",
						"student:query"
						));
		
		
		return authorizationInfo;
	}
	//用户认证====登录
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		log.info("======认证");
		String userNameOrMail = (String)token.getPrincipal();
		//从数据库中查询
		SysUser user = userService.selectUserByNameAndPwd(userNameOrMail);
		//查询出用户密码
		String userPassword = user.getUserPassword();
		return new SimpleAuthenticationInfo(user,userPassword,ByteSource.Util.bytes(Constants.SALT),this.getName());
		
		
	}

}
