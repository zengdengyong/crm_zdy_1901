package com.zdy.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.zdy.base.BaseController;
import com.zdy.common.Constants;
import com.zdy.util.FileUploadUtil;
import com.zdy.util.SendMailUtil2;
import com.zdy.util.VerificationUtil;


@Slf4j
@Controller
@RequestMapping("/auth")
public class AuthController extends BaseController{
	//登录页面
	@RequestMapping(value="/login")
	public String  login(){
		System.out.println("login for GetMapping!!!!");
		return "login";
	}
	//用shiro认证
	@PostMapping(value="/login")
	public String  login(@RequestParam(value="userNameOrMail",defaultValue="")String userNameOrMail,
			@RequestParam(value="userPassword",defaultValue="")String userPassword,
			Model model){
		//构建token
		UsernamePasswordToken token = new UsernamePasswordToken(userNameOrMail, userPassword);
		//构建subject
		Subject subject = SecurityUtils.getSubject();
		//执行登录操作
		try {
			subject.login(token);
			//用户名存入作用域
			session.setAttribute("userNameOrMail", userNameOrMail);
			//登录成功
			return "forward:/auth/index";
		} catch (AuthenticationException e) {
			log.info("认证失败");
			model.addAttribute("message", "用户名或者密码错误,请重新登录!");
			return "login";
		} 
	}
	
	//跳转到主页
	@RequestMapping("/index")
	public String goIndex(){
		return "index";
	}
	
	//切换账号，退出登录
	@RequestMapping("logout")
	public String logout(){
		super.session.invalidate();
		return "login";
	}
		
	//忘记密码,跳转到邮箱验证
	@GetMapping("/getVerification")
	public String getVerification(){
		return "auth/getVerification";
	}
	
	//获取验证码
	@PostMapping("/getVerification")
	public String getVerification(@RequestParam("userMail")String userMail,Model model){
		//首先应该判断是否有该邮箱号
		boolean hasUser = userService.hasUser(userMail);
		if(hasUser){
			//保存输入的邮箱到session
			session.setAttribute("userMail", userMail);
			//发送验证码到邮箱
			String fromMailName="17628289246@163.com";
			String password="zdy66071";
			String subject="验证码";
			//获取验证码
			String verification = VerificationUtil.getVerification();
			session.setAttribute("verificationCode", verification);
			String content="您获取的验证码是:"+verification;
			//发送验证码到邮箱
			SendMailUtil2.sendMessage(fromMailName, password, userMail, subject, content, "163");
//				SendMailUtil.sendMessage(fromMailName, password, sEmail, subject, content);
			return "auth/validateMail";
		}else{
			model.addAttribute("message", "没有该邮箱!");
			return "auth/getVerification";
		}
		
	}
		
	/**
	 * 检查验证码
	 * @return
	 */
	@RequestMapping("/validateMail")
	public String validate(@RequestParam("verification")String verification,HttpSession session,Model model){
		String verificationCode = (String) session.getAttribute("verificationCode");
		if("".equals(verification)){
			//如果用户输入的为空
			model.addAttribute("message", "验证码不能为空");
			return "auth/validateMail";
		}else{
			if(verificationCode.equals(verification)){
				return "auth/alterPassword";
			}else{
				model.addAttribute("message", "验证码不对!");
				return "auth/validateMail";
			}
		}
	}
		
	/**
	 * 修改密码
	 * @param session
	 * @return
	 */
	@RequestMapping("/alterPassword")
	public String resetPassword(@RequestParam("password1")String password1,
								@RequestParam("password2")String password2,
								Model model){
		if(!password1.equals(password2)){
			model.addAttribute("message", "两次输入的密码不对应");
			return "auth/alterPassword";
		}else{
			
			//从作用域获取邮箱名字=====在获取验证码的时候就放入了作用域
			String userMail = (String) super.session.getAttribute("userMail");
			//对密码进行MD5的二次加密
			String password = new Md5Hash(password1,Constants.SALT,2).toString();
			//修改密码
			userService.updatePassword(userMail, password);
			//重新登录
			model.addAttribute("message", "密码修改成功,请重新登录!");
			return "login";
		}
	}
	//文件上传
	@PostMapping("/uploadFile")
	public String testUploadUtil(MultipartFile uploadFile,HttpServletRequest request) throws IOException{
		String folder = "zdy";//上传到的问价夹名称
		String successPage = request.getParameter("pageName");
		request.setAttribute("msg", "文件上传成功");
		return FileUploadUtil.upload(uploadFile, request, folder, successPage);
		
	}
		
		
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//检查登录...=====================下面是用拦截器的方式实现
	
	/*@PostMapping(value="/login")
	public String reLogin(
			@RequestParam("userNameOrMail")String userNameOrMail,
			@RequestParam("userPassword")String userPassword,
			HttpSession session,
			Model model){
		//先对密码进行加密
		String md5Password = new Md5Hash(userPassword, Constants.SALT, 2).toString();
		
		if(userService.isUser(userNameOrMail,md5Password)){
			
			//把用户名或者邮箱存入作用域
			session.setAttribute("userNameOrMail", userNameOrMail);
			return "index";
		}else{
			model.addAttribute("message", "用户名或者密码错误!");
			return "login";
		}
		
	}*/
		
		
}




