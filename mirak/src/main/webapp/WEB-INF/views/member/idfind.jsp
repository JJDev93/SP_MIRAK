<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/common/client_hd.jsp"></jsp:include>
<!-- 네아로 SDK -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2-nopolyfill.js" charset="utf-8"></script>

<style>

      .hr-sect {
        display: flex;
        flex-basis: 100%;
        align-items: center;
        color: rgba(0, 0, 0, 0.35);
        
        margin: 8px 0px;
      }
      .hr-sect::before,
      .hr-sect::after {
        content: "";
        flex-grow: 1;
        background: rgba(0, 0, 0, 0.35);
        height: 1px;
        font-size: 0px;
        line-height: 0px;
        margin: 0px 16px;
      }

</style>
<div class="hero-wrap hero-bread"
	style="background-image: url('${path}/resources/images/bg_1.jpg');">
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="/">Home</a></span> <span>idfind</span>
				</p>
				<h1 class="mb-0 bread">아이디 찾기</h1>
			</div>
		</div>
	</div>
</div>

<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-8 mb-5 text-center">
				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link active" href="idfind">아이디찾기</a></li>
					<li class="nav-item"><a class="nav-link" href="pwreset">비밀번호 재설정</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-5 ftco-animate">
				<form action="idfind" method="post" class="contact-form">
					<h3 class="mb-4 billing-heading" style="text-align: center;">아이디
						찾기</h3>
					<div class="form-group">
						<label for="ID">이름</label> <input type="text" class="form-control" id="ID"
							name="mem_name" placeholder="이름을 입력해주세요.." required="required">
					</div>

					<div class="form-group">
						<label for="PW">핸드폰번호</label> <input type="text" id="PW"
							class="form-control" name="mem_phone"
							placeholder="핸드폰번호를 입력해주세요.." required="required">
					</div>
					<div>
					
						<label style="color: red">${message }</label>
						<c:forEach items="${memberList}" var="member">
					<label style="color: #fb8622;">${member.mem_id}</label>
						</c:forEach>
					</div>
					<div class="form-group row">
						<div class="col-md-12 text-center">
							<input type="submit" value="아이디 찾기" onclick="fn_idfind();"
								class="btn btn-primary py-3 px-5 w-50">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-md-12" style="text-align: right;">
							<a href="pwreset">비밀번호를 잃어버렸습니다.......</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- Modal -->
	<form action="pwreset" method="get">
		<div class="modal fade" id="pwcheckform" tabindex="9999"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">아이디 확인</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label >아이디는 ${mem_id } 입니다.</label>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal" onclick="location.href='/login'">로그인으로 이동</button>
							<button type="submit" class="btn btn-primary">비밀번호 찾기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</section>
<script src="${path}/resources/js/naverapi.js"></script>
<jsp:include page="/common/client_ft.jsp"></jsp:include>

<script>
$(document).ready(function() {
	console.log("message : "+"${message}");
	console.log("mem_id : "+"${mem_id}");
	if("${message}" !=""){
		alert("${message}");
		<%session.setAttribute("message","");%>
	}
	if("${mem_id}" != ""){
		$("#pwcheckform").modal("show");
	}
});
</script>






