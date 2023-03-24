<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/common/client_hd.jsp" />




<div class="hero-wrap hero-bread"
   style="background-image: url('${path}/resources/images/bg_1.jpg');">
   <div class="container">
      <div
         class="row no-gutters slider-text align-items-center justify-content-center">
         <div class="col-md-9 ftco-animate text-center">

            <h1 class="mb-0 bread">상세 결제내역</h1>
         </div>
      </div>
   </div>
</div>

<section class="ftco-section">
   <div class="container">
      <div class="row justify-content-center">
         <div class="col-xl-7 ftco-animate">

            

               <input type="hidden" id="mem_id" name="mem_id" value="${mem_id }">

               <h3 class="mb-4 billing-heading">상세 결제내역 확인</h3>
               
               <c:forEach items="${payVOList}" var="productVO">
                  <input type="hidden" class="totalPrice" name="cart_totprice" value="${productVO.cart_cnt * productVO.pro_price}">
                  <div class="cart-detail p-3 p-md-4 mb-5">
                     <div class="ftco-animate fadeInUp ftco-animated">
                        <div class="blog-entry align-self-stretch d-md-flex">
<%--                            <a href="blog-single.html" class="block-20" style="background-image: url('images/${productVO.pro_image }');"> </a> --%>
                           <img alt="1" src="${path}/resources/images/product/${productVO.pro_image}"  title="${productVO.pro_name }" alt="${productVO.pro_desc }" style="width: 250px; height: 200px;">
                           <div class="text d-block pl-md-4">
                              <h3 class="heading">
                                 ${productVO.pro_name }
                              </h3>

                              <c:choose>
                                 <c:when test="${codecheck == 1}">
                                    <input type="hidden" class="cart_code" name="cart_code" value="${productVO.cart_code }">
                                 </c:when>
                                 <c:otherwise>
                                    <input type="hidden" class="cart_code" name="cart_code" value="0">
                                 </c:otherwise>
                              </c:choose>

                              
                              <p>
<%--                                  <span class="font-weight-bold text-dark">상품 상세</span> ${productVO.pro_desc} <br> --%>
                                 <span class="font-weight-bold text-dark">상품 코드</span> ${productVO.pro_code } <br>
                                 <span class="font-weight-bold text-dark">배송 시작일</span> ${productVO.cart_start } <br>
                                 <span class="font-weight-bold text-dark">상품 가격</span> ${productVO.pro_price }원 <br>
                                 <span class="font-weight-bold text-dark">배송 요일</span> ${productVO.cart_day } <br>
                                 <span class="font-weight-bold text-dark">상품 개수</span> ${productVO.cart_cnt }
                              </p>
                              <hr>
                              <p><span  class="font-weight-bold text-dark">상품별 합계</span> ${productVO.cart_cnt * productVO.pro_price}원</p>
<!--                               <p> -->
<!--                                  <a href="blog-single.html" class="btn btn-primary py-2 px-3">삭제</a> -->
<!--                               </p> -->
                           </div>
                        </div>
                     </div>
                  </div>

               </c:forEach>
               



               <div class="row align-items-end">

            
                  <div class="w-100"></div>
                  <div class="col-md-12">
                     <div class="form-group"></div>
                  </div>

                  <div class="w-100"></div>
                  <div class="col-md-12">
                     <div class="form-group">
                        <label for="address">주소</label> <input type="text"
                           name="mem_address" class="form-control" id="address"
                           style="cursor: default"
                           value="${payVOList[0].mem_zipcode} ${payVOList[0].mem_add1} ${payVOList[0].mem_add2}"
                           readonly>
                     </div>
                  </div>


                  <div class="w-100"></div>
                  <div class="col-md-12">
                     <div class="form-group">
                        <label for="receiverName">받는 사람</label> <input type="text"
                           style="cursor: default" name="mem_name" class="form-control"
                           placeholder="이름" id="receiverName" value="${payVOList[0].mem_name}"
                           readonly>
                     </div>
                  </div>

                  <div class="w-100"></div>
                  <div class="col-md-12">
                     <div class="form-group">
                        <label for="phone">휴대폰 번호</label> <input type="tel"
                           style="cursor: default" name="mem_phone" class="form-control"
                           maxlength="11" pattern="[0-9]{11}" placeholder="" id="phone"
                           value="${payVOList[0].mem_phone}" readonly>
                     </div>
                  </div>

                  <div class="w-100"></div>
                  <div class="col-md-12">
                     <div class="form-group">
                        <label for="req">배송 요청사항</label> <input type="text" style="cursor: default"
                           name="pay_req" class="form-control" value="${payVOList[0].pay_req }"
                           placeholder="요청 사항이 없습니다." id="req" readonly>
                     </div>
                  </div>



               </div>

               <!-- 카카오페이 관련 -->






            <!-- END -->
         </div>
         <div class="col-xl-5">
            <div class="row mt-5 pt-3">
               <div class="col-md-12 d-flex mb-5">
                  <div class="cart-detail cart-total p-3 p-md-4">
                     <h3 class="billing-heading mb-4">Cart Total</h3>
                     <hr>
                     <p class="d-flex total-price">
                        <span>총 결제금액</span> <span id="totalPrice"></span><span>원</span>
                     </p>
                  </div>
               </div>
               <div class="col-md-12">
                  <div class="cart-detail p-3 p-md-4">
                     
                     

                     <a href="/payInfo" class="btn btn-primary py-3 px-5 l-100 mb-2">결제내역 보기</a>
                        
                     <c:if test="${payVOList[0].status eq '결제 완료'}">                        
                        <button id="payCancel" class="btn btn-black py-3 px-5 d-block w-100" data-group_id="${payVOList[0].group_id }">결제 취소</button>
                     </c:if>
                     <c:if test="${payVOList[0].status eq '배송중'}">   
                        <button id="payConfirm" class="btn btn-black py-3 px-5 d-block w-100">구매확정</button>
                     </c:if>
                     
                  </div>
               </div>
            </div>
         </div>
         <!-- .col-md-8 -->
      </div>
   </div>
</section>
<!-- .section -->

<jsp:include page="/common/client_ft.jsp" />



<script>

document.addEventListener('DOMContentLoaded', function(){
   
   let totalPrice = 0;
   document.querySelectorAll('.totalPrice').forEach(function(item){
      totalPrice = totalPrice + Number(item.value)
   })
   
   document.querySelector('#totalPrice').innerText = totalPrice
   document.querySelector('#payPrice').value = totalPrice
   
   
   
   $("#payCancel").click(
         function() {

            let payPrice = $('#payPrice').val();
            console.log(payPrice)
            let group_id = $(this).data('group_id');

            let result = confirm("전체 상품 주문을 취소하시겠습니까?")

            if (result) {
               // 카카오페이 결제 취소 전송
               $.ajax({
                  type : "get",
                  url : "/pay/kakao/cancel",
                  data : {
                     group_id : group_id,
                     totalPrice : payPrice,
                  },
                  success : function(response) {

                     location.href = "/payInfo"
                  }
               })
            }

         })
         
         
         $("#payConfirm").click(
               function() {

                  let group_id = $(this).data('group_id');

                  let result = confirm("구매 확정을 하시겠습니까?")

                  if (result) {
                     // 카카오페이 결제 취소 전송
                     location.href = "/payConfirm/"+group_id
                  }

               })
                     

         })
   
})


</script>

<script>
   document.addEventListener('DOMContentLoaded', function() {
      let totalPrice = 0;
      document.querySelectorAll('.totalPrice').forEach(function(item) {
         totalPrice = totalPrice + Number(item.value)
      })
      document.querySelector('#totalPrice').innerText = totalPrice
      document.querySelector('#payPrice').value = totalPrice
   })
</script>

</body>
</html>