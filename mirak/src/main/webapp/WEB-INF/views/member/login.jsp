<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/common/client_hd.jsp"></jsp:include>
<div class="hero-wrap hero-bread"
	style="background-image: url('${path}/resources/images/bg_1.jpg');">
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="index.html">Home</a></span> <span>Login</span>
				</p>
				<h1 class="mb-0 bread">로그인</h1>
			</div>
		</div>
	</div>
</div>
<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-5 ftco-animate">
				<form action="login" method="post" class="contact-form">
					<div class="form-group">
						<input type="text" class="form-control" name="mem_id"
							placeholder="이메일(ID)">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="mem_pw"
							placeholder="비밀번호">
					</div>
					<div class="form-group row">
						<div class="col-md-6">
							<input type="submit" value="로그인" class="btn btn-primary py-3 px-5 w-100">
						</div>
						<div class="col-md-6">
							<a href="join" class="btn btn-secondary py-3 px-5 w-100">회원가입</a>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="row justify-content-center mt-5">
			<div class="col-md-6">
				<div class="row justify-content-center ftco-services">
					<div class="col-sm-4 text-center ftco-animate">
						<div class="media block-6 services mb-md-0 mb-4">
							<a href=""
								class="icon bg-color-1 active d-flex justify-content-center align-items-center mb-2">
								<span class="flaticon-shipped"></span>
							</a>
							<div class="media-body">
								<h3 class="heading">Kakao</h3>
							</div>
						</div>
					</div>
					<div class="col-sm-4 text-center ftco-animate">
						<div class="media block-6 services mb-md-0 mb-4">
							<a href=""
								class="icon bg-color-2 d-flex justify-content-center align-items-center mb-2">
								<span class="flaticon-diet"></span>
							</a>
							<div class="media-body">
								<h3 class="heading">Naver</h3>
							</div>
						</div>
					</div>
					<div class="col-sm-4 text-center ftco-animate">
						<div class="media block-6 services mb-md-0 mb-4">
							<a href=""
								class="icon bg-color-3 d-flex justify-content-center align-items-center mb-2">
								<span class="flaticon-award"></span>
							</a>
							<div class="media-body">
								<h3 class="heading">Google</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/common/client_ft.jsp"></jsp:include>
<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
	<svg class="circular" width="48px" height="48px">
		<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
			stroke-width="4" stroke="#eeeeee" />
		<circle class="path" cx="24" cy="24" r="22" fill="none"
			stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
</div>


<script src="${path}/resources/js/jquery.min.js"></script>
<script src="${path}/resources/js/jquery-migrate-3.0.1.min.js"></script>
<script src="${path}/resources/js/popper.min.js"></script>
<script src="${path}/resources/js/bootstrap.min.js"></script>
<script src="${path}/resources/js/jquery.easing.1.3.js"></script>
<script src="${path}/resources/js/jquery.waypoints.min.js"></script>
<script src="${path}/resources/js/jquery.stellar.min.js"></script>
<script src="${path}/resources/js/owl.carousel.min.js"></script>
<script src="${path}/resources/js/jquery.magnific-popup.min.js"></script>
<script src="${path}/resources/js/aos.js"></script>
<script src="${path}/resources/js/jquery.animateNumber.min.js"></script>
<script src="${path}/resources/js/bootstrap-datepicker.js"></script>
<script src="${path}/resources/js/scrollax.min.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="${path}/resources/js/google-map.js"></script>
<script src="${path}/resources/js/main.js"></script>

</body>
</html>