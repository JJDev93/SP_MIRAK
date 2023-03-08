<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/common/admin_hd.jsp"></jsp:include>
<div class="ftco-section">
	<div class="container">
		<div class="justify-content-center mb-3 pb-3">
			<div class="heading-section text-center">
				<h2>상품목록</h2>
				<p>상품 목록 페이지 입니다.</p>
			</div>
		</div>
		<a href="ProductAdminRegister" class="btn btn-primary mb-4">상품 추가</a>

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
								<td><a
									href="ProductAdminDetail?pro_code=${product.pro_code}"> <img
										alt="1"
										src="${path}/resources/images/product/${product.pro_image}"
										style="width: 100px; height: 100px;"></a></td>
								<td>${product.pro_code }</td>
								<td><a
									href="ProductAdminDetail?pro_code=${product.pro_code}">${product.pro_name }</a></td>

								<td>${product.pro_price }</td>
								<td>${product.pro_desc }</td>



							</tr>
						</c:forEach>

					</tbody>
				</table>
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