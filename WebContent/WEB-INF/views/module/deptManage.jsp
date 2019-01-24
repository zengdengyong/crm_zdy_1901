<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 引入添加页面(模态框) -->
<jsp:include page="/WEB-INF/views/modal/updateDept.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/modal/addDept.jsp"></jsp:include>

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
						data-toggle="modal" data-target="#addDeptModal">
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
						添加部门
					</button>

				</div>
			</div>
		</h3>

	</div>

	<!-- table表格 -->
	<table class="table">
		<thead>
			<tr>
				<th>部门编号</th>
				<th>部门名称</th>
				<th>部门详细信息</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="tbody1">
			<c:forEach items="${allDeptInfo}" var="dept">
				<tr>
					<td>${dept.id}</td>
					<td>${dept.deptName}</td>
					<td>${dept.deptInfo}</td>
					<td>
						<button class="btn btn-warning btn-sm" data-toggle="modal"
							data-target="#updateDeptModel" onclick="updateDept(${dept.id})">
							<span class="glyphicon glyphicon-check" aria-hidden="true"></span>修改
						</button>

						<button class="btn btn-danger  btn-sm"
							onclick="deleteDept(${dept.id})">
							<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除
						</button> 
					</td>


				</tr>
			</c:forEach>

		</tbody>
	</table>

</div>

<script>

//删除客户资料
function deleteDept(id){
	//阻止浏览器默认行为
	event.preventDefault();
	//阻止事件冒泡
	event.stopPropagation();
	debugger;
	if(confirm("确定删除么?")){
		var param={
				"userDeptId":id
			}
			$.ajax({
				url: "${pageContext.request.contextPath }/dept/deleteByPrimaryKey",
				type : "post",
				data: param,
				dataType: "json",
				success: function(result){
					if(result.success){
						alert("删除成功!");
						
					}else {
						alert(result.message);
					}
				} ,error:function(){
					debugger;
					alert("请求失败!")
				}
				 
				
				
			})
	}
}


</script>











