<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MiRak Admin</title>
	<meta name="viewport" content="width=device-width,initial-scale=1">
	
	<link rel="icon" href="${path}/resources/images/favicon.png">
	<link rel="stylesheet" href="${path}/resources/css/style.css">
	<link rel="stylesheet" href="${path}/resources/css/ionicons.min.css">
	<link rel="stylesheet" href="${path}/resources/css/admin.css">
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark bg-dark">
			<div class="container ">

			  <a class="navbar-brand" href="/admin/charts">MiRak</a>

			  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			  </button>
			  
			  <div class="collapse navbar-collapse" id="ftco-nav">
			    <ul class="navbar-nav ml-auto">
			      <li class="nav-item"><a class="nav-link" aria-current="page" href="/admin/members/1">회원관리</a></li>
			      <li class="nav-item">
			        <a class="nav-link" href="/admin/products/1">상품관리</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="/admin/carts/1">장바구니</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="/admin/pays/1">결제관리</a>
			      </li>
			      <li class="nav-item"><a class="nav-link" href="/">Client</a></li>
			      <li class="nav-item"><a class="nav-link" href="/admin/logout">로그아웃</a></li>
			    </ul>
			  </div>
			</div>
		</nav>
	</header>
</body>
</html>