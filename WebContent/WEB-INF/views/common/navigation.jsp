<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>


<div id="navigationDiv">
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">管理系统</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">首页<span class="sr-only">(current)</span></a></li>
					<li><a href="#">关于我们</a></li>
					
					<!--下拉  -->
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">更多 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">Separated link</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>
				</ul>
				<form class="navbar-form navbar-left">
					<div class="form-group">
						<input id="serach" type="text" class="form-control" placeholder="请输入...">
					</div>
					<button type="button"class="btn btn-primary" id="btn_baidu">百度一下</button>
				</form>



				<ul class="nav navbar-nav navbar-right">

					<li><a href="#"><span class="glyphicon glyphicon-user"
							aria-hidden="true"></span>&nbsp;欢迎:&nbsp;${userNameOrMail }&nbsp;进入选课系统</a></li>

					<li style="color: green">
						<a href="${pageContext.request.contextPath}/auth/logout"><button
								type="button" class="btn btn-danger btn-xs">
								<span class="glyphicon glyphicon-sort" aria-hidden="true"></span>&nbsp;切换账号
							</button>
						</a>
					</li>


					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Dropdown <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">Separated link</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
</div>
<script type="text/javascript">
	//搜索
	$(function(){
		$("#btn_baidu").on("click",function(){
			var sear = $("#serach").val();
			window.location="https://www.baidu.com/s?wd="+sear;
		})
	})
</script>