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
                  <label for="ID">아이디</label> <input type="text"
                     class="form-control" id="ID" name="mem_id" placeholder="이메일(ID)"
                     required="required">
               </div>
               <div class="form-group">
                  <label for="PW">비밀번호</label> <input type="password" id="PW"
                     class="form-control" name="mem_pw" placeholder="비밀번호"
                     required="required">
               </div>
               <div>
                  <label style="color: red">${message }</label>
               </div>
               <div class="form-group row">
                  <div class="col-md-12">
                     <input type="submit" value="로그인"
                        class="btn btn-primary py-3 px-5 w-100">
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

      <div class="row justify-content-center mt-5">

         <div class="col-md-6">
            <div class="row justify-content-center ftco-services">

               <!-- 구글 -->
               <div class="col-sm-2 text-center ftco-animate">
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
               <div class="col-sm-2 text-center ftco-animate">
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
<ul>

   <li onclick="naverLogout(); return false;">
      <a href="javascript:void(0)">
          <span>네이버 로그아웃</span>
      </a>
   </li>
</ul>

<form id="naverJoin" action="/naverTest" method="post">
<input type="hidden" name="mem_id" value="" id="mem_id">
<input type="hidden" name="mem_gender" value="" id="mem_gender">
<input type="hidden" name="mem_pw" value="" id="mem_pw">
<input type="hidden" name="mem_name" value="" id="mem_name">
</form>

</section>
<jsp:include page="/common/client_ft.jsp"></jsp:include>
<!-- 네이버 스크립트 -->
<script
   src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
   charset="utf-8"></script>
<script src="${path}/resources/js/naverapi.js"></script>

<script>
   var naverLogin = new naver.LoginWithNaverId({
      clientId : "zkOzac5hPC_Qw6v8eOzQ", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
      callbackUrl : "http://localhost:8080/login", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
      isPopup : false,
      callbackHandle : true
   });

   naverLogin.init();

   $(document).on("click", "#naverIdLogin_loginButton", function() {
      naverLogin.getLoginStatus(function(status) {
         if (status) {

            var accessToken = naverLogin.accessToken.accessToken;

            var mem_id = naverLogin.user.getEmail();
            if (naverLogin.user.getGender() == 'F') {
               var mem_gender = 2
            } else {
               var mem_gender = 1
            }
            var mem_pw = naverLogin.user.getId();
            var mem_name = naverLogin.user.getName();

            console.log(naverLogin.user);
            
            
            $.ajax({
                type : 'post',
                url : '/naverSave',
                data : {
                   'mem_id' : mem_id,
                   'mem_gender' : mem_gender,
                   'mem_pw' : mem_pw,
                   'mem_name' : mem_name
                },
                dataType : "text",
                success : function(responseData) {
                   console.log("로그인 AJAXX~~~~~~~~~~~~~~~~");
                   console.log(responseData);

                   if (responseData == 'loginsuccess') {

                      location.href = "/";
                   } else if (responseData == 'join') {
                	   
                	   document.querySelector('#mem_id').value=mem_id,
                	   document.querySelector('#mem_gender').value=mem_gender,
                	   document.querySelector('#mem_pw').value=mem_pw,
                	   document.querySelector('#mem_name').value=mem_name,
                	   document.querySelector('#naverJoin').submit()
                	                   	   
                   } else {
                      alert('로그인실패');
                      console.log('실패')
                      return false;
                   }
                },
                error : function(responseData) {
                   alert('오류발생');
                   console.log('오류 발생')
                   return false;
                }

             })

            

         } else {
            console.log("callback 처리에 실패하였습니다.");
         }
      });
   });

   var testPopUp;
   function openPopUp() {
      testPopUp = window.open("https://nid.naver.com/nidlogin.logout",
            "_blank",
            "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
   }
   function closePopUp() {
      testPopUp.close();
   }

   function naverLogout() {
      openPopUp();
      setTimeout(function() {
         closePopUp();
      }, 1000);

   }
</script>