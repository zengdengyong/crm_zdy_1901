<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="menuDiv">
	<div class="panel panel-default">
	  <div class="panel-heading">菜单</div>
	  <div class="panel-body">
		<ul class="nav nav-pills nav-stacked nav-pills-stacked-example">
	      <li role="presentation"  class="active"><a href="${pageContext.request.contextPath }/auth/index">Home</a></li>
	     
	      <li role="presentation"  class="menu-a" request-url="${pageContext.request.contextPath }/dept/selectAllDeptInfo"><a href="#">部门管理</a></li>
	      <li role="presentation"  class="menu-a" request-url="${pageContext.request.contextPath }/user/selectAllUsers"><a href="#">用户管理</a></li>
	      <li role="presentation"  class="menu-a" request-url="${pageContext.request.contextPath }/role/selectAllRoles"><a href="#">角色管理</a></li>
	      <!-- ========================= -->
	      <li role="presentation"  class="menu-a" request-url="${pageContext.request.contextPath }/resource/resourceManage"> <a href="#"">权限管理</a></li>
	    </ul>
	  </div>
	</div>
</div>

</body>
<script>


/* 
	//在index页面操作了这里就没有必要再操作了,两个地方有一处执行了就行=================
$(function(){
	//操作菜单
	$("#menuDiv li.menu-a").on("click", function(event){
		//阻止浏览器默认行为
		event.preventDefault();
		//阻止事件冒泡
		event.stopPropagation();
		
		//移除当前处于激活态的li
		$(".menu-a").removeClass("active");
		$(this).addClass("active");
		var requestURL = $(this).attr("request-url");
		
		//跳页面
		//window.location.href=requestURL;
		$.ajax({
			url: requestURL,
			type : "get",
			success: function(result){
				$("#content").html(result);
			} 
		})
		
	})
	

	
}) */

</script>
</html>

