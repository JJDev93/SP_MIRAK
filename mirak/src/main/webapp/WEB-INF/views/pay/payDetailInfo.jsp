<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/common/client_hd.jsp" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">



$(function(){
	

	
	$("#btn-kakao-pay").click(function(){
		
		
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
			type:"get"
			,url:"/order/pay"
			,data:{
				pro_code: pro_code,
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
			success:function(response){
				
				
				location.href = response.next_redirect_pc_url			
			}
		})
	})
})


</script>
<script>

document.addEventListener('DOMContentLoaded', function(){
	
	let totalPrice = 0;
	document.querySelectorAll('.totalPrice').forEach(function(item){
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

				<form id="orderForm" class="billing-form" action="/paySubmit"
					method="post">

					<input type="hidden" id="mem_id" name="mem_id" value="${mem_id }">

					<h3 class="mb-4 billing-heading">주문 확인</h3>
					


					<c:forEach items="${payVOList}" var="productVO">


				
					<div class="col-md-12 d-flex mb-5">
						<div class="cart-detail cart-total p-3 p-md-4">
							<p class="d-flex">
								<span>상품명</span> <span class="font-weight-bold text-dark">${productVO.pro_name }</span>
								<span>상품 코드</span><span>${productVO.pro_code }</span>
							</p>
							<p class="d-flex">
								<span>배송 시작일</span> <span class="font-weight-bold text-dark">${productVO.cart_start }</span>			
								<input type="hidden" class="pro_price" name="pro_price" value="${productVO.pro_price }">					
								<span>상품 가격</span><span class="font-weight-bold text-dark">${productVO.pro_price }원</span>
							</p>
							<p class="d-flex">
								<span>배송 요일</span><span class="font-weight-bold text-dark">${productVO.cart_day }</span>
								<input type="hidden" class="totalPrice" name="cart_totprice" value="${productVO.cart_cnt * productVO.pro_price}">								
								<span>상품 개수</span><span class="font-weight-bold text-dark">${productVO.cart_cnt }</span>
							</p>
							<hr>
							<p class="d-flex total-price">
								<span>상품별 합계</span><span></span><span></span><span>${productVO.cart_cnt * productVO.pro_price}원</span>
								
							</p>
						</div>
					</div>
					

						
						
					</c:forEach>


					<div class="row align-items-end">



						<div class="col-md-12">
							<div class="form-group"></div>
						</div>

						<div class="w-100"></div>
						<div class="col-md-12">
							<div class="form-group">
								<label for="address">주소</label> <input type="text"
									name="mem_address" class="form-control" id="address"
									value="${memberVO.mem_age}">
							</div>
						</div>


						<div class="w-100"></div>
						<div class="col-md-12">
							<div class="form-group">
								<label for="receiverName">받는 사람</label> <input type="text"
									name="mem_name" class="form-control" placeholder="이름"
									id="receiverName" value="${memberVO.mem_name}">
							</div>
						</div>

						<div class="w-100"></div>
						<div class="col-md-12">
							<div class="form-group">
								<label for="phone">휴대폰 번호</label> <input type="tel"
									name="mem_phone" class="form-control" maxlength="11"
									pattern="[0-9]{11}" placeholder="" id="phone"
									value="${memberVO.mem_phone}">
							</div>
						</div>

						<div class="w-100"></div>
						<div class="col-md-12">
							<div class="form-group">
								<label for="req">배송 요청사항</label> <input type="text"
									name="pay_req" class="form-control"
									placeholder="50자 이내로 적어주세요." id="req">
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
							
							

								<input type="submit" form="orderForm" id="order"
									class="btn btn-primary py-3 px-5 l-100" value="결제목록 보기"><br>
								<a href="/" class="btn btn-black py-3 px-5 l-100">결제 상태</a><br>
								<input type="button" id="btn-kakao-pay"
									class="btn btn-primary py-3 px-5 l-100" value="결제 취소"><br>

							
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



</body>
</html>
