<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/common/admin_hd.jsp"></jsp:include>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<h2>차트</h2>
<div class="container">
	<div class="row">
		<div class="col-md-6">
			<canvas id="myChart1" width="400" height="400"></canvas>
		</div>
		<div class="col-md-6">
			<canvas id="myChart2" width="800" height="400"></canvas>
		</div>
	</div>
</div>
<script src="${path}/resources/js/chart.js"></script>
<jsp:include page="/common/admin_ft.jsp"></jsp:include>