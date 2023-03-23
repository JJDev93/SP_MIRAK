<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                  <label for="code">장바구니 코드</label> <input type="text" class="form-control" id="cart_code" name="cart_code" value="${cart.cart_code }" readonly>
               </div>
            </div>
            
            <div class="col-md-12">
               <div class="form-group">
                  <label for="name">아이디</label> <input type="text" class="form-control" id="mem_id" name="mem_id" value="${cart.mem_id }">
               </div>
            </div>
            
            <div class="col-md-12">
               <div class="form-group">
                  <label for="name">상품명</label> <input type="text" class="form-control" id="pro_name" name="pro_name" value="${cart.pro_name }">
               </div>
            </div>
            <div class="col-md-12">
               <div class="form-group">
                  <label for="price">상품가격</label> <input type="text" class="form-control" id="pro_price" name="pro_price" value="${cart.pro_price }">
               </div>
            </div>
            
            <div class="col-md-12">
               <div class="form-group">
                  <label for="desc">배송시작일</label> <input type="text" class="form-control" id="cart_start" name="cart_start" value="${cart.cart_start }">
               </div>
            </div>
            
            <div class="col-md-12">
               <div class="form-group">
                  <label for="desc">배송요일</label> <input type="text" class="form-control" id="cart_day" name="cart_day" value="${cart.cart_day }">
               </div>
            </div>
            
            <div class="col-md-12">
               <div class="form-group">
                  <label for="desc">배송횟수</label> <input type="text" class="form-control" id="cart_cnt" name="cart_cnt" value="${cart.cart_cnt }">
               </div>
            </div>
            
            <div class="col-md-12">
               <div class="form-group">
                  <label for="desc">총 가격</label> <input type="text" class="form-control" id="cart_totprice" name="cart_totprice" value="${cart.cart_totprice }">
               </div>
            </div>
            
            <div class="col-md-12">
               <div class="form-group">
                  <label for="desc">결제여부</label> <input type="text" class="form-control" id="cart_check" name="cart_check" value="${cart.cart_check }">
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
	location.replace("/admin/cartDelete?cart_code=${cart.cart_code}");
		}
	else{
		return false;
		}
	
	}
	
	
	
</script>