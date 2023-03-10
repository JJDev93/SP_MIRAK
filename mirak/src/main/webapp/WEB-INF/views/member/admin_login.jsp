<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MiRak Admin</title>
<link rel="icon" href="${path}/resources/images/favicon.gif">
<link rel="stylesheet" href="${path}/resources/css/style.css">
</head>
<style>
html, body {
	height: 100%;
}

body {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-align: center;
	align-items: center;
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #f5f5f5;
}

.form-signin {
	width: 100%;
	max-width: 450px;
	padding: 15px;
	margin: auto;
}

.form-signin .checkbox {
	font-weight: 400;
}

.form-signin .form-control {
	position: relative;
	box-sizing: border-box;
	height: auto;
	padding: 10px;
	font-size: 16px;
}

.form-signin .form-control:focus {
	z-index: 2;
}

.form-signin input[type="email"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}
</style>
<body class="text-center">
	<form class="form-signin" action="/admin" method="post">
		<img class="mb-4" src="${path}/resources/images/favicon.gif" alt="" width="72" height="72">
		<h1 class="h3 mb-3 font-weight-normal">Login</h1>
		
		<label for="ID" class="sr-only">어드민 아이디를 입력하세요</label> 
		<input type="text" id="ID" name="mem_id" class="form-control mb-3" placeholder="아이디를 입력하세요" required autofocus> 
		
		<label for="PW" class="sr-only">어드민 비밀번호를 입력하세요</label> 
		<input type="password" id="PW" name="mem_pw" class="form-control" placeholder="비밀번호를 입력하세요" required>
		
		<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
		
		<p class="mt-5 mb-3 text-muted">
			&copy Copyright by MiRak <br> 신용우, 김연주, 김원중, 서현진, 안창주, 정동하, 전지혜
		</p>
	</form>
	<script src="${path}/resources/js/bootstrap.min.js"></script>
</body>
</html>