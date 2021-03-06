<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link href="${pageContext.request.contextPath}/resetPassword/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resetPassword/css/signin.css" rel="stylesheet">

	<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
</head>
<body>
	<div class="signin">
	<div class="signin-head"><img src="${pageContext.request.contextPath}/resetPassword/images/test/head_120.png" alt="" class="img-circle"></div>
	
	<!--登录表单提交  -->
	<form class="form-signin" role="form" action="${pageContext.request.contextPath}/auth/getVerification" method="post">
			<h3 style="color: green">
				邮箱验证
			</h3>
			<!-- 打印错误信息 -->
			<div class="error_tips" id="error_tips" style="visibility: visible;">
				<span style="color: red">${message }&nbsp;</span>
			</div>
			
		<input name="userMail" type="text" class="form-control" placeholder="请输入qq邮箱获取验证码" required autofocus />
		<button class="btn btn-lg btn-warning btn-block" type="submit">确定</button>
		
	</form>
		<button class="btn btn-sm btn-primary btn-block" id="btn_login">回到登录页面</button>
</div>

</body>
<script type="text/javascript">
	/*提示信息3秒消失!  */
	function codefans() {
		var box = document.getElementById("error_tips");
		box.style.visibility = "hidden";
	}
	setTimeout("codefans()", 3000);//2秒，可以改动
	
	$("#btn_login").on("click",function(){
		window.location.href="${pageContext.request.contextPath}/auth/login";
	})
</script>

</html>