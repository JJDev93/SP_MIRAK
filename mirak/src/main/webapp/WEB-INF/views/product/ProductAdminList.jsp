<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
   #abc{
      float:left;
      margin-right:10px;
   }
 
</style>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%-- <c:set var="path" value="${request.getSession().getServletContext().getRealPath('resources/images/product')}" /> --%>
<div id="test">
   <jsp:include page="/common/admin_hd.jsp"></jsp:include>
   <div class="ftco-section">
      <div class="container">
         <div class="justify-content-center mb-3 pb-3">
            <div class="heading-section text-center">
               <h2>상품목록</h2>
               <p>상품 목록 페이지 입니다.</p>
            </div>
         </div>
         <a href="/admin/productRegister" class="btn btn-primary mb-4">상품 추가</a>
         <div class="bd-example-snippet bd-code-snippet">
            <div class="bd-example">
               <table class="table table-striped">
                  <thead>
                     <tr>
                        <th scope="col">이미지</th>
                        <th scope="col">상품코드</th>
                        <th scope="col">상품명</th>
                        <th scope="col">상품가격</th>
                        <th scope="col">상품설명</th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:forEach items="${productList}" var="product">
                        <tr>
                           <td><a href="/admin/product/${curPage}/${product.pro_code}">
                                 <img alt="${product.pro_desc }"
                                 src="${path}/resources/images/product/${product.pro_image}"
                                 style="width: 100px; height: 100px;" title="${product.pro_name}">
                           </a></td>
                           <td>${product.pro_code }</td>
                          
                         
                           <td><a href="/admin/product/${curPage}/${product.pro_code}">${product.pro_name }</a></td>
                          
                           <td>${product.pro_price }</td>
                           <td>${product.pro_desc }</td>
                        </tr>
                     </c:forEach>
                  </tbody>
               </table>
               <div class="row mt-5">
                  <div class="col text-center">
                     <div class="block-27">
                        <!-- 각 번호 페이지 버튼 -->
                        <table>
                           <tr>
                              <!-- 이전페이지 버튼 -->
                              <c:if test="${pageMaker.prev}">
                                 <ul>
                                    <li class="pageInfo_btn previous" id="abc">
<%--                                        <a href="javascript:acyncMovePage('/admin/products/${pageMaker.startPage-1}');">&lt;</a> --%>
                                       <a href="/admin/products/${pageMaker.startPage-1}">&lt;</a>
                                    </li>
                                 </ul>
                              </c:if>
                              <c:forEach var="num" begin="${pageMaker.startPage}"
                                 end="${pageMaker.endPage}">
                                 <ul style="text-align: center;" id="abc">
<%--                                     <li class="pageInfo_btn"><a href="javascript:acyncMovePage('/admin/products?pageNum=${num}');">${num}</a></li> --%>
                                    <li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="/admin/products/${num}">${num}</a></li>
                                 </ul>
                              </c:forEach>
                              <!-- 다음페이지 버튼 -->
                              <c:if test="${pageMaker.next}">
                                 <ul>
                                    <li class="pageInfo_btn next" id="abc">
<%--                                        <a href="javascript:acyncMovePage('/admin/products/${pageMaker.endPage + 1 }');">&gt;</a> --%>
                                       <a href="/admin/products/${pageMaker.endPage + 1 }">&gt;</a>
                                    </li>
                                 </ul>
                              </c:if>
                           </tr>
                        </table>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="row mt-5">
            <div class="col text-center">
               <div class="block-27"></div>
            </div>
         </div>
      </div>
   </div>
   <jsp:include page="/common/admin_ft.jsp"></jsp:include>
</div>

<script>
   function acyncMovePage(url) {
      // ajax option
      var ajaxOption = {
         url : url,
         async : true,
         type : "POST",
         dataType : "html",
         cache : false
      };

      $.ajax(ajaxOption).done(function(data) {
         // Contents 영역 삭제
         $('#test').children().remove();
         // Contents 영역 교체
         $('#test').html(data);
      });
   }
</script>