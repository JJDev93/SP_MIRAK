<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/common/client_hd.jsp" />
<div class="hero-wrap hero-bread" style="background-image: url('${path}/resources/images/bg_1.jpg');">
	<div class="ftco-animate">
		<h1 class="bread">상세 결제내역</h1>
	</div>
</div>
<section class="ftco-section">
	<div class="container">
		<div class="row ftco-animate fadeInUp">
			<div class="col-xl-7">
				<form action="/updateDetailInfo" method="post" id="updateForm">
				<div>
					<h2 class="mb-2 billing-heading">상세 결제내역 확인</h2>
					<input type="hidden" id="mem_id" name="mem_id" value="${mem_id }">
					<div class="cart-detail p-3 p-md-4 mb-4">
						<c:forEach items="${payVOList}" var="productVO">
							<div class="cart-detail-li ftco-animate fadeInUp">
								<input type="hidden" class="totalPrice" name="cart_totprice" value="${productVO.cart_cnt * productVO.pro_price}">
								<div class="blog-entry align-self-stretch d-md-flex">
									<img alt="1"
										src="${path}/resources/images/product/${productVO.pro_image}"
										title="${productVO.pro_name }" alt="${productVO.pro_desc }"
										style="width:200px; height: fit-content;">
									<div class="text d-block pl-md-4">
										<h3 class="heading">${productVO.pro_name }</h3>

										<p>
											<span class="font-weight-bold text-dark">상품 코드</span> ${productVO.pro_code } 
											<br> 
											<span class="font-weight-bold text-dark">배송 시작일</span> ${productVO.cart_start } 
											<br> 
											<span class="font-weight-bold text-dark">상품 가격</span> ${productVO.pro_price }원 
											<br>
											<span class="font-weight-bold text-dark">배송 요일</span> ${productVO.cart_day } 
											<br> 
											<span class="font-weight-bold text-dark">상품 개수</span> ${productVO.cart_cnt }
										</p>
										<hr>
										<p>
											<span class="font-weight-bold text-dark">상품별 합계</span>
											${productVO.cart_cnt * productVO.pro_price} 원
										</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div><input name="group_id" type="hidden" value="${payVOList[0].group_id}">
					<h2 class="mb-2 billing-heading">배송지 정보</h2>
					<div class="row align-items-end">
						<div class="col-md-12">
							<div class="form-group">
								<label for="receiverName">받는 사람</label> <input type="text"
									name="mem_name" class="form-control"
									placeholder="이름" id="receiverName"
									value="${payVOList[0].mem_name}" required>
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<label for="phone">연락처</label> 
								<input type="tel" name="mem_phone" class="form-control" maxlength="11" pattern="[0-9]{11}" placeholder="" id="phone" value="${payVOList[0].mem_phone}" required>
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
<!-- 								<label for="address">주소</label>  -->
<%-- 								<input type="text" name="mem_zipcode" class="form-control mb-2" id="address" value="${payVOList[0].mem_zipcode}" required> --%>
<%-- 								<input type="text" name="mem_add1" class="form-control mb-2" id="address" value="${payVOList[0].mem_add1}" required> --%>
<%-- 								<input type="text" name="mem_add2" class="form-control" id="address" value="${payVOList[0].mem_add2}" required> --%>
								
								<label for="streetaddress">주소 <span class="text-danger">*</span></label>
								<div class="row mb-2">
									<div class="col-sm-8">
										<input type="text" class="form-control" id="address_input_1" value="${payVOList[0].mem_zipcode}" name="mem_zipcode" placeholder="우편번호" required="required" onkeydown="event.preventDefault();" autocomplete="off" readonly>
									</div>
									<div class="col-sm-4">
										<button type="button" id="streetaddress"  class="btn btn-primary joinBtn address button" tabIndex="12" onclick="execution_daum_address();">우편번호찾기</button>
									</div>
								</div>
								<input type="text" id="address_input_2" value="${payVOList[0].mem_add1}" class="form-control mb-2" name="mem_add1" placeholder="주소지를 입력해주세요" readonly="readonly">
								<input type="text" id="address_input_3" value="${payVOList[0].mem_add2}" class="form-control" name="mem_add2" tabIndex="13" placeholder="상세주소를 작성해주세요" >
								
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<label for="req">배송 요청사항</label> <input type="text"
									name="pay_req" class="form-control"
									value="${payVOList[0].pay_req }" placeholder="요청 사항이 없습니다."
									id="req" >
							</div>
						</div>
					</div>
				</div>
				</form>
				<!-- 카카오페이 관련 -->
				<!-- END -->
			</div>
			<div class="col-xl-5">
				<h2 class="mb-2 billing-heading">결제정보</h2>
				<div class="cart-detail cart-total p-3 p-md-4 mb-3">
					<p class="d-flex total-price"><input type="hidden" id="payPrice">
						<span>총 결제금액</span><span id="totalPrice"></span><span>원</span>
					</p>
				</div>
				<div class="cart-detail p-3 p-md-4">
					<a href="/payInfo" class="btn btn-primary py-3 px-5 l-100 mb-2">결제내역 보기</a>
					<button class="btn btn-primary py-3 px-5 l-100 mb-2" type="submit" form="updateForm">배송지 정보 변경</button>
					<c:if test="${payVOList[0].status eq '결제 완료'}">
						<button id="payCancel" class="btn btn-black py-3 px-5 d-block w-100" data-group_id="${payVOList[0].group_id }">결제 취소</button>
					</c:if>
					<c:if test="${payVOList[0].status eq '배송중'}">
						<button id="payConfirm" class="btn btn-black py-3 px-5 d-block w-100">구매확정</button>
					</c:if>
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
            let totalPrice = $('#payPrice').val();
            console.log('payPrice',payPrice)
            let group_id = $(this).data('group_id');
            console.log('group_id',group_id)

            let result = confirm("전체 상품 주문을 취소하시겠습니까?")

            if (result) {
               // 카카오페이 결제 취소 전송
               $.ajax({
                  type : "get",
                  url : "/pay/kakao/cancel",
                  data : {
                     group_id : group_id,
                     totalPrice : totalPrice,
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