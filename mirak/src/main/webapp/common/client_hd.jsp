<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="cate" value="${fn:substringAfter(pageContext.request.requestURI, '/views/')}"/>
<c:set var="cateAll" value="${fn:substringBefore(cate, '.jsp')}"/>
<c:set var="member" value="${member}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MiRak</title>
	<meta name="viewport" content="width=device-width,initial-scale=1">
	
	<link rel="apple-touch-icon" href="${path}/resources/images/favicon.png">
	<link rel="shortcut icon" type="image/x-icon" href="${path}/resources/images/favicon.png">
	
	<meta name="keywords" content="도시락,배달,쇼핑몰,구독">
	<meta name="description" content="MIRAK 도시락 배달 서비스">
	<link rel="canonical" href="https://www.mirak.shop">
	<meta property="og:title" content="MIRAK">
	<meta property="og:type" content="website">
	<meta property="og:description" content="MIRAK 도시락 배달 서비스">
	<meta property="og:image" content="${path}/resources/images/ogimg01.png">
	<meta property="og:url" content="https://www.mirak.shop">
	
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
	<header class="client-hd">
		<!-- START nav -->
		<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar ftco-navbar-light scrolled awake" id="ftco-navbar">
			<div class="container">
				<h1 class="h1-css"><a class="navbar-brand" href="/" style="left:-20px;">MiRak</a></h1>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
					<span class="oi oi-menu"></span> Menu
				</button>
				<div class="collapse navbar-collapse" id="ftco-nav">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item <c:if test="${fn : contains(cateAll, '/product/ProductClientList') && fn : contains('/product/ProductClientList', cateAll)}">active</c:if>"><a href="/ProductClientList" class="nav-link">전체메뉴</a></li>
						<li class="nav-item <c:if test="${fn : contains(cate, 'ProductClientListP')}">active</c:if>"><a href="/ProductClientListP" class="nav-link">스페셜세트</a></li>
						<li class="nav-item <c:if test="${fn : contains(cate, 'ProductClientListT')}">active</c:if>"><a href="/ProductClientListT" class="nav-link">2·3인세트</a></li>
						<li class="nav-item <c:if test="${fn : contains(cate, 'ProductClientListO')}">active</c:if>" ><a href="/ProductClientListO" class="nav-link">1인세트</a></li>
						<% if (session.getAttribute("mem_id") == null) {%>
							<li class="nav-item <c:if test="${fn : contains(cate, 'login')}">active</c:if>"><a href="/login" class="nav-link">로그인</a></li>
							<li class="nav-item <c:if test="${fn : contains(cate, 'join')}">active</c:if>"><a href="/join" class="nav-link">회원가입</a></li>
						<%} else if (session.getAttribute("mem_id").equals("admin")) {%>
							<li class="nav-item"><a href="/admin/logout" class="nav-link">로그아웃</a></li>
							<li class="nav-item"><a href="/admin/charts" class="nav-link">Admin</a></li>
						<%} else {
							if (session.getAttribute("mem_isapi") == null || !session.getAttribute("mem_isapi").equals("NAVER")) {%>
								<li class="nav-item"><a href="/logout" class="nav-link">로그아웃</a></li>
							<%} else if (session.getAttribute("mem_isapi").equals("NAVER")) { %>
								<li class="nav-item" onclick="naverLogout(); return false;"><a href="javascript:;" class="nav-link"><span>로그아웃</span></a></li>
							<%} %>
							<li class="nav-item <c:if test="${fn : contains(cate, 'mypage')}">active</c:if>"><a href="/mypage" class="nav-link">마이페이지</a></li>
						<%} %>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<!-- END nav -->
</body>
<script>
var testPopUp;
function openPopUp() {
   testPopUp = window.open("https://nid.naver.com/nidlogin.logout","_blank","toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
}
function closePopUp() {
   testPopUp.close();
}
function naverLogout() {
   openPopUp();
   setTimeout(function() {
      closePopUp();
   }, 100);
   location.href="/logout";
}
</script>
</html>