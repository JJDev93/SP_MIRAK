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
					<span class="mr-2"><a href="index.html">My Page</a></span> <span></span>
				</p>
				<h1 class="mb-0 bread">마이 페이지</h1>
			</div>
		</div>
	</div>
</div>

<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-10 mb-5 text-center">
					<ul class="nav nav-tabs">
						<li class="nav-item"><a class="nav-link active" href="#">마이페이지</a></li>
						<li class="nav-item"><a class="nav-link" href="#">장바구니</a></li>
						<li class="nav-item"><a class="nav-link" href="#">결제내역</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="container">
		<div class="row justify-content-center">
			<div class="col-xl-7 ftco-animate">
				<form action="#" method="post" class="billing-form">
					<h3 class="mb-4 billing-heading">회원정보 수정</h3>
					<div class="row align-items-end">
						<div class="container">
							<div class="row block-9">
								<div class="col-md-12 order-md-last ">
									<div class="form-group">
										<label for="ID">아이디</label> <input type="text" name="mem_id"
										value="${member.mem_id }"
											class="form-control" >
									</div>
									<div class="form-group">
										<label for="PW">비밀번호</label> <input type="text" name="mem_pw"
										value="${member.mem_pw }"
											class="form-control" >
									</div>
									<div class="form-group">
										<label for="PW">비밀번호 확인</label> <input type="text"
											class="form-control" placeholder="비밀번호 확인">
									</div>
								</div>
							</div>
						</div>
						<div class="w-100"></div>
						<div class="col-md-12">
							<div class="form-group">
								<label for="firstname">이름</label> <input type="text"
									name="mem_name" value="${member.mem_name }" class="form-control" >
							</div>
						</div>
						<div class="w-100"></div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="age">나이</label> <input type="text" name="mem_age" id="age" value="${member.mem_age }"class="form-control" >
							</div>
						</div>

						<div class="w-100"></div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="gender">성별</label>
								<div>
									<c:choose>
										<c:when test="${member.mem_gender == '1'}">
											<input type="radio" name="gender" value="man" name="mem_gender" checked>남
                             				 &nbsp;&nbsp;&nbsp; 
                              				<input type="radio" name="gender" value="woman" name="mem_gender">여
                              			</c:when>
										<c:when test="${member.mem_gender == '0' }">
											<input type="radio" name="gender" value="man" name="mem_gender" >남
                             				 &nbsp;&nbsp;&nbsp; 
                              				<input type="radio" name="gender" value="woman" name="mem_gender" checked>여
										</c:when>
									</c:choose>

								</div>
							</div>
						</div>
						<div class="w-100"></div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="phone">Phone</label> <input type="tel"
									name="mem_phone" class="form-control" maxlength="11"
									pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}"
									value="${member.mem_phone }"
									>
							</div>
						</div>
						<div class="w-100"></div>
							<div class="col-md-6 text-center">
								<input type="submit" value="수정하기" class="btn btn-primary py-3 px-5">
							</div>
							<div class="col-md-6 text-center">
								<a href="#" class="btn btn-secondary py-3 px-5 l-100" >회원탈퇴</a>
							</div>
						</div>
					</form>
			</div>
		</div>
	</div>
</section>

<jsp:include page="/common/client_ft.jsp"></jsp:include>
</body>
</html>