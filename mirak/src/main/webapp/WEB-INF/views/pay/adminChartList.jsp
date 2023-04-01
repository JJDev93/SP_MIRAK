<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/common/admin_hd.jsp"></jsp:include>
<c:set var="path" value="${pageContext.request.contextPath}" />
 <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
<style>
.chart-wrapper {
	position: relative;
}
#chartWrapper2 {
	float: left;
	margin-left : 40px;
}
#chartWrapper3 {
	float: right;
	margin-right : 40px;
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

<div class="ftco-section admin-list">
  <div class="justify-content-center mb-3 pb-3">
	<div class="heading-section text-center">
		<h2>차트관리</h2>
		<p>차트관리 리스트 페이지 입니다.</p>
	</div>
  </div>
  <div class="container" style="max-width: 1400px;">
    <div class="main-panel">
      <div class="content">
        <div class="row">
          <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card card-stats">
              <div class="card-body ">
                <div class="row">
                  <div class="col-5 col-md-4">
                    <div class="icon-big text-center icon-warning">
                      <i class="nc-icon nc-globe text-warning"></i>
                    </div>
                  </div>
                  <div class="col-7 col-md-8">
                    <div class="numbers">
                      <p class="card-category">총 매출</p>
                      <p class="card-title">1234<p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card card-stats">
              <div class="card-body ">
                <div class="row">
                  <div class="col-5 col-md-4">
                    <div class="icon-big text-center icon-warning">
                      <i class="nc-icon nc-money-coins text-success"></i>
                    </div>
                  </div>
                  <div class="col-7 col-md-8">
                    <div class="numbers">
                      <p class="card-category">평균 일매출</p>
                      <p class="card-title">123<p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card card-stats">
              <div class="card-body ">
                <div class="row">
                  <div class="col-5 col-md-4">
                    <div class="icon-big text-center icon-warning">
                      <i class="nc-icon nc-vector text-danger"></i>
                    </div>
                  </div>
                  <div class="col-7 col-md-8">
                    <div class="numbers">
                      <p class="card-category">회원 수</p>
                      <p class="card-title">123<p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card card-stats">
              <div class="card-body ">
                <div class="row">
                  <div class="col-5 col-md-4">
                    <div class="icon-big text-center icon-warning">
                      <i class="nc-icon nc-favourite-28 text-primary"></i>
                    </div>
                  </div>
                  <div class="col-7 col-md-8">
                    <div class="numbers">
                      <p class="card-category">뭐넣지</p>
                      <p class="card-title">ASD<p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="card ">
              <div class="card-header ">
                <h5 class="card-title">매출 Top10</h5>
              </div>
              <div class="card-body ">
					<canvas id="myChart1" width="1300" height="380"></canvas>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-4">
            <div class="card ">
              <div class="card-header ">
                <h5 class="card-title">실 구매율</h5>
              </div>
              <div class="card-body ">
						<canvas id="myChart2" width="478" height="239"></canvas>
              </div>
              <div class="card-footer ">
                <div class="legend">
                  <i class="fa fa-circle text-primary"></i> Opened
                  <i class="fa fa-circle text-warning"></i> Read
                  <i class="fa fa-circle text-danger"></i> Deleted
                  <i class="fa fa-circle text-gray"></i> Unopened
                </div>
                <hr>
              </div>
            </div>
          </div>
          <div class="col-md-8">
            <div class="card card-chart">
              <div class="card-header">
                <h5 class="card-title">NASDAQ: AAPL</h5>
              </div>
              <div class="card-body">
                <canvas id="myChart3" width="1015" height="253"></canvas>
              </div>
              <div class="card-footer">
                <div class="chart-legend">
                  <i class="fa fa-circle text-info"></i> Tesla Model S
                  <i class="fa fa-circle text-warning"></i> BMW 5 Series
                </div>
                <hr />
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
 </div>
	<jsp:include page="/common/admin_ft.jsp"></jsp:include>
	<script src="${path}/resources/js/chartjs.min.js"></script>
	<script src="${path}/resources/js/mirakChart.js"></script>