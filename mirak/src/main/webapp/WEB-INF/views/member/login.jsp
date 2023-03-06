<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>로그인</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${path}/resources/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${path}/resources/css/animate.css"> 
    <link rel="stylesheet" href="${path}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${path}/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${path}/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="${path}/resources/css/aos.css">
    <link rel="stylesheet" href="${path}/resources/css/ionicons.min.css">
    <link rel="stylesheet" href="${path}/resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${path}/resources/css/jquery.timepicker.css">
    <link rel="stylesheet" href="${path}/resources/css/flaticon.css">
    <link rel="stylesheet" href="${path}/resources/css/icomoon.css">
    <link rel="stylesheet" href="${path}/resources/css/style.css">
  </head>
 <body class="goto-here">
	<!-- START nav -->
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container">
			<h1><a class="navbar-brand" href="index.jsp">MiRak</a></h1>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>
			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="client_signup.jsp" class="nav-link">회원가입</a></li>
				</ul>
			</div>
		</div>
	</nav>
    <!-- END nav -->

    <div class="hero-wrap hero-bread" style="background-image: url(${path}/resources/images/bg_3.jpg);">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-1 bread">로그인</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section contact-section">
    
      <div class="container">
        <div class="row block-9">
          <div class="col-md-6 order-md-last d-flex" >
            <form action="#" class="bg-white p-5 contact-form">
              <div class="form-group">
                <input type="text" class="form-control" placeholder="이메일(ID)">
              </div>
              <div class="form-group"> 
                <input type="text" class="form-control" placeholder="비밀번호">
              </div>
              <div class="form-group">
                <input type="submit" value="로그인" class="btn btn-primary py-3 px-5">
              </div>
            </form>
          
          </div>
        </div>
      </div>
      
      <div class="container">
			<div class="row no-gutters ftco-services">
				<div
					class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services mb-md-0 mb-4">
						<div
							class="icon bg-color-1 active d-flex justify-content-center align-items-center mb-2">
							<span class="flaticon-shipped"></span>
						</div>
						<div class="media-body">
							<h3 class="heading">Kakao</h3>
						</div>
					</div>
				</div>
				<div
					class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services mb-md-0 mb-4">
						<div
							class="icon bg-color-2 d-flex justify-content-center align-items-center mb-2">
							<span class="flaticon-diet"></span>
						</div>
						<div class="media-body">
							<h3 class="heading">Naver</h3>
						</div>
					</div>
				</div>
				<div
					class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services mb-md-0 mb-4">
						<div
							class="icon bg-color-3 d-flex justify-content-center align-items-center mb-2">
							<span class="flaticon-award"></span>
						</div>
						<div class="media-body">
							<h3 class="heading">Google</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
		
    </section>

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${path}/resources/js/google-map.js"></script>
  <script src="${path}/resources/js/main.js"></script>
    
  </body>
</html>