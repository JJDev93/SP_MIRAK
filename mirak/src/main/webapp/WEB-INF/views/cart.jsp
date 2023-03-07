<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="../../common/client_hd.jsp"></jsp:include>
<div class="hero-wrap hero-bread" style="background-image: url('${path}/resources/images/bg_1.jpg');">
	<div class="container">
		<div class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="index.html">Home</a></span> <span>Cart</span>
				</p>
				<h1 class="mb-0 bread">My Cart</h1>
			</div>
		</div>
	</div>
</div>

<section class="ftco-section ftco-cart">
	<div class="container">
		<div class="row">
			<div class="col-md-12 ftco-animate">
				<div class="cart-list">
					<table class="table">
						<thead class="thead-primary">
							<tr class="text-center">
								<th>선택</th>
								<th>이미지</th>
								<th>상품명</th>
								<th>가격</th>
								<th>요일선택</th>
								<th>배송횟수</th>
								<th>총가격</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="c" items="${cartList }">
							<tr class="text-center">
								<td class="product-remove"><input type="checkbox" checked></td>
								<td class="image-prod"><div class="img" style="background-image: url(${path}/resources/images/product-4.jpg);"></div></td>
								<td class="product-name">
									<h3>${c.name }</h3>
									<p>도시락 상품 설명입니다</p>
								</td>
								<td>${c.price }</td>
								<td>${c.day }</td>
								<td>${c.count }</td>
								<td>${c.price * c.count }</td>
							</tr>
							</c:forEach>
							
							
							<!-- END TR-->
						</tbody>
					</table>
				</div>
			</div>
		</div>
			<div class="col-lg-4 mt-5 cart-wrap ftco-animate">
				<div class="cart-total mb-3">
					<h3>Cart Totals</h3>
					<p class="d-flex">
						<span>상품갯수</span> <span>3개</span>
					</p>
					<p class="d-flex">
						<span>상품합계</span> <span>1000원</span>
					</p>
					<p class="d-flex">
						<span>배송비</span> <span>무료</span>
					</p>
					<hr>
					<p class="d-flex total-price">
						<span>총 결제금액</span> <span>10000000원</span>
					</p>
				</div>
				<p>
					<a href="checkout.html" class="btn btn-primary py-3 px-4">Proceed to Checkout</a>
				</p>
			</div>
		</div>
	</div>
</section>

<jsp:include page="../../common/client_ft.jsp"></jsp:include>

<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
	<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
			stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
			stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
		</svg>
</div>

<script src="${path}/resources/js/jquery.min.js"></script>
<script src="${path}/resources/js/jquery-migrate-3.0.1.min.js"></script>
<script src="${path}/resources/js/bootstrap.min.js"></script>
<script src="${path}/resources/js/jquery.easing.1.3.js"></script>
<script src="${path}/resources/js/jquery.waypoints.min.js"></script>
<script src="${path}/resources/js/jquery.stellar.min.js"></script>
<script src="${path}/resources/js/owl.carousel.min.js"></script>
<script src="${path}/resources/js/jquery.magnific-popup.min.js"></script>
<script src="${path}/resources/js/aos.js"></script>
<script src="${path}/resources/js/jquery.animateNumber.min.js"></script>
<script src="${path}/resources/js/scrollax.min.js"></script>
</body>
</html>
<script src="${path}/resources/js/main.js"></script>

