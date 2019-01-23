<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/logins/css/style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/logins/css/body.css"/>
    
    
    
    
	<!-- <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
     -->
    
</head>
<body>
	<div class="container">
		<section id="content">
		<form action="${pageContext.request.contextPath}/auth/login" method="post">
			<h1>用户登录</h1>
			<!-- 提示用户信息 -->
			<div class="error_tips" id="error_tips" style="visibility:visible;">
				<span style="color: red">${message }&nbsp;</span>
			</div>
		
		
			<div>
				<input type="text" placeholder="账号或者关联相关邮箱账号" required="true"  name="userNameOrMail" />
			</div>
			<div>
				<input type="password" placeholder="密码" required="true" name="userPassword" />
			</div>
			<div class="">
				<span class="help-block u-errormessage" id="js-server-helpinfo">&nbsp;</span>
			</div>
			<div>
				<!-- <input type="submit" value="Log in" /> -->
				<input type="submit" value="登录" class="btn btn-primary"
					id="js-btn-login" /> <a href="${pageContext.request.contextPath }/auth/getVerification">忘记密码?</a>
				<!-- <a href="#">Register</a> -->
			</div>
		</form>
		<!-- form -->
		<div class="button">
			<span class="help-block u-errormessage" id="js-server-helpinfo">&nbsp;</span>
		</div>
		<!-- button --> </section>
		<!-- content -->
	</div>
</body>
<script type="text/javascript">
	
	/*提示信息3秒消失!  */
	function codefans() {
		var box = document.getElementById("error_tips");
		box.style.visibility = "hidden";
	}
	setTimeout("codefans()", 3000);//2秒，可以改动
	
</script>

</html>