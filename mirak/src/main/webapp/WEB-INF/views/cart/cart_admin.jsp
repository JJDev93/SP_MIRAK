<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<jsp:include page="/common/admin_hd.jsp"></jsp:include>
<div class="ftco-section admin-list">
	<div class="container">
		<div class="justify-content-center mb-3 pb-3">
			<div class="heading-section text-center">
				<h2>장바구니관리</h2>
				<p>장바구니 리스트 페이지 입니다.</p>
			</div>
		</div>
		<!-- <form action="#" class="p-5 bg-light mb-4">
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label for="name">Name *</label> <input type="text"
							class="form-control" id="name">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="email">Email *</label> <input type="email"
							class="form-control" id="email">
					</div>
				</div>
				<div class="col-md-12">
					<input type="submit" value="검색" class="btn btn-primary">
				</div>
			</div>
		</form> -->
		<div class="bd-example-snippet bd-code-snippet">
			<div class="bd-example">
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">이미지</th>
							<th scope="col">ID</th>
							<th scope="col">상품코드</th>
							<th scope="col">상품명</th>
							<th scope="col">가격</th>
							<th scope="col">배송시작일</th>
							<th scope="col">배송요일</th>
							<th scope="col">배송횟수</th>
							<th scope="col">총가격</th>
							<th scope="col">상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="c" items="${cartList }">	
						<tr>
							<td><a href="/admin/cart/${curPage}/${c.cart_code}">${c.cart_code }</a></td>
							<td>
								 <a href="/admin/cart/${curPage}/${c.cart_code}">
                                 <img alt="1" src="${path}/resources/images/product/${c.pro_image}" style="width: 70px;">
                                 </a>
                            </td>
							<td>
								<a href="/admin/member/${curPage}/${member.mem_code}">${c.mem_id }</a>
							</td>
							<td><a href="/admin/cart/${curPage}/${c.cart_code}">${c.pro_code }</a></td>
							<td><a href="/admin/cart/${curPage}/${c.cart_code}">${c.pro_name }</a></td>
							<td>${c.pro_price }</td>
							<td><fmt:formatDate pattern="yy-MM-dd" value="${c.cart_start}"/> </td>
							<td>${c.cart_day }</td>
							<td>${c.cart_cnt }</td>
							<td>${c.pro_price * c.cart_cnt }</td>
							<td>
								<c:if test="${c.cart_show == 0}">결제 완료</c:if>
								<c:if test="${c.cart_show == 1}">결제 전</c:if>
								<c:if test="${c.cart_show == 2}">삭제</c:if>
							</td>
						</tr>
						</c:forEach> 
					</tbody>
				</table>
			</div>
		</div>
			<div class="row mt-5">
            <div class="col text-center">
               <div class="block-27">
                  <ul>
                     <!-- 이전페이지 버튼 -->
                     <c:if test="${pageMaker.prev}">
                        <li class="pageInfo_btn next"><a href="/admin/carts/${pageMaker.startPage-1}">&lt;</a></li>
                     </c:if>
                     <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                        <li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="/admin/carts/${num}">${num}</a></li>
                     </c:forEach>
                     <!-- 다음페이지 버튼 -->
                     <c:if test="${pageMaker.next}">
                        <li class="pageInfo_btn next"><a href="/admin/carts/${pageMaker.endPage + 1 }">&gt;</a></li>
                     </c:if>
                  </ul>
               </div>
            </div>
         </div>
	</div>
</div>
<jsp:include page="/common/admin_ft.jsp"></jsp:include>