<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<!-- 添加客户的模态框 -->
	
	<div class="modal fade" id="addUserModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" data-backdrop="static">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">添加用户:</h4>
				</div>
				<br />
				<!-- action="${pageContext.request.contextPath }/user/addUser" method="post"-->
				<form action="${pageContext.request.contextPath }/user/insertUser" method="post">
				
					<div class="form-group">
						<label for="userName">&nbsp;&nbsp;&nbsp;用户名称:</label> 
						<input 	type="text" class="form-control" name="username" id="userName" 
							placeholder="请填写用户名称">
					</div>
					
					<div class="form-group">
						<label for="userPassword">&nbsp;&nbsp;&nbsp;用户密码:</label> <input
							type="text" class="form-control" name="password" id="userPassword"
							placeholder="请填写用户密码">
					</div>
					<div class="form-group">
						<label for="userMail">&nbsp;&nbsp;&nbsp;用户邮箱:</label> <input
							type="text" class="form-control" name="userMail" id="userMail"
							placeholder="请填写用户邮箱">
					</div>
					
					<div class="form-group">
						<label for="cName">&nbsp;&nbsp;&nbsp;员工部门名称:</label>
						<input 	type="text" class="form-control" id="deptName" 
							placeholder="请填写员工部门名称">
						<button type="button" onclick="getDeptList()">搜索</button>
						<!--下拉列表-->
						<select name="userDeptId" class="form-control" id="deptId">
							<option>-请选择-</option>
						</select>
					</div>
					<div class="form-group">
						<label for="userMail">&nbsp;&nbsp;&nbsp;备注:</label> <input
							type="text" class="form-control" name="remark" id="remark"
							placeholder="备注">
					</div>
				<!-- ==================================== -->
					
					<br /> <br /> <br /> <br s />
					<div class="modal-footer">
						<button type="button" class="btn btn-warning" data-dismiss="modal">关闭</button>
						<button type="submit" class="btn btn-primary">提交</button>
					</div>

				</form>

			</div>


		</div>
	</div>
	
	
	
<script>
//回显部门名(添加功能)
function getDeptList(){
	var deptName = $("#deptName").val();
	var param={
			"deptName":deptName
		}
		$.ajax({
			url: "${pageContext.request.contextPath }/dept/queryDeptList",
			type : "get",
			data: param,
			success: function(result){
				if(result){
					var childStr = "";
					if(result.length>1){
						for(var i=1;i<result.length;i++){
							childStr += "<option value='" + result[i]['id'] + "'>" + result[i]['deptName'] + "</option>";
						}
						$("#deptId").html(childStr);
					}
				}
				
			} 
		})
} 



$(function () {
	/*
	$("#addUser").on("click",function(){
		
			  alert(111);
	 	$('#addUser').on('hidden.bs.modal', function (e) {
			  // do something...
		}) 
		
		 //阻止浏览器默认行为
		event.preventDefault();
		//阻止事件冒泡
		event.stopPropagation();
		//添加用户 
		var param = {
				"userName":$("#userName").val(),
				"userInfo":$("#userInfo").val()
		}

		$.ajax({
			url: "${pageContext.request.contextPath }/user/adduser",
			type : "post",
			data:param,
			success:function(result){
				$("#content").html(result);
				 if(result){  
					 $('.modal-backdrop').css('background','none');
					$('.modal-backdrop').css('z-index','-999'); 
					
				} 
			}  
		})
	})
	*/
	
})




</script>