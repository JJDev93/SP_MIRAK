<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/common/client_hd.jsp" />

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->

<div class="hero-wrap hero-bread" style="background-image: url('${path}/resources/images/bg_1.jpg');">
	<div class="ftco-animate">
		<h1 class="bread">주문하기</h1>
	</div>
</div>
<section class="ftco-section">
	<div class="container">
		<h2 class="mb-2 billing-heading">주문 확인</h2>
		<div class="row justify-content-center">
			<div class="col-xl-7 ftco-animate">
				<form id="orderForm" action="/paySubmit" method="post">
					<input type="hidden" id="mem_id" name="mem_id" value="${mem_id }">
					<c:forEach items="${productList}" var="productVO">
						<div class="cart-detail p-3 p-md-4 mb-4">
							<div class="ftco-animate fadeInUp ftco-animated">
								<div class="blog-entry align-self-stretch d-md-flex">
<%-- 									<a href="blog-single.html" class="block-20" style="background-image: url('images/${productVO.pro_image }');"> </a> --%>
									<img src="${path}/resources/images/product/${productVO.pro_image }" title="${productVO.pro_name }" alt="${productVO.pro_desc }" style="width: 250px; height: 200px;">
									<div class="text d-block pl-md-4">
										<h3 class="heading">
											${productVO.pro_name }
										</h3>
										<input type="hidden" class="pro_name" name="pro_name" value="${productVO.pro_name }">
										<input type="hidden" class="pro_code" name="pro_code" value="${productVO.pro_code }">
										<input type="hidden" class="pro_desc" name="pro_desc" value="${productVO.pro_desc }">
										<input type="hidden" class="pro_image" name="pro_image" value="${productVO.pro_image }">
										<input type="hidden" class="cart_day" name="cart_day" value="${productVO.cart_day }">
										<c:choose>
											<c:when test="${codecheck == 1}">
												<input type="hidden" class="cart_code" name="cart_code" value="${productVO.cart_code }">
											</c:when>
											<c:otherwise>
												<input type="hidden" class="cart_code" name="cart_code" value="0">
											</c:otherwise>
										</c:choose>
										<input type="hidden" class="cart_start" name="cart_start" value="${productVO.cart_start }">
										<input type="hidden" class="pro_price" name="pro_price" value="${productVO.pro_price }">
										<input type="hidden" class="cart_cnt" name="cart_cnt" value="${productVO.cart_cnt }">
										<input type="hidden" class="totalPrice" name="cart_totprice" value="${productVO.cart_cnt * productVO.pro_price}">
										
										<p>
<%-- 											<span class="font-weight-bold text-dark">상품 상세</span> ${productVO.pro_desc} <br> --%>
											<span class="font-weight-bold text-dark">상품 코드</span> ${productVO.pro_code } <br>
											<span class="font-weight-bold text-dark">배송 시작일</span> ${productVO.cart_start } <br>
											<span class="font-weight-bold text-dark">상품 가격</span> ${productVO.pro_price }원 <br>
											<span  class="font-weight-bold text-dark">배송 요일</span> ${productVO.cart_day } <br>
											<span  class="font-weight-bold text-dark">상품 개수</span> ${productVO.cart_cnt }
										</p>
										<hr>
										<p><span  class="font-weight-bold text-dark">상품별 합계</span> ${productVO.cart_cnt * productVO.pro_price}원</p>
<!-- 										<p> -->
<!-- 											<a href="blog-single.html" class="btn btn-primary py-2 px-3">삭제</a> -->
<!-- 										</p> -->
									</div>
								</div>
							</div>
						</div>
					</c:forEach>

					<div class="row align-items-end">
						<div class="col-md-12">
							<div class="form-group">
								<label for="address">주소</label> 
								<input type="hidden" name="mem_address" class="form-control" id="address" style="cursor: default" value="${memberVO.mem_zipcode} ${memberVO.mem_add1} ${memberVO.mem_add2}" readonly>
								<input type="text" name="mem_zipcode" class="form-control mb-2" value="${memberVO.mem_zipcode}" readonly>
								<input type="text" name="mem_add1" class="form-control mb-2" value="${memberVO.mem_add1}" readonly>
								<input type="text" name="mem_add2" class="form-control mb-2" value="${memberVO.mem_add2}" readonly>
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<label for="receiverName">받는 사람</label> <input type="text"
									style="cursor: default" name="mem_name" class="form-control"
									placeholder="이름" id="receiverName" value="${memberVO.mem_name}"
									readonly>
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<label for="phone">휴대폰 번호</label> <input type="tel"
									style="cursor: default" name="mem_phone" class="form-control"
									maxlength="11" pattern="[0-9]{11}" placeholder="" id="phone"
									value="${memberVO.mem_phone}" readonly>
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<label for="req">배송 요청사항</label> <input type="text"
									name="pay_req" class="form-control"
									placeholder="50자 이내로 적어주세요." id="req" autofocus>
							</div>
						</div>
					</div>
					<!-- 카카오페이 관련 -->
				</form>
				<!-- END -->
			</div>
			<div class="col-xl-5">
				<div class="cart-detail cart-total p-3 p-md-4 mb-3">
					<h3 class="billing-heading mb-4">Cart Total</h3>
					<hr>
					<p class="d-flex total-price">
						<span>총 결제금액</span> <span id="totalPrice"></span><span>원</span>
					</p>
				</div>
				<div class="cart-detail p-3 p-md-4">
					<h3 class="billing-heading mb-4">결제 방법</h3>
					<div class="form-group">
						<div class="col-md-12">
							<div class="radio">
								<label><input type="radio" name="optradio" checked="on" class="mr-2">Kakao Pay</label>
							</div>
						</div>
					</div>
					<p>
						<input type="button" id="btn-kakao-pay" class="btn btn-primary py-3 px-5 l-100 mb-2" value="주문하기">
						<a href="/" class="btn btn-black py-3 px-5 d-block">취소</a><br>
					</p>
				</div>
			</div>
			<!-- .col-md-8 -->
		</div>
	</div>
</section>
<!-- .section -->

<jsp:include page="/common/client_ft.jsp" />

<script type="text/javascript">
	$(function() {
		$("#btn-kakao-pay").click(function() {
			let proCode = document.querySelectorAll('.pro_code')
			let cartCode = document.querySelectorAll('.cart_code')
			let cartCnt = document.querySelectorAll('.cart_cnt')
			let proPrice = document.querySelectorAll('.pro_price')
			let proName = document.querySelectorAll('.pro_name')
			let cartTotal = document.querySelectorAll('.totalPrice')
			let proDesc = document.querySelectorAll('.pro_desc')
			let proImage = document.querySelectorAll('.pro_image')
			let cartDay = document.querySelectorAll('.cart_day')
			let cartStart = document.querySelectorAll('.cart_start')

			let pro_code = ""
			let cart_code = ""
			let cart_cnt = ""
			let pro_price = ""
			let pro_name = ""
			let totalPrice = ""
			let pro_desc = ""
			let pro_image = ""
			let cart_day = ""
			let cart_start = ""

			let mem_id = document.querySelector('#mem_id').value

			for (var i = 0; i < proCode.length; i++) {
				pro_code = pro_code + proCode[i].value + ","
				cart_code = cart_code + cartCode[i].value + ","
				cart_cnt = cart_cnt + cartCnt[i].value + ","
				pro_price = pro_price + proPrice[i].value + ","
				pro_name = pro_name + proName[i].value + ","
				totalPrice = totalPrice + cartTotal[i].value + ","
				pro_desc = pro_desc + proDesc[i].value + ","
				pro_image = pro_image + proImage[i].value + ","
				cart_day = cart_day + cartDay[i].value + ","
				cart_start = cart_start + cartStart[i].value + ","
			}

			let mem_add = document.querySelector('#address').value
			let mem_name = document.querySelector('#receiverName').value
			let mem_phone = document.querySelector('#phone').value
			let pay_req = document.querySelector('#req').value

			// 카카오페이 결제전송
			$.ajax({
				type : "get",
				url : "/order/pay",
				data : {
					pro_code : pro_code,
					cart_code : cart_code,
					cart_cnt : cart_cnt,
					pro_price : pro_price,
					pro_name : pro_name,
					totalPrice : totalPrice,
					pro_desc : pro_desc,
					pro_image : pro_image,
					mem_add : mem_add,
					mem_name : mem_name,
					mem_phone : mem_phone,
					pay_req : pay_req,
					cart_day : cart_day,
					cart_start : cart_start,

				},
				success : function(response) {

					location.href = response.next_redirect_pc_url
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