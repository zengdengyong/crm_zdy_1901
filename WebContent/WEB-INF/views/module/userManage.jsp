<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 引入添加页面(模态框) -->
<jsp:include page="/WEB-INF/views/modal/updateUser.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/modal/addUser.jsp"></jsp:include>

<div>
	<!--搜索框  -->
	<div class="panel-heading">
		<h3 class="panel-title">
			<div class="row">
				<div class="col-md-2">
					<h3>部门列表</h3>
				</div>
				<div class="col-md-10">
					<!--添加用户按钮-->
					<button type="button" class="btn btn-primary btn-sm"
						data-toggle="modal" data-target="#addUserModal">
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
						添加员工
					</button>

				</div>
			</div>
		</h3>

	</div>

	<!-- table表格 -->
	<table class="table">
		<thead>
			<tr>
				<th>员工编号</th>
				<th>员工姓名</th>
				<th>员工职务</th>
				<th>所在部门</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="tbody1">
			<c:forEach items="${pageInfo.list}" var="user">
				<tr>
				
					<td>${user.id}</td>
					<td>${user.userName}</td>
					<td>${user.remark}</td>
					<td>${user.userDeptName}</td>
					<td>
						<button class="btn btn-warning btn-sm" data-toggle="modal"
							data-target="#updateUserModel" onclick="updateUser(${user.id})">
							<span class="glyphicon glyphicon-check" aria-hidden="true"></span>修改
						</button>&nbsp;&nbsp;&nbsp;

						<button class="btn btn-danger  btn-sm"
							onclick="deleteUser(${user.id})">
							<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除
						</button> &nbsp;&nbsp;&nbsp;
						<button class="btn btn-primary  btn-sm">
							<span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span></span>分配角色
						</button> 
					</td>


				</tr>
			</c:forEach>

		</tbody>
	</table>
	
	<!--分页条  -->
	<jsp:include page="/WEB-INF/views/common/tabs.jsp"></jsp:include>

</div>

<script>

//分页功能
/* ${pageContext.request.contextPath }/user/queryUsers  */
$("li[pageNum]").on("click", function(event){
	//阻止浏览器默认行为
	event.preventDefault();
	//阻止事件冒泡
	event.stopPropagation();	
	var requestURL = "${pageContext.request.contextPath }/user/selectAllUsers";
	var pageNum = $(this).attr("pageNum");
	var param = {
		"page": pageNum
	};
	$.ajax({
		url: requestURL,
		type : "POST",
		data: param,
		success: function(result){
			$("#content").html(result);
		} 
	})
})

/* //删除客户资料
function deleteUser(id){
	//阻止浏览器默认行为
	event.preventDefault();
	//阻止事件冒泡
	event.stopPropagation();
	if(confirm("确定删除么?")){
		
		var param={
				"id":id
			}
			$.ajax({
				url: "${pageContext.request.contextPath }/user/deleteUser",
				type : "post",
				data: param,
				success: function(result){
					if(result){
						$("#content").html(result);

					}
				} 
			})
	}
}
	
 */
	


</script>











