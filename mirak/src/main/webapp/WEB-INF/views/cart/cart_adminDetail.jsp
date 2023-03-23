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
            <h2>장바구니 관리</h2>
            <p>장바구니 상세페이지 입니다.</p>
         </div>
      </div>
      
      <form action="/admin/cartUpdate" method="post" enctype="multipart/form-data" class="p-5 bg-light mb-4">
         <div class="row">
            <div class="col-md-12">
               <div class="form-group">
                  <label for="code">장바구니 코드</label> <input type="text" readonly="readonly" class="form-control" id="cart_code" name="cart_code" value="${cart.cart_code }" readonly>
               </div>
            </div>
            
            <div class="col-md-12">
               <div class="form-group">
                  <label for="name">아이디</label> <input type="text" readonly="readonly" class="form-control" id="mem_id" name="mem_id" value="${cart.mem_id }">
               </div>
            </div>
            
            <div class="col-md-12">
               <div class="form-group">
                  <label for="name">상품코드</label> <input type="text" readonly="readonly" class="form-control" id="pro_code" name="pro_code" value="${cart.pro_code }">
               </div>
            </div>
            
            <div class="col-md-12">
               <div class="form-group">
                  <label for="name">상품명</label> <input type="text" readonly="readonly" class="form-control" id="pro_name" name="pro_name" value="${cart.pro_name }">
               </div>
            </div>
            
            <div class="col-md-12">
               <div class="form-group">
                  <label for="price">상품가격</label> <input type="text" readonly="readonly" class="form-control" id="pro_price" name="pro_price" value="${cart.pro_price }">
               </div>
            </div>
            
            <div class="col-md-12">
               <div class="form-group">
                  <label for="desc">배송시작일</label> <input type="date" id="cart_start" name="cart_start" class="form-control input-number" value="${cart.cart_start }" required="required">
               </div>
            </div>
            
            <div class="col-md-12">
               <div class="form-group">
                  <label for="desc">배송요일</label><br>
	                <label for="mon"><input type="checkbox" name="cart_day" id="mon" style="transform: scale(1.5);" value="월" <c:if test = "${fn : contains(cart.cart_day, '월')}">checked</c:if>>&nbsp;&nbsp;월</label>&nbsp;&nbsp; 
					<label for="tue"><input type="checkbox" name="cart_day" id="tue" style="transform: scale(1.5);" value="화" <c:if test = "${fn : contains(cart.cart_day, '화')}">checked</c:if>>&nbsp;&nbsp;화</label>&nbsp;&nbsp; 
					<label for="wed"><input type="checkbox" name="cart_day" id="wed" style="transform: scale(1.5);" value="수" <c:if test = "${fn : contains(cart.cart_day, '수')}">checked</c:if>>&nbsp;&nbsp;수</label>&nbsp;&nbsp; 
					<label for="thu"><input type="checkbox" name="cart_day" id="thu" style="transform: scale(1.5);" value="목" <c:if test = "${fn : contains(cart.cart_day, '목')}">checked</c:if>>&nbsp;&nbsp;목</label>&nbsp;&nbsp; 
					<label for="fri"><input type="checkbox" name="cart_day" id="fri" style="transform: scale(1.5);" value="금" <c:if test = "${fn : contains(cart.cart_day, '금')}">checked</c:if>>&nbsp;&nbsp;금</label>&nbsp;&nbsp; 
					<label for="sat"><input type="checkbox" name="cart_day" id="sat" style="transform: scale(1.5);" value="토" <c:if test = "${fn : contains(cart.cart_day, '토')}">checked</c:if>>&nbsp;&nbsp;토</label>&nbsp;&nbsp; 
					<label for="sun"><input type="checkbox" name="cart_day" id="sun" style="transform: scale(1.5);" value="일" <c:if test = "${fn : contains(cart.cart_day, '일')}">checked</c:if>>&nbsp;&nbsp;일</label>
               	
               </div>
            </div>
            
            <div class="col-md-12">
               <div class="form-group">
                  <label for="desc">배송횟수</label> <input type="number" class="form-control" id="cart_cnt" name="cart_cnt" value="${cart.cart_cnt}" min="1">
               </div>
            </div>
            
            <div class="col-md-12">
               <div class="form-group">
                  <label for="desc">총 가격</label> <input type="text" readonly="readonly" class="form-control" id="cart_totprice" name="cart_totprice" value="${cart.cart_totprice }">
               </div>
            </div>
            
            <div class="col-md-12">
               <div class="form-group">
                  <label for="desc">결제여부</label> <br>
      	            <input type="radio" name="cart_show" id="0" value="결제 전" <c:if test = "${fn : contains(cart.cart_show, '0')}">checked</c:if>> 결제 전
      				<input type="radio" name="cart_show" id="1" value="결제 완료" <c:if test = "${fn : contains(cart.cart_show, '1')}">checked</c:if>> 결제 완료
               </div>
            </div>
            
            
            <input type="hidden" name="curPage" value="${curPage}">
            <br><br><br><br><br><br><br><br><br>
            
            <div class="col-md-12">
               <div class="form-group">
                  <input type="submit" class="form-control" value="장바구니 수정">
               </div>
            </div>
         </div>
      </form>      

      
      <a href="/admin/carts/${curPage}" class="btn btn-secondary">목록</a>
      
<%--       ?pageNum=${pageNum} --%>
	
      <input type="button" class="btn btn-danger" value="삭제" onclick="deleteBtn()">
   </div>
</div>
<jsp:include page="/common/admin_ft.jsp"></jsp:include>
<script>

function deleteBtn(){
	
	if(confirm('삭제 하시겠습니까?')){	
	location.replace("/admin/cartAdminDelete?cart_code=${cart.cart_code}");
		}
	else{
		return false;
		}
	
	}
	

	
</script>