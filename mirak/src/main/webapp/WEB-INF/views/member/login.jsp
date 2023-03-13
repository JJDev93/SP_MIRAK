<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/common/client_hd.jsp"></jsp:include>
<!-- 네아로 SDK -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2-nopolyfill.js" charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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
					<span class="mr-2"><a href="index.html">Home</a></span> <span>Login</span>
				</p>
				<h1 class="mb-0 bread">로그인</h1>
			</div>
		</div>
	</div>
</div>

<section class="ftco-section">
	<div class="container">
	
		<div class="row justify-content-center">
			<div class="col-md-5 ftco-animate">
				<form action="login" method="post" class="contact-form">
					
					<div class="form-group">
					<label for="ID">아이디</label>
						<input type="text" class="form-control" id="ID" name="mem_id" placeholder="이메일(ID)" required="required">
					</div>
					
					<div class="form-group">
					<label for="PW">비밀번호</label>
						<input type="password" id="PW" class="form-control" name="mem_pw" placeholder="비밀번호" required="required">
					</div>
					<div>
						<label style="color:red">${message }</label>
					</div>
					<div class="form-group row">
						<div class="col-md-6">
							<input type="submit" value="로그인" class="btn btn-primary py-3 px-5 w-100">
						</div>
						
						<div class="col-md-6">
							<a href="join" class="btn btn-secondary py-3 px-5 w-100">회원가입</a>
						</div>
					</div>
				</form>
			</div>
		</div>
		
		 <div class="hr-sect">or</div>
		
		<div class="row justify-content-center mt-5">
			<div class="col-md-6">
				<div class="row justify-content-center ftco-services">
					<div class="col-sm-4 text-center ftco-animate">
						<div class="media block-6 services mb-md-0 mb-4">
							<a href="" > 
								<img alt="" src="https://developers.kakao.com/docs/static/image/ko/m/kakaologin.png" style="height: 200px;" >
								<span class="flaticon-shipped"></span>
							</a>
							<div class="media-body">
								<h3 class="heading"></h3>
							</div>
						</div>
					</div>
<!-- 					네이버로그인 -->
					<div class="col-sm-4 text-center ftco-animate" id="naverIdLogin"></div>
					
					<div class="col-sm-4 text-center ftco-animate">
						<div class="media block-6 services mb-md-0 mb-4">
							<a href="" >
								<img alt="" src="https://developers.kakao.com/docs/static/image/ko/m/kakaologin.png" style="height: 200px;">
								<span class="flaticon-award"></span>
							</a>
							<div class="media-body">
								<h3 class="heading"></h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/common/client_ft.jsp"></jsp:include>
<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "zkOzac5hPC_Qw6v8eOzQ",
			callbackUrl: "http://localhost:8080/login",
			isPopup: false,
			loginButton: {color: "green", type: 1, height: 60}
// 			callbackHandle: true
		}
	);
	naverLogin.init();

	window.addEventListener('load', function () {
		naverLogin.getLoginStatus(function (status) {
			if (status) {
			    var mem_id = naverLogin.user.getEmail();
			    if(naverLogin.user.getGender() == 'F'){
			        var mem_gender = 2
			    } else {
			        var mem_gender = 1
			    }
			    var mem_pw = naverLogin.user.getId();
			    var mem_name = naverLogin.user.getName();
			    
			    console.log(naverLogin.user);
			    $.ajax({
			        type: 'post',
			        url: 'naverSave',
			        data: {'mem_id':mem_id, 'mem_gender':mem_gender, 'mem_pw':mem_pw, 'mem_name':mem_name},
					success: function(result) {
						if(result=='loginsuccess') {
							alert("로그인 성공하였습니다.");
							console.log('성공 : ' + result);
							location.href="/";
						} else if(result=='no') {
							console.log('실패')
						}
					},
					error: function(result) {
						console.log('오류 발생')
					}
				})

			} else {
				console.log("callback 처리에 실패하였습니다.");
			}
			});
		});
	function naverLogout() {
		openPopUp();
		setTimeout(function() {
			closePopUp();
			}, 1000);
		
		
	}
</script>