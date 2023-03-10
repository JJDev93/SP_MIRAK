<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/common/client_hd.jsp" />

<script>

document.addEventListener('DOMContentLoaded', function(){
	
	let totalPrice = 0;
	document.querySelectorAll('.productprice').forEach(function(item){
		totalPrice = totalPrice + Number(item.value)
	})
	
	document.querySelector('#totalPrice').innerText = totalPrice
	document.querySelector('#payPrice').value = totalPrice
	
	
})


</script>

	<div class="hero-wrap hero-bread"
		style="background-image: url('${path}/resources/images/bg_1.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home</a></span> <span>Checkout</span>
					</p>
					<h1 class="mb-0 bread">Checkout</h1>
				</div>
			</div>
		</div>
	</div>
	
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-7 ftco-animate">
					
					<form id="orderForm" class="billing-form" action="/paySubmit" method="post">
					
					<input type="hidden" name="" value="">
					
						<h3 class="mb-4 billing-heading">주문 확인</h3>
						
						<c:forEach items="${productList}" var="productVO">
		
						
						<div>상품 코드 <input type="hidden" name="pro_code" value="${productVO.pro_code }">${productVO.pro_code }</div>
						<c:if test="${codecheck == 1}">
						<div>카트 코드 <input type="hidden" name="cart_code" value="${productVO.cart_code }">${productVO.cart_code }</div>
						 </c:if>
						<div>상품명 <input type="hidden" name="pro_name" value="${productVO.pro_name }">${productVO.pro_name }</div>
						<div>상품 상세 <input type="hidden" name="pro_desc" value="${productVO.pro_desc }">${productVO.pro_desc }</div>
						<div>상품이미지 <input type="hidden" name="pro_image" value="${productVO.pro_image }">${productVO.pro_image }</div>
						<div>상품 가격 <input type="hidden" name="pro_price" value="${productVO.pro_price }">${productVO.pro_price }</div>
						<div>상품 개수 <input type="hidden" name="cart_cnt" value="${productVO.cart_cnt }">${productVO.cart_cnt }</div>
						<div>상품별 합계 <input type="hidden" class="productprice" name="cart_totprice" value="${productVO.cart_cnt * productVO.pro_price}">${productVO.cart_cnt * productVO.pro_price}</div>
						<br>
						</c:forEach>
						
						
						<input type="text" name="payPrice" id="hiddenPrice">
						
					
						
						<div class="row align-items-end">
						
							
							
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group">
									
								</div>
							</div>
							
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group">
									<label for="address">주소</label> <input type="text" name="mem_address" class="form-control" id="address" value="${memberVO.mem_age}">
								</div>
							</div>
						
							
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group">
									<label for="receiverName">받는 사람</label> <input type="text" name="mem_name" class="form-control" placeholder="이름" id="receiverName" value="${memberVO.mem_name}">
								</div>
							</div>
							
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group">
									<label for="phone">휴대폰 번호</label> <input type="tel" name="mem_phone" class="form-control" maxlength="11" pattern="[0-9]{11}" placeholder="" id="phone" value="${memberVO.mem_phone}">
								</div>
							</div>
							
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group">
									<label for="req">배송 요청사항</label> <input type="text" name="pay_req" class="form-control" placeholder="50자 이내로 적어주세요." id="req">
								</div>
							</div>
							
							
							
						</div>
						
						<!-- 카카오페이 관련 -->
						
						
						
						
						
						
					</form>
					<!-- END -->
				</div>
				<div class="col-xl-5">
					<div class="row mt-5 pt-3">
						<div class="col-md-12 d-flex mb-5">
							<div class="cart-detail cart-total p-3 p-md-4">
								<h3 class="billing-heading mb-4">Cart Total</h3>
								<p class="d-flex">
									<span>상품 가격</span> <span id="totalPrice"></span><span>원</span>
								</p>
								<p class="d-flex">
									<span>배송료</span> <span>$0.00</span>
								</p>
								<p class="d-flex">
									<span>Discount</span> <span>$3.00</span>
								</p>
								<hr>
								<p class="d-flex total-price">
									<span>총 결제금액</span> <span>$100</span>
								</p>
							</div>
						</div>
						<div class="col-md-12">
							<div class="cart-detail p-3 p-md-4">
								<h3 class="billing-heading mb-4">결제 방법</h3>
								<div class="form-group">
									<div class="col-md-12">
										<div class="radio">
											<label><input type="radio" name="optradio"
												class="mr-2">Kakao Pay</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-12">
										<div class="radio">
											<label><input type="radio" name="optradio"
												class="mr-2"> Check Payment</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-12">
										<div class="radio">
											<label><input type="radio" name="optradio"
												class="mr-2"> Paypal</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-12">
										<div class="checkbox">
											<label><input type="checkbox" value="" class="mr-2">
												I have read and accept the terms and conditions</label>
										</div>
									</div>
								</div>
								<p>
									
									<input type="submit" form="orderForm" id="order" class="btn btn-primary py-3 px-5 l-100" value="주문하기"><br>									
									<a href="/" class="btn btn-black py-3 px-5 l-100">취소</a><br>
									<input type="button" id="btn-kakao-pay" class="btn btn-primary py-3 px-5 l-100" value="카카오주문"><br>
									
								</p>
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
	

	const kakaopay = function() {
		fetch("kapi.kakao.com/v1/payment/ready", {
			method: "POST",
			headers: {
				"Authorization": "KakaoAK ${APP_ADMIN_KEY}"",
				"Content-type": "application/x-www-form-urlencoded;charset=utf-8"
			},
			body: {
				"cid": "TC0ONETIME",
				"partner_order_id": "p001",
				"partner_user_id": "ywshin",
				"item_name": "프리미엄돈까스",
				"quantity": 1,
				"total_amount": 200,
				"tax_free_amount": 0,
				"approval_url": "http://localhost:8080/mirak/payApproval",
				"cancel_url": "http://localhost:8080/mirak/payCancel",
				"fail_url": "http://localhost:8080/mirak/payFail"
			},
		})
		.then((response) => response.json())
		.then((data) => console.log(data))
		.catch((error) => console.log("error:", error));
	}
	
	
	$(function(){
		$("#btn-kakao-pay").click(function(){
			
			// 필수입력값을 확인.
			var name = $("#form-payment input[name='pay-name']").val();
			var tel = $("#form-payment input[name='pay-tel']").val();
			var email = $("#form-payment input[name='pay-email']").val();
			
			if(name == ""){
				$("#form-payment input[name='pay-name']").focus()
			}
			if(tel == ""){
				$("#form-payment input[name='pay-tel']").focus()
			}
			if(email == ""){
				$("#form-payment input[name='pay-email']").focus()
			}
			
			// 결제 정보를 form에 저장한다.
			let totalPayPrice = parseInt($("#total-pay-price").text().replace(/,/g,''))
			let totalPrice = parseInt($("#total-price").text().replace(/,/g,''))
			let discountPrice = totalPrice - totalPayPrice 
			let usePoint = $("#point-use").val()
			
			
			// 카카오페이 결제전송
			$.ajax({
				type:'get'
				,url:'/order/pay'
				,data:{
					total_amount: totalPayPrice
					,payUserName: name
					,sumPrice:totalPrice
					,discountPrice:discountPrice
					,totalPrice:totalPayPrice
					,tel:tel
					,email:email
					,usePoint:usePoint
					
				},
				success:function(response){
					location.href = response.next_redirect_pc_url			
				}
			})
		})
	})
	

  
	</script>

</body>
</html>
