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
                  <span class="mr-2"><a href="index.html">어서오세요</a></span> <span></span>
               </p>
               <h1 class="mb-0 bread">회원가입 해보자</h1>
            </div>
         </div>
      </div>
   </div>   
   <section class="ftco-section">
      <div class="container">
         <div class="row justify-content-center">
            <div class="col-xl-7 ftco-animate">
               <form action="join" method="post" class="billing-form">
                  <h3 class="mb-4 billing-heading">회원가입</h3>
                  <div class="row align-items-end">
                     <div class="container">
                        <div class="row block-9">
                           <div class="col-md-12 order-md-last ">
                              <div class="form-group">
                                 <label for="ID">아이디</label> <input type="text" name="mem_id"
                                    class="form-control" placeholder="이메일(ID)">
                              </div>
                              <div class="form-group">
                                 <label for="PW">비밀번호</label> <input type="password" name="mem_pw"
                                    class="form-control" placeholder="비밀번호">
                              </div>
                              <div class="form-group">
                                 <label for="PW">비밀번호 확인</label> <input type="password"
                                    class="form-control" placeholder="비밀번호 확인">
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="w-100"></div>
                     <div class="col-md-12">
                        <div class="form-group">
                           <label for="firstname">이름</label> <input type="text"
                              name="mem_name" class="form-control" placeholder="이름을 입력해주세요">
                        </div>
                     </div>
                     <div class="w-100"></div>
                     <div class="col-md-6">
                        <div class="form-group">
                           <label for="age">나이</label> <input type="text" name="mem_age" id="age" class="form-control" placeholder="나이를 입력해주세요">
                        </div>
                     </div>
   
                     <div class="w-100"></div>
                     <div class="col-md-6">
                        <div class="form-group">
                           <label for="gender">성별</label>
                           <div>
                              <input type="radio" name="gender" value="man" name="mem_gender">남
                              &nbsp;&nbsp;&nbsp; 
                              <input type="radio" name="gender" value="woman" name="mem_gender">여
                           </div>
                        </div>
                     </div>
                     <div class="w-100"></div>
                     <div class="col-md-6">
                        <div class="form-group">
                           <label for="phone">Phone</label> <input type="tel" name="mem_phone" class="form-control" maxlength="11" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" placeholder="' - ' 빼고 숫자만 입력해 주세요">
                        </div>
                     </div>
                     <div class="w-100"></div>
                     <div class="form-group">
                        <input type="submit" value="회원 가입"
                           class="btn btn-primary py-3 px-5">
                     </div>
                  </div>
               </form>
               <!-- END -->
            </div>
            <!-- .col-md-8 -->
         </div>
      </div>
   </section>
   <!-- .section -->   
<jsp:include page="/common/client_ft.jsp"></jsp:include>
