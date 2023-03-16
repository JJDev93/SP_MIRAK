<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/common/client_hd.jsp"></jsp:include>
<!-- START 슬라이더 -->
<section id="home-section" class="hero">
	<div class="home-slider owl-carousel">
		<div class="slider-item"
			style="background-image: url(${path}/resources/images/bg_1.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text justify-content-center align-items-center"
					data-scrollax-parent="true">
					<div class="col-md-12 ftco-animate text-center">
						<h1 class="mb-2">We serve Fresh Vegestables &amp; Fruits</h1>
						<h2 class="subheading mb-4">We deliver organic vegetables
							&amp; fruits</h2>
						<p>
							<a href="#" class="btn btn-primary">View Details</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="slider-item"
			style="background-image: url(${path}/resources/images/bg_2.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text justify-content-center align-items-center"
					data-scrollax-parent="true">
					<div class="col-sm-12 ftco-animate text-center">
						<h1 class="mb-2">100% Fresh &amp; Organic Foods</h1>
						<h2 class="subheading mb-4">We deliver organic vegetables
							&amp; fruits</h2>
						<p>
							<a href="#" class="btn btn-primary">View Details</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- END 슬라이더 -->

<!-- START 공지, 추천 -->
<div class="container">
	<div class="row">
		<div class="col-md-6">
			<section class="ftco-section ftco-category">
				<div class="justify-content-center mb-3 pb-3">
					<div class="heading-section text-center ftco-animate">

						<h2 class="mb-4">인기상품</h2>

					</div>
				</div>
				<div class="row">
					<c:forEach items="${productList2}" var="product">
						<div class="col-md-6">
							<div class="category-wrap ftco-animate img mb-4 d-flex align-items-end">
							<a href="ProductClientDetail/${product.pro_code}"
								class="img-prod"> <img alt="1"
								src="${path}/resources/images/product/${product.pro_image}"
								style="width: 255px; height: 250px;">
							</a>
								
							</div>
								
								<h3 style="margin: 0 auto;">
									<a href="ProductClientDetail/${product.pro_code}">${product.pro_name}</a>
								</h3>
						</div>
						
					</c:forEach>

				</div>
			</section>
		</div>
		<div class="col-md-6">
			<section class="ftco-section ftco-category">
				<div class="justify-content-center mb-3 pb-3">
					<div class="heading-section text-center ftco-animate">

						<h2 class="mb-4">추천상품</h2>

					</div>
				</div>
				<div class="row">
					<c:forEach items="${productList1}" var="product">
						<div class="col-md-6">
							<div class="category-wrap ftco-animate img mb-4 d-flex align-items-end">
							<a href="ProductClientDetail/${product.pro_code}"
								class="img-prod"> <img alt="1"
								src="${path}/resources/images/product/${product.pro_image}"
								style="width: 255px; height: 250px;">
							</a>
		
							</div>
							<h3 style="margin: 0 auto;">
									<a href="ProductClientDetail/${product.pro_code}">${product.pro_name}</a>
								</h3>
								

						</div>
						
					</c:forEach>

				</div>
			</section>
		</div>
	</div>
</div>
<!-- END 공지, 추천 -->

<jsp:include page="/common/client_ft.jsp"></jsp:include>
</body>

</html>
