<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MiRak</title>
	
	<link rel="icon" href="${path}/resources/images/favicon.gif">	
	<link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="${path}/resources/css/open-iconic-bootstrap.min.css">
	<link rel="stylesheet" href="${path}/resources/css/animate.css">
	<link rel="stylesheet" href="${path}/resources/css/owl.carousel.min.css">
	<link rel="stylesheet" href="${path}/resources/css/owl.theme.default.min.css">
	<link rel="stylesheet" href="${path}/resources/css/magnific-popup.css">
	<link rel="stylesheet" href="${path}/resources/css/aos.css">
	<link rel="stylesheet" href="${path}/resources/css/ionicons.min.css">
	<link rel="stylesheet" href="${path}/resources/css/bootstrap-datepicker.css">
	<link rel="stylesheet" href="${path}/resources/css/style.css">
	<link rel="stylesheet" href="${path}/resources/css/emailCheck.css">
</head>
<body class="goto-here">
	<header>
		<!-- START nav -->
		<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
			<div class="container">
				<h1><a class="navbar-brand" href="/">MiRak</a></h1>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
					<span class="oi oi-menu"></span> Menu
				</button>
				<div class="collapse navbar-collapse" id="ftco-nav">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item active"><a href="/ProductClientList" class="nav-link">전체메뉴</a></li>
						<li class="nav-item"><a href="/ProductClientListP" class="nav-link">프리미엄</a></li>
						<li class="nav-item"><a href="/ProductClientListT" class="nav-link">2·3인세트</a></li>
						<li class="nav-item"><a href="/ProductClientListO" class="nav-link">1인세트</a></li>

						<%if (session.getAttribute("mem_id") == null) {%>
							<li class="nav-item"><a href="/login" class="nav-link">로그인</a></li>
							<li class="nav-item"><a href="/join" class="nav-link">회원가입</a></li>
						<%} else if (session.getAttribute("mem_id").equals("admin")) {%>
							<li class="nav-item"><a href="/logout" class="nav-link">로그아웃</a></li>
							<li class="nav-item"><a href="/admin/charts" class="nav-link">Admin</a></li>
						<%} else {%>
						<li class="nav-item"><a href="/logout" class="nav-link">로그아웃</a></li>
						<li class="nav-item"><a href="/mypage" class="nav-link">마이페이지</a></li>
						<%}%>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<!-- END nav -->
	
</body>
</html>
