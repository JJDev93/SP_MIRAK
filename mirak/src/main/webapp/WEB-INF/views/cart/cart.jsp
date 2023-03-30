<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/common/client_hd.jsp"></jsp:include>

<div class="hero-wrap hero-bread"
	style="background-image: url('${path}/resources/images/bg_1.jpg');">
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<h1 class="mb-0 bread">장바구니</h1>
			</div>
		</div>
	</div>
</div>
<%
session = request.getSession();
%>

<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-10 ftco-animate mb-5">
				<ul class="nav nav-tabs w-100">
					<li class="nav-item"><a class="nav-link" href="/mypage">마이페이지</a></li>
					<li class="nav-item"><a class="nav-link active" href="/cart">장바구니</a></li>
					<li class="nav-item"><a class="nav-link" href="/payInfo">결제내역</a></li>
				</ul>
			</div>
		</div>

		<div class="row justify-content-center">
			<div class="col-xl-12 ftco-animate">
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
									<th colspan="2"></th>
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
										<td class="product-name">
											<h3>${c.pro_name }</h3>
										</td>
										<td>${c.pro_price }</td>
										<td>${c.cart_start }</td>
										<td>${c.cart_day }</td>
										<td>${c.cart_cnt }</td>
										<td>${c.pro_price * c.cart_cnt}</td>
										<td>
											<input type="button" value="변경" class="btn btn-primary" data-toggle="modal" data-target="#modal${c.cart_code }">
										</td>
										<td class="product-remove">
											<a href="/cart/cartDelete/${c.cart_code }" onclick="return confirm('삭제하시겠습니까?');">
											<span class="ion-ios-close"></span></a>
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
			</div>
		</div>
	</div>
	<!-- Modal -->
	<c:forEach var="c" items="${cartList}">
		<div class="modal fade" id="modal${c.cart_code }" tabindex="9999" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<form action="/cartUpdate" method="post" name="day">
						<input type="hidden" name="cart_code" value="${c.cart_code }">
						<input type="hidden" name="cart_totprice" value="${c.cart_cnt * c.pro_price}">		
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">구매 옵션 변경</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="ftco-animated">
								<div class="blog-entry align-self-stretch d-md-flex">
									<div>
										<img src="${path}/resources/images/product/${c.pro_image}" title="${c.pro_name }" alt="${c.pro_desc }" style="width: 250px;">
									</div>
									<div class="text d-block pl-md-4">
										<h3 class="heading">${c.pro_name }</h3>								
										<p>
											<span class="font-weight-bold text-dark">상품 상세</span> ${c.pro_desc}
										</p>												
										<p>
											<span class="font-weight-bold text-dark">상품 가격</span> ${c.pro_price }원 <br>
										</p>					
										<p>
											<label for="start"><span class="font-weight-bold text-dark">배송 시작일</span></label>
											<input type="date" id="start" name="cart_start" class="form-control input-number" value="${c.cart_start }"  required="required">
										</p>		
										<p class="daycheck">
											<span  class="font-weight-bold text-dark">배송 요일</span><br>
											&nbsp;
											<label for="mon"><input type="checkbox" name="cart_day" id="mon" style="transform: scale(1.5);" value="월" <c:if test = "${fn : contains(c.cart_day, '월')}">checked</c:if>>&nbsp;&nbsp;월</label>&nbsp;&nbsp; 
											<label for="tue"><input type="checkbox" name="cart_day" id="tue" style="transform: scale(1.5);" value="화" <c:if test = "${fn : contains(c.cart_day, '화')}">checked</c:if>>&nbsp;&nbsp;화</label>&nbsp;&nbsp; 
											<label for="wed"><input type="checkbox" name="cart_day" id="wed" style="transform: scale(1.5);" value="수" <c:if test = "${fn : contains(c.cart_day, '수')}">checked</c:if>>&nbsp;&nbsp;수</label>&nbsp;&nbsp; 
											<label for="thu"><input type="checkbox" name="cart_day" id="thu" style="transform: scale(1.5);" value="목" <c:if test = "${fn : contains(c.cart_day, '목')}">checked</c:if>>&nbsp;&nbsp;목</label>&nbsp;&nbsp; 
											<label for="fri"><input type="checkbox" name="cart_day" id="fri" style="transform: scale(1.5);" value="금" <c:if test = "${fn : contains(c.cart_day, '금')}">checked</c:if>>&nbsp;&nbsp;금</label>&nbsp;&nbsp; 
											<label for="sat"><input type="checkbox" name="cart_day" id="sat" style="transform: scale(1.5);" value="토" <c:if test = "${fn : contains(c.cart_day, '토')}">checked</c:if>>&nbsp;&nbsp;토</label>&nbsp;&nbsp; 
											<label for="sun"><input type="checkbox" name="cart_day" id="sun" style="transform: scale(1.5);" value="일" <c:if test = "${fn : contains(c.cart_day, '일')}">checked</c:if>>&nbsp;&nbsp;일</label>
											
				<label for="all"><input type="checkbox" name="cart_all" id="all" style="transform: scale(1.5);" value="all" onclick='selectAll(this)'>&nbsp;&nbsp;전체선택</label>
                &nbsp;&nbsp; 
                <label for="pyeong"><input type="checkbox" name="cart_pyeong" id="pyeong" style="transform: scale(1.5);" value="pyeong" onclick='selectpyeong(this)'>&nbsp;&nbsp;주중선택</label>
                &nbsp;&nbsp; 
                <label for="jumal"><input type="checkbox" name="cart_jumal" id="jumal" style="transform: scale(1.5);" value="jumal" onclick='selectjumal(this)'>&nbsp;&nbsp;주말선택</label>
										</p>						
										<p>
											<label for="cnt"><span class="font-weight-bold text-dark">상품 개수</span><br></label>
											<input type="number" id="cnt" name="cart_cnt" value="${c.cart_cnt}" class="quantity_input" min="1">
										</p>
										<hr>
										<p><span class="font-weight-bold text-dark">총 금액</span> ${c.cart_cnt * c.pro_price} 원</p>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<%-- <a href="/cartUpdate/${c.cart_code}" class="btn btn-primary py-3 px-5">변경</a> --%>
							<!-- <input type="submit" value="변경" class="btn btn-primary py-3 px-5"> -->
							<!-- <input type="submit" value="변경" class="btn btn-primary py-3 px-5" onclick="if(document.getElementsByName('cart_start')[0].value==''){alert('배송 시작일을 입력해주세요.');return false;}"> -->
							<input type="submit" value="변경" class="btn btn-primary py-3 px-5" onclick="return CheckTest();">
							
							<button type="button" class="btn btn-black py-3 px-5" data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
			</div>
		</div>

	</c:forEach>
</section>
<jsp:include page="/common/client_ft.jsp"></jsp:include>






<script>
function selectjumal(selectjumal)  {
    var checkboxes3 
         = document.querySelectorAll('#sat, #sun');
    
    checkboxes3.forEach((checkbox) => {
      checkbox.checked = selectjumal.checked;
    })
  }
function selectpyeong(selectpyeong)  {
    var checkboxes2 
         = document.querySelectorAll('#mon, #tue, #wed, #thu, #fri');
    
    checkboxes2.forEach((checkbox) => {
      checkbox.checked = selectpyeong.checked;
    })
  }
function selectAll(selectAll)  {
     var checkboxes 
          = document.getElementsByName('cart_day');
     
     checkboxes.forEach((checkbox) => {
       checkbox.checked = selectAll.checked;
     })
   }


//요일 체크되었는지 확인
function CheckTest() {
		
	const checkPart = document.querySelector('.daycheck');
    const checkboxes = checkPart.querySelectorAll('input');

    for( let i = 0; i < checkboxes.length; i ++){
        if(checkboxes[i].checked === true)
        	return;	
        // 체크박스 돌다가 checked가 있으면 바로 return
    }
    alert('요일을 선택해주세요'); 
    // 체크없으면 바로 return해서 alert
    return false;
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
	
	let today = new Date().toISOString().substr(0, 10);
	document.getElementById("start").min = today;	
	document.getElementById('start').valueAsDate = new Date();

	
	
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
</script>

<script>
	$(document).ready(function() {
		console.log("message : "+"${message}");
		console.log("mem_id : "+"${mem_id}");
		if("${message}" !=""){
			alert("${message}");
			 <%session.setAttribute("message","");%>
		}
	})
</script>