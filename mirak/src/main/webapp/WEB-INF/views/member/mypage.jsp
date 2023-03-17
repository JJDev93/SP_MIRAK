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
         <div class="col-md-10 ftco-animate">
            <div class="row mb-5">
               <ul class="nav nav-tabs w-100">
                  <li class="nav-item"><a class="nav-link active" href="/mypage">마이페이지</a></li>
                  <li class="nav-item"><a class="nav-link" href="/cart">장바구니</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">결제내역</a></li>
               </ul>
            </div>
            <form action="memupdate" method="post" class="contact-form"
               id="delForm">
               <h3 class="mb-4 billing-heading">회원정보 수정</h3>
               <div class="row align-items-end">
                  <div class="container">
                     <div class="row block-9">
                        <div class="col-md-12 order-md-last ">
                           <div class="form-group">
                              <label for="ID">아이디</label> <input type="text" name="mem_id"
                                 id="id" class="form-control" placeholder="이메일(ID)"
                                 required="required" value="${member.mem_id }" readonly>
                           </div>
                           <div class="form-group">
                              <label for="pw">비밀번호</label> <input type="password"
                                 name="mem_pw" class="form-control" id="pw"
                                 onchange="check_pw()" placeholder="수정할 비밀번호 입력"
                                 required="required">
                           </div>
                           <div class="form-group">
                              <label for="pw2">비밀번호 확인</label> <input type="password"
                                 class="form-control" id="pw2" onchange="check_pw()"
                                 placeholder="비밀번호 확인" required="required"> <span
                                 id="check"></span>
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
                                          <input type="radio"
                                    name="mem_gender" value="2">여
                                         </c:when>
                              <c:when test="${member.mem_gender == '2' }">
                                 <input type="radio" name="mem_gender" value="1">남
                                          &nbsp;&nbsp;&nbsp; 
                                          <input type="radio"
                                    name="mem_gender" value="2" checked>여
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
                  <div class="col-md-12">
                     <div class="form-group">
                        <label for="streetaddress">주소</label>
                        <div class="row mb-4">
                           <div class="col-sm-8">
                              <input type="text" class="form-control" id="address_input_1"
                                 name="mem_zipcode" placeholder="주소지를 입력해주세요"
                                 value="${member.mem_zipcode }" readonly="readonly">
                           </div>
                           <div class="col-sm-4">
                              <button type="button" class="form-control address button"
                                 onclick="execution_daum_address();">우편번호찾기</button>
                           </div>
                        </div>
                        <input type="text" class="form-control mb-4" readonly="readonly"
                           id="address_input_2" placeholder="주소작성" readonly="readonly"
                           value="${member.mem_add1 }" name="mem_add1"> <input
                           type="text" class="form-control" placeholder="상세주소작성"
                           id="address_input_3" value="${member.mem_add2 }"
                           readonly="readonly" name="mem_add2">
                     </div>
                  </div>

                  <div class="w-100"></div>
                  <div class="col-md-6 text-center">
                     <input type="submit" value="수정하기"
                        class="btn btn-primary py-3 px-5">
                  </div>
                  <div class="col-md-6 text-center">
                     <button type="button" id="submit"
                        class="btn btn-secondary py-3 px-5 l-100" data-toggle="modal"
                        data-target="#exampleModal">회원탈퇴</button>
                  </div>
               </div>
            </form>
         </div>
      </div>
   </div>

   <!-- Modal -->
   <form action="memdelete" , method="post">
      <div class="modal fade" id="exampleModal" tabindex="9999"
         aria-labelledby="exampleModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">탈퇴 하시겠습니까?</h5>
                  <button type="button" class="close" data-dismiss="modal"
                     aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                  </button>
               </div>
               <div class="modal-body">
                  회원탈퇴시 모든 정보가 삭제됩니다. 비밀번호를 입력해 주세요. <input type="password"
                     class="form-control" id="pw_1" required="required">
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-secondary"
                     data-dismiss="modal">Close</button>
                  <button type="button" class="btn btn-primary" id="memberCheck"
                     onclick="fn_memberCheck();">탈퇴하기</button>
               </div>
            </div>
         </div>
      </div>
   </form>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-10 ftco-animate">
				<div class="row mb-5">
					<ul class="nav nav-tabs w-100">
						<li class="nav-item"><a class="nav-link active" href="/mypage">마이페이지</a></li>
						<li class="nav-item"><a class="nav-link" href="/cart">장바구니</a></li>
						<li class="nav-item"><a class="nav-link" href="/payInfo">결제내역</a></li>
					</ul>
				</div>
				<form action="memupdate" method="post" class="contact-form"
					id="delForm">
					<h3 class="mb-4 billing-heading">회원정보 수정</h3>
					<div class="row align-items-end">
						<div class="container">
							<div class="row block-9">
								<div class="col-md-12 order-md-last ">
									<div class="form-group">
										<label for="ID">아이디</label> <input type="text" name="mem_id"
											id="id" class="form-control" placeholder="이메일(ID)"
											required="required" value="${member.mem_id }" readonly>
									</div>
									<div class="form-group">
										<label for="pw">비밀번호</label> <input type="password"
											name="mem_pw" class="form-control" id="pw"
											onchange="check_pw()" placeholder="수정할 비밀번호 입력"
											required="required">
									</div>
									<div class="form-group">
										<label for="pw2">비밀번호 확인</label> <input type="password"
											class="form-control" id="pw2" onchange="check_pw()"
											placeholder="비밀번호 확인" required="required"> <span
											id="check"></span>
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
                                          <input type="radio"
												name="mem_gender" value="2">여
                                      	</c:when>
										<c:when test="${member.mem_gender == '2' }">
											<input type="radio" name="mem_gender" value="1">남
                                          &nbsp;&nbsp;&nbsp; 
                                          <input type="radio"
												name="mem_gender" value="2" checked>여
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
						<div class="col-md-12">
							<div class="form-group">
								<label for="streetaddress">주소</label>
								<div class="row mb-4">
									<div class="col-sm-8">
										<input type="text" class="form-control" id="address_input_1"
											name="mem_zipcode" placeholder="주소지를 입력해주세요"
											value="${member.mem_zipcode }" readonly="readonly">
									</div>
									<div class="col-sm-4">
										<button type="button" class="form-control address button"
											onclick="execution_daum_address();">우편번호찾기</button>
									</div>
								</div>
								<input type="text" class="form-control mb-4" readonly="readonly"
									id="address_input_2" placeholder="주소작성" readonly="readonly"
									value="${member.mem_add1 }" name="mem_add1"> <input
									type="text" class="form-control" placeholder="상세주소작성"
									id="address_input_3" value="${member.mem_add2 }"
									readonly="readonly" name="mem_add2">
							</div>
						</div>

						<div class="w-100"></div>
						<div class="col-md-6 text-center">
							<input type="submit" value="수정하기"
								class="btn btn-primary py-3 px-5">
						</div>
						<div class="col-md-6 text-center">
							<button type="button" id="submit"
								class="btn btn-secondary py-3 px-5 l-100" data-toggle="modal"
								data-target="#exampleModal">회원탈퇴</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<form action="memdelete" , method="post">
		<div class="modal fade" id="exampleModal" tabindex="9999"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">탈퇴 하시겠습니까?</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						회원탈퇴시 모든 정보가 삭제됩니다. 비밀번호를 입력해 주세요. <input type="password"
							class="form-control" id="pw_1" required="required">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary" id="memberCheck"
							onclick="fn_memberCheck();">탈퇴하기</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</section>

<jsp:include page="/common/client_ft.jsp"></jsp:include>
<script>
   function fn_memberCheck() {
      if (pw_1.value == "") {
         alert("비밀번호를 입력해주세요");
      } else {
         $.ajax({
            url : "/memdelete",
            type : "POST",
            dataType : "JSON",
            data : {
               "mem_id" : $("#id").val(),
               "mem_pw" : $("#pw_1").val()
            },
            success : function(data) {
               if (data == "0") {
                  alert("비밀번호가 틀렸습니다.");
                  document.getElementById('pw_1').value = '';
               } else if(data == "1"){
                  alert("회원탈퇴 되었습니다.");
                  location.href="logout";
               }
            }
         });
      }
   }
</script>
</body>
</html>