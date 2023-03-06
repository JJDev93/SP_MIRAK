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
</head>
<body class="goto-here">
	<header>
		<!-- START nav -->
		<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
			<div class="container">
				<h1><a class="navbar-brand" href="index.jsp">MiRak</a></h1>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
					<span class="oi oi-menu"></span> Menu
				</button>
				<div class="collapse navbar-collapse" id="ftco-nav">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item active"><a href="" class="nav-link">프리미엄</a></li>
						<li class="nav-item"><a href="about.html" class="nav-link">2,3인세트</a></li>
						<li class="nav-item"><a href="blog.html" class="nav-link">1인세트</a></li>
						<li class="nav-item"><a href="contact.html" class="nav-link">가입</a></li>
						<li class="nav-item"><a href="login" class="nav-link">로그인</a></li>
						<li class="nav-item"><a href="cart.html" class="nav-link">장바구니</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<!-- END nav -->
</body>
</html>