<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/common/admin_hd.jsp"></jsp:include>
<div class="ftco-section">
   <div class="container">
      <div class="justify-content-center mb-3 pb-3">
         <div class="heading-section text-center">
            <h2>장바구니</h2>
            <p>장바구니 상세페이지 입니다.</p>
         </div>
      </div>
      <form action="/admin/cartUpdate" method="post" enctype="multipart/form-data">
      	<div class="cart_info"> 
			<input type="hidden" class="price_input" value="${cart.pro_price }">
			<input type="hidden" class="count_input" value="${cart.cart_cnt }"> 
			<input type="hidden" class="totalPrice_input" value="${cart.pro_price * cart.cart_cnt }">
			<input type="hidden" class="pro_code" value="${cart.pro_code }">
			<input type="hidden" class="cart_code" value="${cart.cart_code }">
		</div>
         <div class="row">
            <div class="col-md-12">
               <div class="form-group">
                  <label for="cart_code">장바구니 코드</label> <input type="text" readonly="readonly" style="cursor:default" class="form-control" id="cart_code" name="cart_code" value="${cart.cart_code }" readonly>
               </div>
            </div>
            
            <div class="col-md-12">
               <div class="form-group">
                  <label for="mem_id">아이디</label> <input type="text" readonly="readonly" style="cursor:default" class="form-control" id="mem_id" name="mem_id" value="${cart.mem_id }">
               </div>
            </div>
            
            <div class="col-md-12">
               <div class="form-group">
                  <label for="pro_code">상품코드</label> <input type="text" readonly="readonly" style="cursor:default" class="form-control" id="pro_code" name="pro_code" value="${cart.pro_code }">
               </div>
            </div>
            
            <div class="col-md-12">
               <div class="form-group">
                  <label for="pro_name">상품명</label> <input type="text" readonly="readonly" style="cursor:default" class="form-control" id="pro_name" name="pro_name" value="${cart.pro_name }">
               </div>
            </div>
            
            <div class="col-md-12">
               <div class="form-group">
                  <label for="pro_price">상품가격</label> <input type="text" readonly="readonly" style="cursor:default" class="form-control" id="pro_price" name="pro_price" value="${cart.pro_price }">
               </div>
            </div>
            <div class="col-md-12">
               <div class="form-group">
                  <label for="cart_start">배송시작일</label> <input type="date" id="cart_start" name="cart_start" class="form-control input-number" value="${cart.cart_start }" required="required">
               </div>
            </div>
            <div class="col-md-12">
               <div class="daycheck">
                  <label for="cart_day">배송요일</label><br>
	                <label for="mon"><input type="checkbox" name="cart_day" id="mon" style="transform: scale(1.5);" value="월" <c:if test = "${fn : contains(cart.cart_day, '월')}">checked</c:if>>&nbsp;&nbsp;월</label>&nbsp;&nbsp; 
					<label for="tue"><input type="checkbox" name="cart_day" id="tue" style="transform: scale(1.5);" value="화" <c:if test = "${fn : contains(cart.cart_day, '화')}">checked</c:if>>&nbsp;&nbsp;화</label>&nbsp;&nbsp; 
					<label for="wed"><input type="checkbox" name="cart_day" id="wed" style="transform: scale(1.5);" value="수" <c:if test = "${fn : contains(cart.cart_day, '수')}">checked</c:if>>&nbsp;&nbsp;수</label>&nbsp;&nbsp; 
					<label for="thu"><input type="checkbox" name="cart_day" id="thu" style="transform: scale(1.5);" value="목" <c:if test = "${fn : contains(cart.cart_day, '목')}">checked</c:if>>&nbsp;&nbsp;목</label>&nbsp;&nbsp; 
					<label for="fri"><input type="checkbox" name="cart_day" id="fri" style="transform: scale(1.5);" value="금" <c:if test = "${fn : contains(cart.cart_day, '금')}">checked</c:if>>&nbsp;&nbsp;금</label>&nbsp;&nbsp; 
					<label for="sat"><input type="checkbox" name="cart_day" id="sat" style="transform: scale(1.5);" value="토" <c:if test = "${fn : contains(cart.cart_day, '토')}">checked</c:if>>&nbsp;&nbsp;토</label>&nbsp;&nbsp; 
					<label for="sun"><input type="checkbox" name="cart_day" id="sun" style="transform: scale(1.5);" value="일" <c:if test = "${fn : contains(cart.cart_day, '일')}">checked</c:if>>&nbsp;&nbsp;일</label>
               	<br>
               	<label for="all"><input type="checkbox" name="cart_all" id="all" style="transform: scale(1.5);" value="all" onclick='selectAll(this)'>&nbsp;&nbsp;전체선택</label>
                &nbsp;&nbsp; 
                <label for="pyeong"><input type="checkbox" name="cart_pyeong" id="pyeong" style="transform: scale(1.5);" value="pyeong" onclick='selectpyeong(this)'>&nbsp;&nbsp;주중선택</label>
                &nbsp;&nbsp; 
                <label for="jumal"><input type="checkbox" name="cart_jumal" id="jumal" style="transform: scale(1.5);" value="jumal" onclick='selectjumal(this)'>&nbsp;&nbsp;주말선택</label>
               </div>
            </div>
            
            <div class="col-md-12">
               <div class="form-group">
                  <label for="cart_cnt">배송횟수</label> <input type="number" class="form-control" id="cart_cnt" name="cart_cnt" value="${cart.cart_cnt}" min="1" onchange="calculateTotalPrice()">
               </div>
            </div>
            
            <div class="col-md-12">
               <div class="form-group">
                  <label for="cart_totprice">총 가격</label> <input type="text" class="form-control" id="cart_totprice" name="cart_totprice" class="totalPrice_span" value="${cart.cart_cnt * cart.pro_price }">
               </div>
            </div>
            
            <div class="col-md-12">
               <div class="form-group">
                  <label for="cart_show">결제여부</label> <br>
      	            <label for="0"><input type="radio" name="cart_show" id="0" value="0" <c:if test = "${fn : contains(cart.cart_show, '0')}">checked</c:if>> 결제 완료</label>
      				<label for="1"><input type="radio" name="cart_show" id="1" value="1" <c:if test = "${fn : contains(cart.cart_show, '1')}">checked</c:if>> 장바구니 담김 </label>
      				<label for="2"><input type="radio" name="cart_show" id="2" value="2" <c:if test = "${fn : contains(cart.cart_show, '2')}">checked</c:if>> 삭제된 장바구니 </label>
      			</div>
            </div>
            <input type="hidden" name="curPage" value="${curPage}">
         </div>
         <div class="row justify-content-center">
         	<div class="col-xl-7">
				<div class="row mt-2">			
					<div class="col-md-4">
						<a href="/admin/carts/${curPage}" class="btn btn-secondary py-3 px-5 w-100">목록</a>
					</div>
					<div class="col-md-4">
						<input type="submit" class="btn btn-primary py-3 px-5 w-100" value="수정" onclick="return CheckTest();">
					</div>
					<div class="col-md-4">
						<input type="button" class="btn btn-danger py-3 px-5 w-100" value="삭제" onclick="deleteBtn()">
					</div>
				</div>
			</div>
		</div>
      </form>      
   </div>
</div>
<jsp:include page="/common/admin_ft.jsp"></jsp:include>
<script>
	function deleteBtn(){
		if(confirm('삭제 하시겠습니까?')){	
			location.replace("/admin/cartAdminDelete?cart_code=${cart.cart_code}");
		}else{
			return false;
		}
	}
	function selectjumal(selectjumal)  {
	    const checkboxes3 
	         = document.querySelectorAll('#sat, #sun');
	    
	    checkboxes3.forEach((checkbox) => {
	      checkbox.checked = selectjumal.checked;
	    })
	}
	function selectpyeong(selectpyeong)  {
	    const checkboxes2 
	         = document.querySelectorAll('#mon, #tue, #wed, #thu, #fri');
	    
	    checkboxes2.forEach((checkbox) => {
	      checkbox.checked = selectpyeong.checked;
	    })
	}
	function selectAll(selectAll)  {
	     const checkboxes 
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
	$(document).ready(function() {
		// 종합 정보 삽입
		setTotalInfo();
	}); 
	function setTotalInfo() {
		let totalPrice = 0; // 총 가격
		let totalCount = 0; // 총 갯수
		$(".cart_info")
				.each(
						function(index, element) {
								// 총 가격
								totalPrice += parseInt($(element).find(
										".totalPrice_input").val());
								// 총 갯수
								totalCount += parseInt($(element).find(
										".count_input").val());
						});
		// 총 가격
		$(".totalPrice_span").text(totalPrice.toLocaleString());
		// 총 갯수
		$(".totalCount_span").text(totalCount);
	}
	
	
	
	function calculateTotalPrice() {
	    const cart_cnt = document.getElementById('cart_cnt').value;
	    const pro_price = document.getElementById('pro_price').value;
	    const cart_totprice = document.getElementById('cart_totprice');
	    cart_totprice.value = cart_cnt * pro_price;
	  }
</script>