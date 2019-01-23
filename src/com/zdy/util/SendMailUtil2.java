package com.zdy.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMailUtil2 {
	
	/**
	 * @author 曾登勇
	 * @param fromMailName=947161829@qq.com 	17628289246@163.com
	 * @param password="knrfcxzyjtmxbfjf";rkprgxcfdjcwbfch	网易：zdy66071
	 * @param toMailName=841744676@qq.com
	 * @param subject  	:消息的标题
	 * @param content	:消息内容
	 * @param type		:发送源邮箱的类型:qq或者163
	 * 目前只能用于发简单的邮件
	 * 注意:导入jar包时候,除了到必须的jar包外还应该导入commons-io
	 */
	public static void sendMessage(String fromMailName,String password,String toMailName,String subject,String content,String type){
		
		 Properties prop = new Properties();
		 prop.setProperty("mail.host", "smtp."+type+".com");//把邮箱类型加进去
		 prop.setProperty("mail.transport.protocol", "smtp");//必须选择协议，什么邮箱都一样
		 prop.setProperty("mail.smtp.auth", "true");//必须 普通客户端
		 
		 
		  //使用JavaMail发送邮件的5个步骤
		 //1、创建session
		 Session session = Session.getInstance(prop);
		 //开启Session的debug模式，这样就可以查看到程序发送Email的运行状态
		 session.setDebug(true);
		 try {
			 //2、通过session得到transport对象
			  Transport ts = session.getTransport();
			 //3、使用邮箱的用户名和密码连上邮件服务器，发送邮件时，发件人需要提交邮箱的用户名和密码给smtp服务器，用户名和密码都通过验证之后才能够正常发送邮件给收件人。
//			 ts.connect("smtp.qq.com", fromMailName, password);//qq邮箱的
			 ts.connect("smtp."+type+".com", fromMailName, password);//网易邮箱的
			 //4、创建邮件
			 Message message = createSimpleMail(session,fromMailName,toMailName,subject,content);
			//5、发送邮件
			 ts.sendMessage(message, message.getAllRecipients());
			 ts.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(System.out);
		}
		
	}
	
	
/**
	 * @author 曾帅
	 * @param session
	 * @return
	 * @throws Exception
	 */
	//创建邮件
	private static MimeMessage createSimpleMail(Session session,String fromMailName, String toMailName,String subject,String content)
			throws Exception {
		// 创建邮件对象
		MimeMessage message = new MimeMessage(session);
		// 指明邮件的发件人
		message.setFrom(new InternetAddress(fromMailName));
		// 指明邮件的收件人，现在发件人和收件人是一样的，那就是自己给自己发
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(toMailName));
		// 邮件的标题
		message.setSubject(subject);
		// 邮件的文本内容
		message.setContent(content, "text/html;charset=UTF-8");
		// 返回创建好的邮件对象
		return message;
	}
}