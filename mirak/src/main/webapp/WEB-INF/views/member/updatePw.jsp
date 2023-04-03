<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/common/client_hd.jsp"></jsp:include>
<div class="hero-wrap hero-bread" style="background-image: url('${path}/resources/images/bg_1.jpg');">
	<div class="ftco-animate">
		<h1 class="bread">마이페이지</h1>
	</div>
</div>
<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-10 ftco-animate">
				<div class="row mb-5">
					<ul class="nav nav-tabs w-100">
						<li class="nav-item"><a class="nav-link active" href="/mypage">비밀번호 변경</a></li>
						<li class="nav-item"><a class="nav-link" href="/cart">장바구니</a></li>
						<li class="nav-item"><a class="nav-link" href="/payInfo">결제내역</a></li>
					</ul>
				</div>

				<form class="contact-form billing-form">
					<h3 class="mb-4 billing-heading text-center" id="exampleModalLabel">비밀번호변경</h3>
					<div class="row justify-content-center">
					<input type="hidden" name="mem_id" id="mem_id" value="${member.mem_id }" readonly>
					<input type="hidden" name="mem_pw" id="mem_pw" value="${member.mem_pw }" readonly>
						<div class="col-sm-9">
							<label for="befo_pw">기존 비밀번호</label>
							<input type="password" name="befo_pw" id="befo_pw" class="form-control"
								placeholder="기존 비밀번호를 입력해주세요">
						</div>
						<div class="col-sm-9">
							<label for="new_pw">변경 할 비밀번호</label>
							<input type="password" name="new_pw" id="new_pw" class="form-control"
								placeholder="새로운 비밀번호를 입력해주세요">
						</div>
						<div class="col-sm-9">
							<label for="new_pw_chk">변경 할 비밀번호 확인</label>
							<input type="password" name="new_pw_chk" id="new_pw_chk"
								class="form-control" placeholder="새로운 비밀번호를 입력해주세요">
						</div>
						<div class="w-100 mt-1"></div>
						<div class="col-md-6 text-center">
							<input type="button" onclick="confirmUpdatePw()" class="btn btn-primary py-3 px-5 w-100" value="수정하기">
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>
</section>

<jsp:include page="/common/client_ft.jsp"></jsp:include>
<script>
	$(document).ready(function() {
		console.log("message : "+"${message}");
		console.log("mem_id : "+"${mem_id}");
		console.log("mem_isapi : "+"${mem_isapi}");
		if("${message}" !=""){
			alert("${message}");
			 <%session.setAttribute("message","");%>
		}
	})
</script>
<script> 
	function confirmUpdatePw() {
		if (befo_pw.value == "") {
			alert("비밀번호를 입력해주세요.");
			return false;
			
		}else if (new_pw.value == "") {
			alert("새로운 비밀번호를 입력해주세요.");
			return false;
			
		}else if (new_pw_chk.value == "") {
			alert("비밀번호 확인을 입력해주세요.");
		return false;
		
		}else if(confirm("비밀번호를 수정하시겠습니까?")) {
			$.ajax({
				url : "/updatePw",
				type : "POST",
				dataType : "JSON",
				data : {
					"mem_id" : $("#mem_id").val(),
					"mem_pw" : $("#mem_pw").val(),
					"befo_pw" : $("#befo_pw").val(),
					"new_pw" : $("#new_pw").val()
				},
				success : function(data) {
					if (data == "0") {
						alert("기존 비밀번호가 틀렸습니다.");
						document.getElementById('befo_pw').value = '';
						document.getElementById('befo_pw').focus();
					} else if (data == "1") {
						alert("비밀번호가 수정 되었습니다.");
					}
				}
			});
			return true;
		} else {
			return false;
		}
	}
</script>