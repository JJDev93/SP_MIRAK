<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/common/admin_hd.jsp"></jsp:include>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0/dist/chartjs-plugin-datalabels.min.js"></script>

<style>
.chart-wrapper {
	position: relative;
}
#chartWrapper2 {
	margin-left : 100px;
}
#chartWrapper3 {
	float: right;
	margin-right : 100px;
}

.chart-visible {
	display: inline-block;
}

.chart-hidden {
	display: none;
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
					<div class="col-md-1"></div>
					<div class="col-md-10">
						<div id="chartWrapper1" class="chart-visible">
							<canvas id="myChart1" width="950" height="400"></canvas>
						</div>
						<div id="chartWrapper2" class="chart-hidden">
							<canvas id="myChart2" width="300" height="300"></canvas>
						</div>
						<div id="chartWrapper3" class="chart-hidden">
							<canvas id="myChart3" width="300" height="300"></canvas>
						</div>
					</div>
					<div class="col-md-1"></div>
				</div>
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-5">
						<canvas id="myChart4" width="450" height="400"></canvas>
					</div>
					<div class="col-md-5">
<%-- 						<canvas id="myChart4" width="450" height="400"></canvas> --%>
					</div>
					<div class="col-md-1"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/common/admin_ft.jsp"></jsp:include>
<script src="${path}/resources/js/chart.js"></script>