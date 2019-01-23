//package com.zdy.interceptor;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.web.servlet.HandlerInterceptor;
//
//import com.zdy.model.SysUser;
//
//public class AuthInterceptor implements HandlerInterceptor {
//	//拦截用户是否登录
//	@Override
//	public boolean preHandle(HttpServletRequest request,
//			HttpServletResponse response, Object handler) throws Exception {
//		boolean flag = false;
//		if(!flag){
//			//获取作用域判断是否有student对象
//			SysUser user = (SysUser) request.getSession().getAttribute("user");
//			//判断用户是否登录
//			if(user == null){
//				//如果没有登录，设置提示信息，跳转到登录页面
//				request.setAttribute("message", "没有登录，请先登录");
//				request.getRequestDispatcher("/auth/login").forward(request, response);
//				return flag;
//			}else{
//				//如果已经登录，直接放行！！！
//				flag = true;
//			}
//		}
//		return flag;
//	}
//	
//	
////	
////	@Override
////	public void afterCompletion(HttpServletRequest request,
////			HttpServletResponse response, Object handler, Exception ex)
////					throws Exception {
////		System.out.println("afterCompletion==========");
////		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
////	}
////	
////	@Override
////	public void postHandle(HttpServletRequest request,
////			HttpServletResponse response, Object handler,
////			ModelAndView modelAndView) throws Exception {
////		System.out.println("postHandle==========");
////		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
////	}
////	
//	
//	
//	
//}
//
//
//
//
//
//
//
