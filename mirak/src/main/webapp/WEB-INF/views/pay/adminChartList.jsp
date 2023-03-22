<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/common/admin_hd.jsp"></jsp:include>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
.container {
	
}

canvas {
	display: inline-block;
}
</style>

<div class="ftco-section">
	<div class="justify-content-center mb-3 pb-3">
		<div class="heading-section text-center">
			<h2>차트관리</h2>
			<p>차트관리 리스트 페이지 입니다.</p>
		</div>
	</div>
	<div class="container">
		<div class="bd-example-snippet bd-code-snippet">
			<div class="bd-example">
				<div class="row">
					<div class="col-md-7">
						<canvas id="myChart1" width="600" height="450"></canvas>
					</div>
					<div class="col-md-5">
						<canvas id="myChart2" width="500" height="400"></canvas>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<canvas id="myChart3" width="1200" height="450"></canvas>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="${path}/resources/js/chart.js"></script>
<jsp:include page="/common/admin_ft.jsp"></jsp:include>