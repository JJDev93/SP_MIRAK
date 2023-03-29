
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/common/admin_hd.jsp"></jsp:include>
<div class="ftco-section">
   <div class="container">
      <div class="justify-content-center mb-3 pb-3">
         <div class="heading-section text-center">
            <h2>상품등록</h2>
            <p>상품 등록페이지 입니다.</p>
         </div>
      </div>
      <form action="/admin/productRegister" method="post" enctype="multipart/form-data" class="p-5 bg-light mb-4">
         <div class="row">
            <div class="col-md-12">
               <div class="form-group">
                  <label for="code">상품코드</label> <input type="text" class="form-control" id="code" name="pro_code" required>
               </div>
            </div>
            
            <div class="col-md-12">
               <div class="form-group">
                  <label for="name">상품명</label> <input type="text" class="form-control" id="name" name="pro_name" required>
               </div>
            </div>
            <div class="col-md-12">
               <div class="form-group">
                  <label for="price">상품가격</label> <input type="text" class="form-control" id="price" name="pro_price" required>
               </div>
            </div>
            
            <div class="col-md-12">
               <div class="form-group">
                  <label for="desc2">상품 요약설명</label> <textarea name="pro_desc2" cols="10" rows="1" class="form-control" id="desc2" required></textarea>
               </div>
            </div>           
            
            <div class="col-md-12">
               <div class="form-group">
                  <label for="desc">상품 상세설명</label> <textarea name="pro_desc" cols="40" rows="10" class="form-control" id="desc" required></textarea>
               </div>
            </div>         
           
            <div class="col-md-12">
               <div class="form-group">
                  <label for="image">이미지</label> <input type="text" class="form-control" id="image" name="pro_image" required>
               </div>
            </div>
            
            <div class="col-md-12">
               <div class="form-group">
                  <label for="ifile">이미지 파일</label> <input type="file" class="form-control" id="ifile" name="uploadFile">
               </div>
            </div>
            
            
            <div class="col-md-12">
               <div class="form-group">
                  <input type="submit" class="form-control" value="상품 등록">
               </div>
            </div>
            
         </div>
         <input type="reset" value="다시 입력" class="btn btn-secondary">
      </form>      
      <a href="/admin/products/1" class="btn btn-secondary">목록</a>
      

   </div>
</div>
<jsp:include page="/common/client_ft.jsp"></jsp:include>


<script>


	
</script>

