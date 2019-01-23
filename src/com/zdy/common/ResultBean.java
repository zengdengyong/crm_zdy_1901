package com.zdy.common;

import lombok.Getter;
import lombok.Setter;
/**
 * 请求成功
 * 		没有异常信息
 * 		有数据返回
 * 请求失败
 * 		没有异常信息
 * 		有异常信息
 * 
 * @author Administrator
 *
 */
@Setter
@Getter
public class ResultBean {
	private boolean success;
	private String message;
	private Object data;

	//构造器
	public ResultBean(boolean success) {
		super();
		this.success = success;
	}
	
	 //请求成功，没有异常信息
	 
	public static ResultBean success(){
		return new ResultBean(true);
	}
	
	//请求成功，有数据返回
	public static ResultBean success(Object data){
		ResultBean resultBean = new ResultBean(true);
		resultBean.setData(data);
		return  resultBean;
	}

	//请求失败
	public static ResultBean fail(){
		return new ResultBean(false);
	}
	//请求失败，有异常信息返回
	public static ResultBean fail(String message){
		ResultBean resultBean = new ResultBean(false);
		resultBean.setMessage(message);
		return resultBean;
	}
	
	
}
