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
					<span class="mr-2"><a href="index.html">Home</a></span> <span>Cart</span>
				</p>
				<h1 class="mb-0 bread">My Cart</h1>
			</div>
		</div>
	</div>
</div>

<section class="ftco-section ftco-cart">
	<div class="container">
		<div class="row">
			<div class="col-md-12 ftco-animate">
				<div class="cart-list">
					<table class="table">
						<thead class="thead-primary">
							<tr class="text-center">
								<th>이미지</th>
								<th>상품명</th>
								<th>가격</th>
								<th>요일선택</th>
								<th>배송횟수</th>
								<th>총가격</th>
								<th>
									<div class="all_check_input_div">
										<input type="checkbox" class="all_check" checked="checked">
										<span class="all_chcek_span">전체선택</span>
									</div>
								</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="c" items="${cartList }">
								<tr class="text-center">
									<td class="image-prod"><div>${c.pro_image }</div></td>
									<td class="product-name">
										<h3>${c.pro_name }</h3>
										<p>${c.pro_desc }</p>
									</td>
									<td>${c.pro_price }</td>
									<td>${c.cart_day }</td>
									<td>
										<div class="quantity_div">
											<input type="text" value="${c.cart_cnt}" class="quantity_input">
											<button class="quantity_btn plus_btn">+</button>
											<button class="quantity_btn minus_btn">-</button>
										</div> <a class="quantity_update_btn" data-cartId="${c.cart_code}">변경</a>
									</td>
									<td>${c.pro_price * c.cart_cnt }</td>
									<td class="cart_info"><input type="checkbox"
										class="cart_checkbox" checked="checked"> <input
										type="hidden" class="price_input" value="${c.pro_price }">
										<input type="hidden" class="count_input" value="${c.cart_cnt }">
										<input type="hidden" class="totalPrice_input"
										value="${c.pro_price * c.cart_cnt }"></td>
								</tr>
							</c:forEach>

							<!-- 수량 조정 form -->
							<form action="/cart/update" method="post" class="quantity_update_form">
								<input type="hidden" name="cartId" class="update_cartId">
								<input type="hidden" name="count" class="update_count">
								<input type="hidden" name="mem_id" value="${c.mem_id}">
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
				<input class="btn btn-primary py-3 px-4" type="submit" value="결제하기">
			</p>
		</div>
	</div>
</section>

<jsp:include page="/common/client_ft.jsp"></jsp:include>

<script>
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

	// 수량 조절 버튼
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

	// 수량 수정 버튼
	$(".quantity_update_btn").on("click", function() {
		let cartId = $(this).data("cartid");
		let count = $(this).parent("td").find("input").val();
		$(".update_cartId").val(cartId);
		$(".update_count").val(count);
		$(".quantity_update_form").submit();

	});
</script>