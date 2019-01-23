package com.zdy.util;
/**
 * 
 * @author 曾登勇
 * 生成4位数的随机数
 *
 */
public class VerificationUtil {
	//获取1000到10000的随机数
	private  static final Integer NUM_FINAL = 9000;
	
	public static String getVerification(){
		int num;
		num =(int)(Math.random()*NUM_FINAL);
//		String str = String.valueOf(num+1000);
		String str = Integer.toString(num+1000);
		return str;
	}
}
