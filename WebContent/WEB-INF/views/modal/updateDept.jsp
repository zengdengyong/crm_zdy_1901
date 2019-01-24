<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 修改 -->

	<div class="modal fade" id="updateDeptModel" role="dialog"
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
				
				
					<!--action="${pageContext.request.contextPath }/dept/updateDeptInfoById" method="post"  -->
				<form>
					<!-- 隐藏域,用于添加id -->
					<input type="hidden" name="id" id="updateDeptId" value="" />
					
					<div class="form-group">
						<label for="deptName_id">&nbsp;&nbsp;&nbsp;部门名称:</label> <input
							type="text" class="form-control" name="deptName" id="deptName_id"
							placeholder="请填写部门名称" />
					</div>
					<div class="form-group">
						<label for="deptInfo_id">&nbsp;&nbsp;&nbsp;部门详细信息:</label> <input
							type="text" class="form-control" name="deptInfo" id="deptInfo_id"
							placeholder="请填写部门详细信息"  >
					</div>
					

					<br /> <br /> <br /> <br />
					<div class="modal-footer">
						<button type="button" class="btn btn-warning" data-dismiss="modal">关闭</button>
						<!-- <button type="submit" class="btn btn-primary" >提交</button> -->
						<button type="button" class="btn btn-primary" id ="btn_update" >提交</button>
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
	function updateDept(id){
		$("#updateDeptId").attr('value',id);//隐藏域的id=updateDeptId
	}
	//查询部门信息并回显
	$(function () {
		$('#updateDeptModel').on('shown.bs.modal', function (e) {
			var param={
				"id":$("#updateDeptId").val()
			}
			$.ajax({
				url: "${pageContext.request.contextPath }/dept/selectByPrimaryKey",
				type : "get",
				//async:false,
				data: param,
				success: function(res){
					if(res.success){
						$("#deptName_id").val(res.data.deptName);
						$("#deptInfo_id").val(res.data.deptInfo);
						
					}
					
				} 
			})
		})
	})
	//====修改数据====用异步先
	$(function () {
	$("#btn_update").on("click",function(){
		 debugger;
		//添加用户 
		var param = {
				"id":$("#updateDeptId").val(),
				"deptName":$("#deptName_id").val(),
				"deptInfo":$("#deptInfo_id").val()
		}
		$.ajax({
			url: "${pageContext.request.contextPath }/dept/updateDeptInfoById",
			type : "post",
			data:param,
			success:function(result){
				 if(result){  
					$("#content").html(result);
					$(".modal-backdrop").remove();//手动关闭遮罩层
					/*  $('.modal-backdrop').css('background','none');
					$('.modal-backdrop').css('z-index','-999');  */
				} 
			}  
		})
	})
})


</script>
	
