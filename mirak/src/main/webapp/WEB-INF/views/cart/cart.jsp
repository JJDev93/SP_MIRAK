<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% session = request.getSession(); %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/common/client_hd.jsp"></jsp:include>

<div class="hero-wrap hero-bread" style="background-image: url('${path}/resources/images/bg_1.jpg');">
	<div class="ftco-animate">
		<h1 class="bread">장바구니</h1>
	</div>
</div>
<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-10 ftco-animate mb-5">
				<div class="row mb-5">
					<ul class="nav nav-tabs w-100">
						<li class="nav-item"><a class="nav-link" href="/mypage">마이페이지</a></li>
						<li class="nav-item"><a class="nav-link active" href="/cart">장바구니</a></li>
						<li class="nav-item"><a class="nav-link" href="/payInfo">결제내역</a></li>
					</ul>
				</div>
				<div class="row ftco-animate">
					<c:choose>
						<c:when test="${cartList.size() != 0}">
							<form method="post" action="/pay">
								<div class="cart-list">
									<table class="table table_wrap">
										<thead class="thead-primary">
											<tr class="text-center">
												<th style="width:40px;">
													<div class="all_check_input_div">
														<span class="all_chcek_span"></span> <input type="checkbox"
															class="all_check" checked="checked">
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
											</tr>
										</thead>
										<tbody>
											<c:forEach var="c" items="${cartList }">
												<tr class="text-center">
													<td class="cart_info">
														<input type="checkbox" class="cart_checkbox" name="cart_check" checked="checked" value="${c.cart_code }"> 
														<input type="hidden" class="price_input" value="${c.pro_price }"> 
														<input type="hidden" class="count_input" value="${c.cart_cnt }"> 
														<input type="hidden" class="totalPrice_input" value="${c.pro_price * c.cart_cnt }">
														<input type="hidden" class="pro_code" value="${c.pro_code }">
														<input type="hidden" class="cart_code" value="${c.cart_code }">
													</td>
													<td class="image-prod">
														<div>
															<img alt="1" src="${path}/resources/images/product/${c.pro_image}" style="width: 100px;">
														</div>
													</td>
													<td class="product-name"><h3>${c.pro_name }</h3></td>
													<td><fmt:formatNumber value="${c.pro_price }" type="number"/></td>
													<td>${c.cart_start }</td>
													<td>${c.cart_day }</td>
													<td>${c.cart_cnt }</td>
													<td><fmt:formatNumber value="${c.pro_price * c.cart_cnt}" type="number"/></td>
													<td>
														<input type="button" value="변경" class="btn btn-primary" data-toggle="modal" data-target="#modal${c.cart_code }">
														<a href="/cart/cartDelete/${c.cart_code }" class="btn btn-danger" onclick="return confirm('삭제하시겠습니까?');">삭제</a>
													</td>
												</tr>
											</c:forEach>
											<!-- END TR-->
										</tbody>
									</table>
								</div>
								<div class="row">
									<div class="col-lg-4 mt-5 cart-wrap ftco-animate">
										<div class="cart-total mb-3">
											<h3>장바구니 합계</h3>
											<p class="d-flex">
												<span>상품 가짓수</span> <span class="totalKind_span"></span>
											</p>
											<p class="d-flex">
												<span>상품합계</span> <span class="totalPrice_span"></span>
											</p>							
										</div>
										<p>
											<input type="submit" value="결제하기" class="btn btn-primary py-3 px-5">
										</p>
									</div>
								</div>
							</form>
                        </c:when>
						<c:otherwise> 
							등록 된 상품이 없습니다.
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<c:forEach var="c" items="${cartList}">
		 <section class="ftco-section">
			 <div class="container">
		<div class="modal fade" id="modal${c.cart_code }" tabindex="9999" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-md">
				<div class="modal-content">
					<form action="/cartUpdate" method="post" name="day">	
						<input type="hidden" name="cart_code" value="${c.cart_code }">
						<input type="hidden" name="cart_totprice" value="${c.cart_cnt * c.pro_price}">	
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">옵션 변경</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body ftco-animated">
							<h3 class="heading">${c.pro_name }</h3>
							<input type="hidden" readonly="readonly" style="cursor:default" class="form-control" id="pro_price" name="pro_price" value="${c.pro_price }">
							<div class="mb-2">
								<label for="start"><span class="font-weight-bold">배송 시작일</span></label>
								<input type="date" id="start" name="cart_start" class="form-control input-number cart_start" value="${c.cart_start }"  required="required">
							</div>			
							<div class="mb-2">
								<span  class="font-weight-bold">배송 요일</span>
								<div>
									<label for="mon"><input type="checkbox" name="cart_day" id="mon" value="월" <c:if test = "${fn : contains(c.cart_day, '월')}">checked</c:if>> 월</label>&nbsp;&nbsp; 
									<label for="tue"><input type="checkbox" name="cart_day" id="tue" value="화" <c:if test = "${fn : contains(c.cart_day, '화')}">checked</c:if>> 화</label>&nbsp;&nbsp; 
									<label for="wed"><input type="checkbox" name="cart_day" id="wed" value="수" <c:if test = "${fn : contains(c.cart_day, '수')}">checked</c:if>> 수</label>&nbsp;&nbsp; 
									<label for="thu"><input type="checkbox" name="cart_day" id="thu" value="목" <c:if test = "${fn : contains(c.cart_day, '목')}">checked</c:if>> 목</label>&nbsp;&nbsp; 
									<label for="fri"><input type="checkbox" name="cart_day" id="fri" value="금" <c:if test = "${fn : contains(c.cart_day, '금')}">checked</c:if>> 금</label>&nbsp;&nbsp; 
									<label for="sat"><input type="checkbox" name="cart_day" id="sat" value="토" <c:if test = "${fn : contains(c.cart_day, '토')}">checked</c:if>> 토</label>&nbsp;&nbsp; 
									<label for="sun"><input type="checkbox" name="cart_day" id="sun" value="일" <c:if test = "${fn : contains(c.cart_day, '일')}">checked</c:if>> 일</label>
									<br>
									<label for="all"><input type="checkbox" name="cart_all" id="all" value="all" onclick='selectAll(this)'> 전체선택</label>
	            					&nbsp;&nbsp; 
	             					<label for="pyeong"><input type="checkbox" name="cart_pyeong" id="pyeong" value="pyeong" onclick='selectpyeong(this)'> 주중선택</label>
	            					&nbsp;&nbsp; 
	            					<label for="jumal"><input type="checkbox" name="cart_jumal" id="jumal" value="jumal" onclick='selectjumal(this)'> 주말선택</label>
            					</div>
							</div>
									<div class="mb-2">
										<span class="font-weight-bold text-dark">상품 개수</span><br>
										<%-- 	<input type="number" class="form-control cart_cnt" id="cart_cnt" name="cart_cnt" value="${c.cart_cnt}" min="1" onchange="calculateTotalPrice()"> --%>
										<div class="input-group">
											<span class="input-group-btn mr-2">
												<button type="button" class="btn btn-outline-secondary" data-type="minus" data-field="">
													<i class="ion-ios-remove"></i>
												</button>
											</span>
											<input type="text"class="form-control input-number cart_cnt" name="cart_cnt" value="${c.cart_cnt}" min="1" max="99"> 
											<span class="input-group-btn mr-2">
												<button type="button" class="btn btn-outline-secondary" data-type="plus" data-field="">
													<i class="ion-ios-add"></i>
												</button>
											</span>
										</div>
									</div>
									<div>
								<span class="font-weight-bold text-dark">총 금액</span>
								<input type="text" class="form-control cart_totprice" id="cart_totprice" name="cart_totprice" class="totalPrice_span" value="${c.cart_cnt * c.pro_price }">
							</div>			
						</div>
						<div class="modal-footer">
							<input type="submit" value="변경" class="btn btn-primary py-3 px-5" onclick="return CheckTest();">
							<button type="button" class="btn btn-black py-3 px-5" data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		</div>
		</section>
	</c:forEach>
</section>
<jsp:include page="/common/client_ft.jsp"></jsp:include>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script>
////총금액 구하기
//	function calculateTotalPrice() { 
//	  const cart_cnt = parseInt(this.value);
//	  const pro_price = parseInt(this.parentNode.parentNode.querySelector('.form-control[name="pro_price"]').value);
//	  const cart_totprice = this.parentNode.parentNode.querySelector('.cart_totprice');
//	  cart_totprice.value = cart_cnt * pro_price;
//	}

//	const cntInputList = document.querySelectorAll('.cart_cnt');

//	cntInputList.forEach(cntInput => {
//	  cntInput.addEventListener('input', calculateTotalPrice);
//	});

<!-- 수량 변경 기능 -->
$(document).ready(function(){
    $('.input-number').on('input', function(){
      const cart_cnt = parseInt($(this).val());
      const pro_price = parseInt($(this).closest('.modal').find('.form-control[name="pro_price"]').val());
      const cart_totprice = $(this).closest('.modal').find('.cart_totprice');
      cart_totprice.val(cart_cnt * pro_price);
    });

    $('.input-group-btn button').on('click', function(e){
      e.preventDefault();
      const input = $(this).closest('.input-group').find('.input-number');
      const currentValue = parseInt(input.val());
      const pro_price = parseInt($(this).closest('.modal').find('.form-control[name="pro_price"]').val());
      const cart_totprice = $(this).closest('.modal').find('.cart_totprice');
      
      if($(this).data('type') === 'minus'){
    	    if(currentValue > parseInt(input.attr('min'))){
    	      input.val(currentValue - 1).change();
    	      cart_totprice.val((currentValue - 1) * pro_price);
    	    }
    	  } else if($(this).data('type') === 'plus'){
    	    if(currentValue < parseInt(input.attr('max'))){
    	      input.val(currentValue + 1).change();
    	      cart_totprice.val((currentValue + 1) * pro_price);
    	    }
    	  }
    });
  });
  
function selectjumal(selectjumal) {
  var checkboxes2 = document.getElementsByName('cart_day');

  for (var i = 0; i < checkboxes2.length; i++) {
    var checkbox2 = checkboxes2[i];

    if (checkbox2.value == '토' || checkbox2.value == '일') {
      checkbox2.checked = selectjumal.checked;
    }
  }
}
function selectpyeong(selectpyeong) {
  var checkboxes3 = document.getElementsByName('cart_day');
  
  for (var i = 0; i < checkboxes3.length; i++) {
    var checkbox3 = checkboxes3[i];
    
    if (checkbox3.value !== '토' && checkbox3.value !== '일') {
      checkbox3.checked = selectpyeong.checked;
    }
  }
}
function selectAll(selectAll) {
  var checkboxes4 = document.getElementsByName('cart_day');
  for (var checkbox4 of checkboxes4) {
    checkbox4.checked = selectAll.checked;
  }
}
function CheckTest() {
	var checkboxes = document.getElementsByName("cart_day");
	var checked = false;
	for (var i = 0; i < checkboxes.length; i++) {
	  if (checkboxes[i].checked) {
	    checked = true;
	    break;
	  }
	}
	if (!checked) {
	  alert("배송 요일을 선택해주세요!");
	  return false;
	}
}
  
  
	$(function() {
		$('input[name="daterange"]').daterangepicker(
				{
					opens : 'left'
				},
				function(start, end, label) {
					console.log("A new date selection was made: "
							+ start.format('YYYY-MM-DD') + ' to '
							+ end.format('YYYY-MM-DD'));
				});
	});
	const today = new Date().toISOString().slice(0, 10);
	const cartStartInputs = document.querySelectorAll('.form-control.input-number[name="cart_start"]');
    cartStartInputs.forEach(function(input) {
    	input.min = today;
    });
  
   
	$(document).ready(function() {
		// 종합 정보 삽입
		setTotalInfo();
	});
	// 체크에 따른 정보 변화
	$(".cart_checkbox").on("change", function() {
		// 총 주문 정보 세팅(총 가격, 물품 수, 종류)
		setTotalInfo($(".cart_info"));
	});
	// 체크박스 전체 선택
	$(document).ready(function() {
		$(".all_check").click(function() {
			if ($(".all_check").is(":checked"))
				$("input[class=cart_checkbox]").prop("checked", true);
			else
				$("input[class=cart_checkbox]").prop("checked", false);
			// 총 주문 정보 세팅(총 가격, 물품 수, 종류)
			setTotalInfo($(".cart_info"));
		});
		$("input[class=cart_checkbox]").click(function() {
			var total = $("input[class=cart_checkbox]").length;
			var checked = $("input[class=cart_checkbox]:checked").length;
			if (total != checked)
				$(".all_check").prop("checked", false);
			else
				$(".all_check").prop("checked", true);
		});
	});
	// 총 주문 정보 세팅(총 가격, 물품 수, 종류)
	function setTotalInfo() {
		let totalPrice = 0; // 총 가격
		let totalCount = 0; // 총 갯수
		let totalKind = 0; // 총 종류
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
		// 총 가격
		$(".totalPrice_span").text(totalPrice.toLocaleString());
		// 총 갯수
		$(".totalCount_span").text(totalCount);
		// 총 가짓수
		$(".totalKind_span").text(totalKind);
	}
	
	$(document).ready(function() {
		console.log("message : "+"${message}");
		console.log("mem_id : "+"${mem_id}");
		if("${message}" !=""){
			alert("${message}");
			 <%session.setAttribute("message", "");%>
		}
	})
</script>