<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<!-- 添加客户的模态框 -->
	
	<div class="modal fade" id="addDeptModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" data-backdrop="static">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">添加客户:</h4>
				</div>
				<br />
				
				<!-- action="${pageContext.request.contextPath }/dept/insertDeptInfo" method="post"-->
				<form>
					<div class="form-group">
						<label for="cName">&nbsp;&nbsp;&nbsp;部门名称:</label> 
						<input 	type="text" class="form-control" name="deptName" id="deptName" 
							placeholder="请填写部门名称">
					</div>
					
					<div class="form-group">
						<label for="tel">&nbsp;&nbsp;&nbsp;部门详细信息介绍:</label> <input
							type="text" class="form-control" name="deptInfo" id="deptInfo"
							placeholder="请填写部门详细信息">
					</div>
					
				
					
					<br /> <br /> <br /> <br />
					<div class="modal-footer">
						<button type="button" class="btn btn-warning" data-dismiss="modal">关闭</button>
						<!-- 用于同步====<button type="submit" class="btn btn-primary">提交</button> -->
						<button type="button" class="btn btn-primary" id="btn" >提交</button>
					</div>

				</form>

			</div>


		</div>
	</div>
	
	
	
<script>
//先尝试用同步======暂时不用异步提交
 $(function () {
	$("#btn").on("click",function(){
		 //阻止浏览器默认行为
		event.preventDefault();
		//阻止事件冒泡
		event.stopPropagation();
		//添加用户 
		debugger;
		var param = {
				"deptName":$("#deptName").val(),
				"deptInfo":$("#deptInfo").val()
		}
		$.ajax({
			url: "${pageContext.request.contextPath }/dept/insertDeptInfo",
			type : "post",
			data:param,
			success:function(result){
				 if(result){  
					$("#content").html(result);
					$(".modal-backdrop").remove();//手动关闭遮罩层
				//  $('.modal-backdrop').css('background','none');
				//	$('.modal-backdrop').css('z-index','-999'); 
				} 
			}  
		})
	})
}) 


</script>