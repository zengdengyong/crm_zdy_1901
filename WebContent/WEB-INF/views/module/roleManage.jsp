<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div>
	<!--搜索框  -->
	<div class="panel-heading">
		<h3 class="panel-title">
			<div class="row">
				<div class="col-md-2">
					<h3>角色列表</h3>
				</div>
				<div class="col-md-10">
					<!--添加用户按钮-->
					<button type="button" class="btn btn-primary btn-sm"
						data-toggle="modal" data-target="#addDeptModal">
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
						添加角色
					</button>

				</div>
			</div>
		</h3>

	</div>

	<!-- table表格 -->
	<table class="table">
		<thead>
			<tr>
				<th>职务编号</th>
				<th>职务名称</th>
				<th>所属部门</th>
				<th>备注</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="tbody1">
			<c:forEach items="${roles}" var="role">
				<tr>
					<td>${role.id}</td>
					<td>${role.name}</td>
					<td>${role.deptName}</td>
					<td>${role.remark}</td>
					<td>
						
						<button class="btn btn-warning btn-sm" data-toggle="modal"
							data-target="#updateDeptModel" onclick="updateRole(${role.id})">
							<span class="glyphicon glyphicon-check" aria-hidden="true"></span>修改
						</button>

						<button class="btn btn-danger  btn-sm"
							onclick="deleteRole(${role.id})">
							<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除
						</button> 
						
						<button class="btn btn-primary  btn-sm">
							<span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span></span>分配资源
						</button> 
					</td>


				</tr>
			</c:forEach>

		</tbody>
	</table>

</div>