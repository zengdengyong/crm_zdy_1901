<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 修改 -->

	<div class="modal fade" id="updateUserModel" role="dialog"
		aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
		<!--添加隐藏域  -->
			
			
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">编辑客户:</h4>
				</div>
				<br />

				<form action="${pageContext.request.contextPath }/user/updateUser" method="post">
					<!-- 隐藏域,用于添加id -->
					<input type="hidden" name="id" id="updateUserId" value="" />
					<!-- ===================================== -->
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
						<select class="form-control" id="deptId">
							<option>-请选择-</option>
						</select>
					</div>
					
					
					<div class="form-group">
						<label for="userMail">&nbsp;&nbsp;&nbsp;备注:</label> <input
							type="text" class="form-control" name="remark" id="remark"
							placeholder="备注">
					</div>
					
					<!--==================================  -->

					<br /> <br /> <br /> <br />
					<div class="modal-footer">
						<button type="button" class="btn btn-warning" data-dismiss="modal">关闭</button>
						<button type="submit" class="btn btn-primary" >提交</button>
					</div>

				</form>

			</div>


		</div>
	</div>

<script>
//模态框操作
//模态框操作
//回显部门信息
//向模态框传id(做修改功能)
	function updateUser(id){
		$("#updateUserId").attr('value',id);//隐藏域的id=updateUserId
	}
	//查询用户并回显
	$(function () {
		$('#updateUserModel').on('shown.bs.modal', function (e) {
			var param={
				"id":$("#updateUserId").val()
			}
			$.ajax({
				url: "${pageContext.request.contextPath }/user/queryUserById",
				type : "get",
				//async:false,
				data: param,
				success: function(res){
					$("#userName").val(res.username);
					$("#userPassword").val(res.password);
					$("#userMail").val(res.userMail);
					$("#deptName").val(res.userDeptName);
					$("#remark").val(res.remark);
					
				} 
			})
		})
	})

</script>
	
