<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--分页=异步请求  -->
<div class="panel-footer" id="tabs" >
	<nav aria-label="Page navigation">
		<ul class="pagination">
			<!-- 上一页, 需要判断是否显示 -->
			<c:if test="${ pageInfo.hasPreviousPage}">
				<li pageNum="${pageInfo.prePage}"><a
					href="#"
					aria-label="Previous"> <!-- <span aria-hidden="true">&laquo;</span> -->上一页
				</a></li>
			</c:if>

			<c:forEach items="${pageInfo.navigatepageNums }" var="pageCode">
				<li pageNum="${pageCode}"
					class='    <c:if test="${pageInfo.pageNum == pageCode }">active</c:if>'>
					<a
					href="#">
						${pageCode} </a>
				</li>
			</c:forEach>


			<!-- 下一页, 需要判断是否显示 -->
			<c:if test="${pageInfo.hasNextPage }">
				<li pageNum="${pageInfo.nextPage}"><a
					href="#"
					aria-label="Next">下一页<!--  <span aria-hidden="true">&raquo;</span> -->
				</a></li>
			</c:if>
		</ul>
	</nav>
</div>
