<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.input-number{
	
}


</style>




<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/common/client_hd.jsp"></jsp:include>
<div class="hero-wrap hero-bread"
	style="background-image: url('${path}/resources/images/bg_1.jpg');">
	<div class="container">
		<div class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="index.html">Home</a></span> 
					<span class="mr-2"><a href="index.html">Product</a></span> 
					<span>Product Single</span>
				</p>
				<h1 class="mb-0 bread">Product Single</h1>
			</div>
		</div>
	</div>
</div>
<form method="post">
	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<input type="hidden" name="pro_code" value="${product.pro_code }">
				<div class="col-lg-6 mb-5 ftco-animate">
					<a href="${path}/resources/images/product/${product.pro_image}" class="image-popup">
						<img alt="1" src="${path}/resources/images/product/${product.pro_image}" style="width: 350px; height: 250px;">
					</a>
				</div>
				<div class="col-lg-6 product-details pl-md-5 ftco-animate">
					<h3>${product.pro_name}</h3>
					<p class="price">
						<span>가격: ${product.pro_price}</span>
					</p>
					<p>${product.pro_desc}</p>
					<div class="row mt-4">
						<div class="input-group col-md-6 d-flex mb-3">
							<p style="margin-top:5px;">수량 : &nbsp;&nbsp; </p><input type="text" id="result" name="cart_cnt" class="form-control input-number" min="1" max="100" value="1" onchange="payBtnCnt()">
						</div>
					</div>
					
					
					<label for="start">배송 시작일<input type="date" name="cart_start" class="form-control input-number" style="width:240px;" id="start" min=""></label>
					
					<br>
					
					요일 선택<br>
					<label for="mon"><input type="checkbox" name="cart_day" id="mon" style="transform : scale(1.5);" value="월" checked>&nbsp;&nbsp;월</label> &nbsp;&nbsp;
					<label for="tue"><input type="checkbox" name="cart_day" id="tue" style="transform : scale(1.5);" value="화" checked>&nbsp;&nbsp;화</label> &nbsp;&nbsp;
					<label for="wed"><input type="checkbox" name="cart_day" id="wed" style="transform : scale(1.5);" value="수" checked>&nbsp;&nbsp;수</label> &nbsp;&nbsp;
					<label for="thu"><input type="checkbox" name="cart_day" id="thu" style="transform : scale(1.5);" value="목" checked>&nbsp;&nbsp;목</label> &nbsp;&nbsp;
					<label for="fri"><input type="checkbox" name="cart_day" id="fri" style="transform : scale(1.5);" value="금" checked>&nbsp;&nbsp;금</label> &nbsp;&nbsp;
					<label for="sat"><input type="checkbox" name="cart_day" id="sat" style="transform : scale(1.5);" value="토" checked>&nbsp;&nbsp;토</label> &nbsp;&nbsp;
					<label for="sun"><input type="checkbox" name="cart_day" id="sun" style="transform : scale(1.5);" value="일" checked>&nbsp;&nbsp;일</label>
					
					<br>
					<br>
					<p>

						<a href="/cart/${product.pro_code }/1" id="cartBtn" class="btn btn-primary py-3 px-5" onclick="return payBtnCnt()">장바구니</a>
		             	<a href="/pay/${product.pro_code }/1" id="payBtn" class="btn btn-black py-3 px-5" onclick="return payBtnCnt()">즉시 구매</a>

					</p>
				</div>
			</div>
		</div>
	</section>
</form>
<jsp:include page="/common/client_ft.jsp"></jsp:include>
<script>

	const payBtnCnt = function() {
		
		const dateInput = document.getElementById('start');

		if (!dateInput.value) {
			  
		  alert('날짜를 입력해주세요.');
			return false;
		}
			
		
		
	 let cnt = document.getElementById("result").value;
		
	 let start = document.getElementById("start").value;
 	 let mon = document.getElementById("mon").checked ? "월" : "";
 	 let tue = document.getElementById("tue").checked ? "화" : "";
 	 let wed = document.getElementById("wed").checked ? "수" : "";
	 let thu = document.getElementById("thu").checked ? "목" : "";
	 let fri = document.getElementById("fri").checked ? "금" : "";
 	 let sat = document.getElementById("sat").checked ? "토" : "";
 	 let sun = document.getElementById("sun").checked ? "일" : "";
		
		document.getElementById("payBtn").href = "/pay/${product.pro_code}/"  + cnt + "/" + start + "/" + mon + tue + wed + thu + fri + sat + sun;
		document.getElementById("cartBtn").href = "/cart/${product.pro_code}/" + cnt + "/" + start + "/" + mon + tue + wed + thu + fri + sat + sun;
	}
	
	$(function() {
		  $('input[name="daterange"]').daterangepicker({
		    opens: 'left'
		  }, function(start, end, label) {
		    console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
		  });
		});
	
	
	let today = new Date().toISOString().substr(0, 10);
	document.getElementById("start").min = today;	
	document.getElementById('start').valueAsDate = new Date();
	
	
	
	
</script>




</body>
</html>