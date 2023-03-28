<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/common/client_hd.jsp"></jsp:include>
<style>
.hr-sect {
   display: flex;
   flex-basis: 100%;
   align-items: center;
   color: rgba(0, 0, 0, 0.35);
   margin: 8px 0px;
}

.hr-sect::before, .hr-sect::after {
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
            <h1 class="mb-0 bread">로그인</h1>
         </div>
      </div>
   </div>
</div>
<section class="ftco-section">
   <div class="container">
      <div class="row justify-content-center">
         <div class="col-md-5 ftco-animate">
            <form action="login" method="post" class="contact-form" id="login">
               <div class="form-group">
                  <label for="ID">아이디</label> 
                  <input type="text" class="form-control" id="ID" name="mem_id" placeholder="이메일(ID)" required="required">
               </div>
               <div class="form-group">
                  <label for="PW">비밀번호</label> 
                  <input type="password" id="PW" class="form-control" name="mem_pw" placeholder="비밀번호" required="required">
               </div>
               <div>
                    <c:if test="${message } != '로그인후 이용해주세요'">
                        <label style="color: red">${message }</label>
                     </c:if>
               </div>
               <div class="form-group row">
                  <div class="col-md-12">
                     <input type="submit" value="로그인" class="btn btn-primary py-3 px-5 w-100">
                  </div>
               </div>
               <div class="form-group row" style="text-align: right;">
                  <div class="col-md-12 text-center">
                     <a href="join">회원가입</a>&nbsp;|&nbsp; <a href="idfind">아이디 찾기</a>&nbsp;|&nbsp;
                     <a href="pwreset">비밀번호재설정</a>
                  </div>
               </div>
            </form>
         </div>
      </div>

      <div class="hr-sect">or</div>

      <div class="row justify-content-center" style="margin: 2rem; margin-bottom: 50px;">

         <div class="col-md-6">
            <div class="row justify-content-center ftco-services"> 

               <!-- 구글 -->
               <div class="col-sm-4 text-center ftco-animate">
                  <a id="custom-login-btn" href="${googleUrl}"><img alt=""
                     src="resources/images/ico_member_google.png"></a>
               </div>


               <!-- 네이버 -->
               <div class="col-sm-4 text-center ftco-animate">
                  <a id="naverIdLogin_loginButton" href="javascript:void(0)"> <span><img
                        alt="" src="resources/images/ico_member_naver.png"
                        style="cursor: pointer"></span>
                  </a>
               </div>

               <!-- 카카오 -->
               <div class="col-sm-4 text-center ftco-animate">
                  <div class="media block-6 services mb-md-0 mb-4 kakao">
                     <a id="btn"
                        href="https://kauth.kakao.com/oauth/authorize?client_id=e481c91b1136f51f927a619fc062146d&redirect_uri=http://localhost:8080/kakaoLogin&response_type=code">
                        <img alt="" src="resources/images/ico_member_kakao.png">
                     </a>
                  </div>
               </div>

            </div>
         </div>
      </div>
   </div>
<!-- <ul> -->

<!--    <li onclick="naverLogout(); return false;"> -->
<!--       <a href="javascript:void(0)"> -->
<!--           <span>네이버 로그아웃</span> -->
<!--       </a> -->
<!--    </li> -->
<!-- </ul> -->

<form id="naverJoin" action="/naverjoin" method="post">
<input type="hidden" name="mem_id" value="" id="mem_id">
<input type="hidden" name="mem_gender" value="" id="mem_gender">
<input type="hidden" name="mem_pw" value="" id="mem_pw">
<input type="hidden" name="mem_name" value="" id="mem_name">
</form>

</section>
<jsp:include page="/common/client_ft.jsp"></jsp:include>

<script>
   $(document).ready(function() {
   console.log("message : "+"${message}");
   console.log("mem_id : "+"${mem_id}");
   if ("${message}" != "") {
        if ("${message}" == "로그인 후 이용해주세요.") {
          alert("${message}");
        }
        <% session.setAttribute("message", ""); %>
      }
      
      if("${mem_id}" !=""){
      location.href = "/";
      }
   })
</script>

<!-- 네이버 스크립트 -->
<script src="${path}/resources/js/naverapi.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"charset="utf-8"></script>
<script>
var naverLogin = new naver.LoginWithNaverId({
	  clientId: "zkOzac5hPC_Qw6v8eOzQ",
	  callbackUrl: "http://localhost:8080/login",
	  isPopup: false,
	  callbackHandle: false,
	});

	naverLogin.init();

	$(document).on("click", "#naverIdLogin_loginButton", function() {
	  naverLogin.getLoginStatus(function(status) {
	    if (status != null) {
	      var mem_id = naverLogin.user.getEmail();
	      var mem_gender = naverLogin.user.getGender() == 'F' ? 2 : 1;
	      var mem_pw = naverLogin.user.getId();
	      var mem_name = naverLogin.user.getName();

	      $.ajax({
	        type: 'post',
	        url: '/naverSave',
	        data: {
	          'mem_id': mem_id,
	          'mem_gender': mem_gender,
	          'mem_pw': mem_pw,
	          'mem_name': mem_name
	        },
	        dataType: "text",
	        success: function(responseData) {
	          console.log("로그인 AJAXX~~~~~~~~~~~~~~~~");
	          console.log(responseData);

	          if (responseData == 'login') {
	            location.href = "/";
	          } else if (responseData == 'join') {
	            document.querySelector('#mem_id').value = mem_id;
	            document.querySelector('#mem_gender').value = mem_gender;
	            document.querySelector('#mem_pw').value = mem_pw;
	            document.querySelector('#mem_name').value = mem_name;
	            document.querySelector('#naverJoin').submit();
	          } else {
	            alert('로그인실패');
	            console.log('실패');
	          }
	        },
	        error: function(responseData) {
	          alert('오류발생');
	          console.log('오류 발생');
	          naverLogin.login(); // Retry login
	        },
	        retries: 3
	      });
	      return false; // 추가된 코드
	    } else {
	      console.log("callback 처리에 실패하였습니다.");
	      console.log("status is null. Retry login.");
	      naverLogin.login(); // Retry login
	      return false;
	    }
	  });
	});
</script>


