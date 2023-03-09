<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/common/client_hd.jsp"></jsp:include>
<head>
<script>
	function idPost() {
		let hiddenForm = document.createElement('form');
		hiddenForm.setAttribute('method', 'post');
		hiddenForm.setAttribute('action', 'cartList');
		document.body.appendChild(hiddenForm);
		hiddenForm.submit();
	}
</script>
</head>
<body>
	<div class="hero-wrap hero-bread"
		style="background-image: url('${path}/resources/images/bg_1.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="#">My Page</a></span> <span></span>
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
						<li class="nav-item"><a class="nav-link active" href="mypage">마이페이지</a></li>
						<li class="nav-item"><a class="nav-link"
							href="javascript:idPost()">장바구니</a></li>
						<li class="nav-item"><a class="nav-link" href="#">결제내역</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-7 ftco-animate">
					<form action="memupdate" method="post" class="contact-form">
						<h3 class="mb-4 billing-heading">회원정보 수정</h3>
						<div class="row align-items-end">
							<div class="container">
								<div class="row block-9">
									<div class="col-md-12 order-md-last">
										<div class="form-group">
											<label for="ID">아이디</label> <input type="text" name="mem_id"
												class="form-control" placeholder="이메일(ID)"
												required="required" value="${member.mem_id }" readonly>
										</div>

										<div class="form-group">
											<label for="pw">비밀번호</label> <input type="password"
												name="mem_pw" class="form-control" id="pw"
												onchange="check_pw()" placeholder="비밀번호" required="required"
												value="123456789">
										</div>

										<div class="form-group">
											<label for="pw2">비밀번호 확인</label> <input type="password"
												class="form-control" id="pw2" onchange="check_pw()"
												placeholder="비밀번호 확인" required="required" value="123456789">
											<span id="check"></span>
										</div>
									</div>
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group">
									<label for="firstname">이름</label> <input type="text"
										name="mem_name" class="form-control" placeholder="이름을 입력해주세요"
										required="required" value="${member.mem_name }">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="age">나이</label> <input type="text" name="mem_age"
										id="age" class="form-control" placeholder="나이를 입력해주세요"
										required="required" value="${member.mem_age }">
								</div>
							</div>

							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="gender">성별</label>
									<div>
										<c:choose>
											<c:when test="${member.mem_gender == '1'}">
												<input type="radio" name="mem_gender" value="1" checked>남
                             				 &nbsp;&nbsp;&nbsp; 
                              				<input type="radio" name="mem_gender"
													value="0">여
                              			</c:when>
											<c:when test="${member.mem_gender == '0' }">
												<input type="radio" name="mem_gender" value="1">남
                              				&nbsp;&nbsp;&nbsp; 
                             				 <input type="radio" name="mem_gender"
													value="0" checked>여
										</c:when>
										</c:choose>

									</div>
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="phone">Phone</label> <input type="text"
										name="mem_phone" class="form-control"
										placeholder=" ' - ' 빼고 입력해주세요 " required="required"
										value="${member.mem_phone }">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="address">주소</label> <input type="text" name="mem_address"
										id="address" class="form-control" placeholder="나이를 입력해주세요"
										required="required" value="${member.mem_address }">
								</div>
							</div>

							<div class="w-100"></div>
							<div class="col-md-6 text-center">
								<input type="submit" value="수정하기" class="btn btn-primary py-3 px-5">
							</div>
							<div class="col-md-6 text-center">
								<button type="button" id="" class="btn btn-secondary py-3 px-5 l-100" data-toggle="modal" data-target="#exampleModal">회원탈퇴</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

						<!-- Modal -->
						<div class="modal fade" id="exampleModal" tabindex="9999"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">탈퇴 하시겠습니까?</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">비밀번호를 입력해 주세요.
										<input type="password" name="mem_pw" class="form-control" id="pw" onchange="check_pw()" required="required">
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
										<button type="button" class="btn btn-primary" onclick="location.href='memdelete?mem_id=${member.mem_id }&mem_pw=mem_pw'">탈퇴하기</button>
									</div>
								</div>
							</div>
						</div>
	</section>

	<jsp:include page="/common/client_ft.jsp"></jsp:include>
	<script>
   $('#exampleModal').on('shown.bs.modal', function () {
     $('#myInput').trigger('focus')
   })
</script>
</body>
</html>