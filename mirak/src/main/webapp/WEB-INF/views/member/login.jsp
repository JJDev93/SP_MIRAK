<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
      <div class="row justify-content-center">
         <div class="col-md-6 ftco-animate">
            <div class="hr-sect">or</div>
         </div>
      </div>
      <div class="row justify-content-center" style="margin: 2rem; margin-bottom: 50px;">
         <div class="col-md-5">
            <div class="row justify-content-center ftco-services"> 
               <!-- 구글 -->
               <div class="col-4 text-center ftco-animate">
                  <a id="custom-login-btn" href="${googleUrl}"><img alt=""
                     src="resources/images/ico_member_google.png"></a>
               </div>
               <!-- 네이버 -->
				<div class="col-4 text-center ftco-animate">
					<a id="naverIdLogin_loginButton" href="/naverLogin">
					<span><img alt="" src="resources/images/ico_member_naver.png"style="cursor: pointer"></span></a>
				</div>
               <!-- 카카오 -->
               <div class="col-4 text-center ftco-animate">
                  <div class="media block-6 services mb-md-0 mb-4 kakao">
                     <a id="btn"
                        href="https://kauth.kakao.com/oauth/authorize?client_id=e481c91b1136f51f927a619fc062146d&redirect_uri=https://www.mirak.shop/kakaoLogin&response_type=code">
                        <img alt="" src="resources/images/ico_member_kakao.png">
                     </a>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
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