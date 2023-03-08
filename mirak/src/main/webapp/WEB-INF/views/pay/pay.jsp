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
					
					<form id="orderForm" class="billing-form" action="/pay/payList" method="post">
						<h3 class="mb-4 billing-heading">주소</h3>
						<div class="row align-items-end">
							
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group">
									
								</div>
							</div>
							
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group">
									<label for="streetaddress">주소</label> <input type="text" class="form-control">
								</div>
							</div>
						
							
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group">
									<label for="streetaddress">받는 사람</label> <input type="text" class="form-control" placeholder="이름">
								</div>
							</div>
							
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group">
									<label for="streetaddress">휴대폰 번호</label> <input type="tel" class="form-control" maxlength="11" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="">
								</div>
							</div>
							
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group">
									<label for="towncity">배송 요청사항</label> <input type="text" class="form-control" placeholder="">
								</div>
							</div>
							
							
						</div>
					</form>
					<!-- END -->
				</div>
				<div class="col-xl-5">
					<div class="row mt-5 pt-3">
						<div class="col-md-12 d-flex mb-5">
							<div class="cart-detail cart-total p-3 p-md-4">
								<h3 class="billing-heading mb-4">Cart Total</h3>
								<p class="d-flex">
									<span>Subtotal</span> <span>$20.60</span>
								</p>
								<p class="d-flex">
									<span>Delivery</span> <span>$0.00</span>
								</p>
								<p class="d-flex">
									<span>Discount</span> <span>$3.00</span>
								</p>
								<hr>
								<p class="d-flex total-price">
									<span>Total</span> <span>$17.60</span>
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
									<button type="submit" form="orderForm" id="order" class="btn btn-primary py-3 px-4">주문하기</a>
									
									
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

  
	</script>

</body>
</html>
