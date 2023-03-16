<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/common/admin_hd.jsp"></jsp:include>
<div class="ftco-section">
	<div class="container">
		<div class="justify-content-center mb-3 pb-3">
			<div class="heading-section text-center">
				<h2>회원 장바구니 관리</h2>
				<p>회원 장바구니 리스트 페이지 입니다.</p>
			</div>
		</div>
		<form action="#" class="p-5 bg-light mb-4">
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
		</form>
		<div class="bd-example-snippet bd-code-snippet">
			<div class="bd-example">
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">상품명</th>
							<th scope="col">가격</th>
							<th scope="col">배송시작일</th>
							<th scope="col">배송요일</th>
							<th scope="col">배송횟수</th>
							<th scope="col">총가격</th>
							<th scope="col">결제여부</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="c" items="${cartList }">
						<tr>
							<th scope="row"><a href="/adminMembers/${c.mem_id}">${c.mem_id }</a></th>
							<td>${c.pro_name }</td>
							<td>${c.pro_price }</td>
							<td><fmt:formatDate pattern="yy-MM-dd" value="${c.cart_start}"/> </td>
							<td>${c.cart_day }</td>
							<td>${c.cart_cnt }</td>
							<td>${c.totalPrice }</td>
							<td>${c.cart_show }</td>
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
						<li><a href="#">&lt;</a></li>
						<li class="active"><span>1</span></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">&gt;</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/common/admin_ft.jsp"></jsp:include>