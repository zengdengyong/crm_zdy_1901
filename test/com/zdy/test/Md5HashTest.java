package com.zdy.test;

import lombok.extern.slf4j.Slf4j;

import org.apache.shiro.crypto.hash.Md5Hash;


@Slf4j
public class Md5HashTest {
public static void main(String[] args) {
		
		String pwd = "123";
		String salt1 = "zdy";
		//通过Md5加密
		String encryptPwd1 = new Md5Hash(pwd).toString();
		log.info("123456经过md5加密算法之后得到 >> {}", encryptPwd1);
		
		//单纯加密不绝对安全, 盐
		String encryptPwd2 = new Md5Hash(pwd, salt1).toString();
		log.info("123456经过md5加密算再加盐 >> {} >> {}",salt1, encryptPwd2);
		
		//加盐并进行二次加密
		String encryptPwd3 = new Md5Hash(pwd, salt1, 2).toString();
		log.info("123456经过md5加密算再加盐hash两次 >> {} >> {}",salt1, encryptPwd3);
		
		
	}
}
