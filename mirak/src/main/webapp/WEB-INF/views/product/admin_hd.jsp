<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MiRak Admin</title>
	<link rel="stylesheet" href="${path}/resources/css/style.css">
</head>
<body>
	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
		<div class="container ">
		  <a class="navbar-brand" href="#">MiRakr</a>
		  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		  <div class="collapse navbar-collapse" id="navbarCollapse">
		    <ul class="navbar-nav me-auto mb-2 mb-md-0">
		      <li class="nav-item">
		        <a class="nav-link active" aria-current="page" href="#"> 회원관리</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="ProductAdminList">상품관리</a>
		      </li>
		      
		      <li class="nav-item">
		        <a class="nav-link" href="#">장바구니</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="#">결재관리</a>
		      </li>
		    </ul>
		  </div>
		</div>
	</nav>
</body>
</html>