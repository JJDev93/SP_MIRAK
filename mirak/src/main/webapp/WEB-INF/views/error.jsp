<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/common/client_hd.jsp"></jsp:include>
<div class="hero-wrap hero-bread" style="background-image: url('${path}/resources/images/bg_1.jpg');">
	<div class="ftco-animate">
		<h1 class="bread">오류가 발생하였습니다.</h1>
	</div>
</div>
<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-12 text-center">
			<h2>${code }</h2>
		</div>
		<div class="col-md-12 text-center" style="margin-bottom: 50px;">
			<h3>오류내용 : ${message }</h3>
		</div>
	</div>
</div>

<jsp:include page="/common/client_ft.jsp"></jsp:include>