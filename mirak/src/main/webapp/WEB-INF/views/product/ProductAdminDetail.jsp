<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/common/admin_hd.jsp"></jsp:include>
<div class="ftco-section">
   <div class="container">
      <div class="justify-content-center mb-3 pb-3">
         <div class="heading-section text-center">
            <h2>상품관리</h2>
            <p>상품 상세페이지 입니다.</p>
         </div>
      </div>
      <form action="/admin/productUpdate" method="post" enctype="multipart/form-data">
         <div class="row">
            <div class="col-md-12">
               <div class="form-group">
                  <label for="code">상품코드</label> <input type="text" class="form-control" id="code" name="pro_code" value="${product.pro_code }">
               </div>
            </div>
            <div class="col-md-12">
               <div class="form-group">
                  <label for="name">상품명</label> <input type="text" class="form-control" id="name" name="pro_name" value="${product.pro_name }">
               </div>
            </div>
            <div class="col-md-12">
               <div class="form-group">
                  <label for="price">상품가격</label> <input type="text" class="form-control" id="price" name="pro_price" value="${product.pro_price }">
               </div>
            </div>
            <div class="col-md-12">
               <div class="form-group">
                  <label for="desc2">상품 요약설명</label> <textarea name="pro_desc2" cols="10" rows="1" class="form-control" id="desc2">${product.pro_desc2 }</textarea>
               </div>
            </div>
            <div class="col-md-12">
               <div class="form-group">
                  <label for="desc">상품 상세설명</label> <textarea name="pro_desc" cols="40" rows="10" class="form-control" id="desc">${product.pro_desc }</textarea>
               </div>
            </div>
            <div class="col-md-12">
               <div class="form-group">
                  <label for="image">이미지</label> <input type="text" class="form-control" id="image" name="pro_image" value="${product.pro_image }">
               </div>
            </div>
            <div class="col-md-12">
               <div class="form-group">
                  <label for="imagefile">이미지 파일</label>
               </div>
               <img alt="${product.pro_desc2}" src="${path}/resources/images/product/${product.pro_image}" style="width:200px; heigt:200px;" title="${product.pro_name}">
            </div>
            <div class="col-md-12">
               <div class="form-group">
                  <label for="cnt">이미지 파일</label> <input type="file" class="form-control" id="cnt" name="uploadFile">
               </div>
            </div>
            <input type="hidden" name="curPage" value="${curPage}">
         </div>
         <div class="row justify-content-center">
         	<div class="col-xl-7">
				 <div class="row mt-2">			
					<div class="col-md-4">
						<a href="/admin/products/${curPage}" class="btn btn-secondary py-3 px-5 w-100">목록</a>
					</div>
					<div class="col-md-4">
						<input type="submit" class="btn btn-primary py-3 px-5 w-100" value="상품 수정">
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
		location.replace("/admin/productDelete?pro_code=${product.pro_code}");
	}else{
		return false;
	}
}
</script>