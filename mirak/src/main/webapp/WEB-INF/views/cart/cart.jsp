<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/common/client_hd.jsp"></jsp:include>
<div class="hero-wrap hero-bread"
	style="background-image: url('${path}/resources/images/bg_1.jpg');">
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="index.html">Home</a></span> <span>Cart</span>
				</p>
				<h1 class="mb-0 bread">My Cart</h1>
			</div>
		</div>
	</div>
</div>


<%
session = request.getSession();
%>


 
<section class="ftco-section ftco-cart">
	<form action="/pay" method="post">
	<div class="container">
		<div class="row">
			<div class="col-md-12 ftco-animate">
				<div class="cart-list">
					<table class="table">
						<thead class="thead-primary">
							<tr class="text-center">
								<th>
									<div class="all_check_input_div">
										<input type="checkbox" class="all_check" checked="checked">
										<span class="all_chcek_span">전체선택</span>
									</div>
								</th>
								<th>이미지</th>
								<th>상품명</th>
								<th>가격</th>
								<th>배송일</th>
								<th>요일선택</th>
								<th>갯수</th>
								<th>총가격</th>							
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="c" items="${cartList }">
								<tr class="text-center">
									<td class="cart_info"><input
										type="checkbox" class="cart_checkbox" checked="checked">
										<input type="hidden" class="price_input"
										value="${c.pro_price }"> <input type="hidden"
										class="count_input" value="${c.cart_cnt }"> <input
										type="hidden" class="totalPrice_input"
										value="${c.pro_price * c.cart_cnt }"> <input
										type="hidden" class="_input" value="${c.pro_code }">
									</td>
									<td class="image-prod"><div>
											<img alt="1"
												src="${path}/resources/images/product/${c.pro_image}"
												style="width: 200px; height: 150px;">
										</div></td>
									<td class="product-name">
										<h3>${c.pro_code }${c.pro_name }</h3>
										<p>${c.pro_desc }</p>
									</td>
									<td>${c.pro_price }</td>
									<td>
									<fmt:formatDate value="${c.cart_start }" pattern="yyyy-MM-dd" />
									</td>
									<td>${c.cart_day }</td>
									<td>${c.cart_cnt }									
										<!--
										<div class="quantity_div">
											<input type="text" value="${c.cart_cnt}" class="quantity_input">
											<button class="quantity_btn plus_btn">+</button>
											<button class="quantity_btn minus_btn">-</button>
										</div>
										<a class="quantity_update_btn" data-cartId="${c.cart_code}">변경</a>
										 -->
									</td>
									<td>${c.cart_totprice }</td>
									
									<td>
									<input type="button" value="변경" class="btn btn-primary py-3 px-5"
								data-toggle="modal" data-target="#exampleModal">
									<!-- <a href="/cart/cartUpdate/${c.cart_code }" data-toggle="modal" data-target="#exampleModal" class="btn btn-primary py-3 px-5">변경</a> -->
									</td>
									<td>
<!-- 									<button type="button" class="btn btn-primary py-3 px-5" onclick="javascript:del()"> -->
									<a href="/cart/cartDelete/${c.cart_code }" onclick="javascript:del()" class="btn btn-primary py-3 px-5">삭제</a>
									</td>
								</tr>
							</c:forEach>
</form>	

							

							<!-- END TR-->
						</tbody>
					</table>
					
				</div>
			</div>
		</div>
		<div class="col-lg-4 mt-5 cart-wrap ftco-animate">
			<div class="cart-total mb-3">
				<h3>장바구니 합계</h3>
				<p class="d-flex">
					<span>상품 가짓수</span> <span class="totalKind_span"></span>
				</p>
				<p class="d-flex">
					<span>상품합계</span> <span class="totalPrice_span"></span>
				</p>
				<p class="d-flex">
					<span>배송비</span> <span class="delivery_price"></span>
				</p>
				<hr>
				<p class="d-flex total-price">
					<span>총 결제금액</span> <span class="finalTotalPrice_span"></span>
				</p>
			</div>
			<p>
				<input class="pay_btn btn-primary py-3 px-4" type="submit"
					value="결제하기">
			</p>
		</div>
	</div>

	<!-- Modal -->
	
	<form action="/cart/cartUpdate/${cart_code }">
		<div class="modal fade" id="exampleModal" tabindex="9999"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">구매 옵션 변경</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
					<c:forEach var="c" items="${cartList }">
						<img src="${path}/resources/images/product/${c.pro_image}"
						style="width: 100px; height: 50px;" />
						${c.pro_name }<br>
						${c.pro_price }원<br>
						<br>배송 시작일 선택<br>
						${c.cart_start }<br>
						<input type="date" name="cart_start" class="form-control input-number" style="width:240px;">
						<br>배송 요일 선택 <br>
						${c.cart_day }<br>
						<input type="checkbox" name="cart_day" value="월">월
						<input type="checkbox" name="cart_day" value="화">화
						<input type="checkbox" name="cart_day" value="수">수
						<input type="checkbox" name="cart_day" value="목">목
						<input type="checkbox" name="cart_day" value="금">금
						<input type="checkbox" name="cart_day" value="토">토
						<input type="checkbox" name="cart_day" value="일">일
						<br><br>
						배송 횟수 선택 <br>
						<input type="number" name="cart_cnt" value="${c.cart_cnt}" class="quantity_input">
						<br><br>
					</c:forEach>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">변경</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	
</section>



<jsp:include page="/common/client_ft.jsp"></jsp:include>

<script>



$(function() {
	  $('input[name="daterange"]').daterangepicker({
	    opens: 'left'
	  }, function(start, end, label) {
	    console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
	  });
	});
	
function del(){
    alert('삭제 하시겠습니까');
}






	
	
	$(document).ready(function() {
		// 종합 정보 삽입
		setTotalInfo();
	});

	// 체크에 따른 정보 변화
	$(".cart_checkbox").on("change", function() {
		// 총 주문 정보 세팅(배송비, 총 가격, 물품 수, 종류)
		setTotalInfo($(".cart_info"));
	});

	// 체크박스 전체 선택
	$(".all_check").on("click", function() {

		// 체크박스 체크 해제
		if ($(".all_check").prop("checked")) {
			$(".cart_checkbox").attr("checked", true);
		} else {
			$(".cart_checkbox").attr("checked", false);
		}

		// 총 주문 정보 세팅(배송비, 총 가격, 물품 수, 종류)
		setTotalInfo($(".cart_info"));
	});

	// 총 주문 정보 세팅(배송비, 총 가격, 물품 수, 종류)
	function setTotalInfo() {

		let totalPrice = 0; // 총 가격
		let totalCount = 0; // 총 갯수
		let totalKind = 0; // 총 종류
		let deliveryPrice = 0; // 배송비
		let finalTotalPrice = 0; // 최종 가격(총 가격 + 배송비)

		$(".cart_info")
				.each(
						function(index, element) {

							if ($(element).find(".cart_checkbox")
									.is(":checked") === true) { // 체크 여부 확인
								// 총 가격
								totalPrice += parseInt($(element).find(
										".totalPrice_input").val());
								// 총 갯수
								totalCount += parseInt($(element).find(
										".count_input").val());
								// 총 종류
								totalKind += 1;
							}
						});

		// 배송비
		if (totalPrice >= 100000) {
			deliveryPrice = 0;
		} else if (totalPrice == 0) {
			deliveryPrice = 0;
		} else {
			deliveryPrice = 10000;
		}

		// 최종 결제금액
		finalTotalPrice = totalPrice + deliveryPrice;

		// 총 가격
		$(".totalPrice_span").text(totalPrice.toLocaleString());
		// 총 갯수
		$(".totalCount_span").text(totalCount);
		// 총 가짓수
		$(".totalKind_span").text(totalKind);
		// 배송비
		$(".delivery_price").text(deliveryPrice);
		// 최종 가격(총 가격 + 배송비)
		$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());
	}

	/* 수량 조절 버튼
	$(".plus_btn").on("click", function() {
		let quantity = $(this).parent("div").find("input").val();
		$(this).parent("div").find("input").val(++quantity);
	});
	$(".minus_btn").on("click", function() {
		let quantity = $(this).parent("div").find("input").val();
		if (quantity > 1) {
			$(this).parent("div").find("input").val(--quantity);
		}
	});

	 수량 수정 버튼
	$(".quantity_update_btn").on("click", function() {
		let cartId = $(this).data("cartid");
		let count = $(this).parent("td").find("input").val();
		$(".update_cartId").val(cartId);
		$(".update_count").val(count);
		$(".quantity_update_form").submit();

	});
	 */

	/*
	 결제 페이지 이동 
	$(".pay_btn")
			.on(
					"click",
					function() {

						let form_contents = '';
						let orderNumber = 0;

						$(".cart_info")
								.each(
										function(index, element) {

											if ($(element).find(
													".cart_checkbox").is(
													":checked") === true) { // 체크 여부 확인

												let pro_name = $(element).find(
														".pro_name_input")
														.val();
												let cart_cnt = $(element).find(
														".cart_cnt_input")
														.val();

												let pro_name_input = "<input name='orders[" + orderNumber + "].pro_name' type='hidden' value='" + pro_name + "'>";
												form_contents += pro_name_input;

												let cart_cnt_input = "<input name='orders[" + orderNumber + "].cart_cnt' type='hidden' value='" + cart_cnt + "'>";
												form_contents += cart_cnt_input;

												orderNumber += 1;

											}
										});

						$(".pay_form").html(form_contents);
						$(".pay_form").submit();

					});
	 */
</script>