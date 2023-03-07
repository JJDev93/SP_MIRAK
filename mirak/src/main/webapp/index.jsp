<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="./common/client_hd.jsp"></jsp:include>
	<!-- START 슬라이더 -->
	<section id="home-section" class="hero">
		<div class="home-slider owl-carousel">
			<div class="slider-item" style="background-image: url(${path}/resources/images/bg_1.jpg);">
				<div class="overlay"></div>
				<div class="container">
					<div class="row slider-text justify-content-center align-items-center"
						data-scrollax-parent="true">
						<div class="col-md-12 ftco-animate text-center">
							<h1 class="mb-2">We serve Fresh Vegestables &amp; Fruits</h1>
							<h2 class="subheading mb-4">We deliver organic vegetables &amp; fruits</h2>
							<p>
								<a href="#" class="btn btn-primary">View Details</a>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="slider-item" style="background-image: url(${path}/resources/images/bg_2.jpg);">
				<div class="overlay"></div>
				<div class="container">
					<div class="row slider-text justify-content-center align-items-center"
						data-scrollax-parent="true">
						<div class="col-sm-12 ftco-animate text-center">
							<h1 class="mb-2">100% Fresh &amp; Organic Foods</h1>
							<h2 class="subheading mb-4">We deliver organic vegetables &amp; fruits</h2>
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
							<span class="subheading">Featured Products</span>
							<h2 class="mb-4">Our Products</h2>
							<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="category-wrap ftco-animate img mb-4 d-flex align-items-end"
								style="background-image: url(${path}/resources/images/category-1.jpg);">
								<div class="text px-3 py-1">
									<h2 class="mb-0">
										<a href="#">Fruits</a>
									</h2>
								</div>
							</div>
							<div class="category-wrap ftco-animate img mb-4 d-flex align-items-end"
								style="background-image: url(${path}/resources/images/category-2.jpg);">
								<div class="text px-3 py-1">
									<h2 class="mb-0">
										<a href="#">Vegetables</a>
									</h2>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="category-wrap ftco-animate img mb-4 d-flex align-items-end"
								style="background-image: url(${path}/resources/images/category-3.jpg);">
								<div class="text px-3 py-1">
									<h2 class="mb-0">
										<a href="#">Juices</a>
									</h2>
								</div>
							</div>
							<div class="category-wrap ftco-animate img d-flex align-items-end"
								style="background-image: url(${path}/resources/images/category-4.jpg);">
								<div class="text px-3 py-1">
									<h2 class="mb-0">
										<a href="#">Dried</a>
									</h2>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
			<div class="col-md-6">
				<section class="ftco-section">
					<div class="justify-content-center mb-3 pb-3">
						<div class="heading-section text-center ftco-animate">
							<span class="subheading">Featured Products</span>
							<h2 class="mb-4">Our Products</h2>
							<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 ftco-animate">
							<div class="product">
								<a href="#" class="img-prod"><img class="img-fluid"
									src="${path}/resources/images/product-1.jpg"
									alt="Colorlib Template"> <span class="status">30%</span>
									<div class="overlay"></div> </a>
								<div class="text py-3 pb-4 px-3 text-center">
									<h3>
										<a href="#">Bell Pepper</a>
									</h3>
									<div class="d-flex">
										<div class="pricing">
											<p class="price">
												<span class="mr-2 price-dc">$120.00</span><span class="price-sale">$80.00</span>
											</p>
										</div>
									</div>
									<div class="bottom-area d-flex px-3">
										<div class="m-auto d-flex">
											<a href="#"
												class="add-to-cart d-flex justify-content-center align-items-center text-center">
												<span><i class="ion-ios-menu"></i></span>
											</a> <a href="#"
												class="buy-now d-flex justify-content-center align-items-center mx-1">
												<span><i class="ion-ios-cart"></i></span>
											</a> <a href="#"
												class="heart d-flex justify-content-center align-items-center ">
												<span><i class="ion-ios-heart"></i></span>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 ftco-animate">
							<div class="product">
								<a href="#" class="img-prod"><img class="img-fluid"
									src="${path}/resources/images/product-2.jpg"
									alt="Colorlib ${path}/resources/images/e">
									<div class="overlay"></div> </a>
								<div class="text py-3 pb-4 px-3 text-center">
									<h3>
										<a href="#">Strawberry</a>
									</h3>
									<div class="d-flex">
										<div class="pricing">
											<p class="price">
												<span>$120.00</span>
											</p>
										</div>
									</div>
									<div class="bottom-area d-flex px-3">
										<div class="m-auto d-flex">
											<a href="#"
												class="add-to-cart d-flex justify-content-center align-items-center text-center">
												<span><i class="ion-ios-menu"></i></span>
											</a> <a href="#"
												class="buy-now d-flex justify-content-center align-items-center mx-1">
												<span><i class="ion-ios-cart"></i></span>
											</a> <a href="#"
												class="heart d-flex justify-content-center align-items-center ">
												<span><i class="ion-ios-heart"></i></span>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 ftco-animate">
							<div class="product">
								<a href="#" class="img-prod"><img class="img-fluid"
									src="${path}/resources/images/product-3.jpg"
									alt="Colorlib Template">
									<div class="overlay"></div> </a>
								<div class="text py-3 pb-4 px-3 text-center">
									<h3>
										<a href="#">Green Beans</a>
									</h3>
									<div class="d-flex">
										<div class="pricing">
											<p class="price">
												<span>$120.00</span>
											</p>
										</div>
									</div>
									<div class="bottom-area d-flex px-3">
										<div class="m-auto d-flex">
											<a href="#"
												class="add-to-cart d-flex justify-content-center align-items-center text-center">
												<span><i class="ion-ios-menu"></i></span>
											</a> <a href="#"
												class="buy-now d-flex justify-content-center align-items-center mx-1">
												<span><i class="ion-ios-cart"></i></span>
											</a> <a href="#"
												class="heart d-flex justify-content-center align-items-center ">
												<span><i class="ion-ios-heart"></i></span>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 ftco-animate">
							<div class="product">
								<a href="#" class="img-prod"><img class="img-fluid"
									src="${path}/resources/images/product-4.jpg"
									alt="Colorlib Template">
									<div class="overlay"></div> </a>
								<div class="text py-3 pb-4 px-3 text-center">
									<h3>
										<a href="#">Purple Cabbage</a>
									</h3>
									<div class="d-flex">
										<div class="pricing">
											<p class="price">
												<span>$120.00</span>
											</p>
										</div>
									</div>
									<div class="bottom-area d-flex px-3">
										<div class="m-auto d-flex">
											<a href="#"
												class="add-to-cart d-flex justify-content-center align-items-center text-center">
												<span><i class="ion-ios-menu"></i></span>
											</a> <a href="#"
												class="buy-now d-flex justify-content-center align-items-center mx-1">
												<span><i class="ion-ios-cart"></i></span>
											</a> <a href="#"
												class="heart d-flex justify-content-center align-items-center ">
												<span><i class="ion-ios-heart"></i></span>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>	
	<!-- END 공지, 추천 -->

	<jsp:include page="./common/client_ft.jsp"></jsp:include>
	
</body>
</html>
<script src="${path}/resources/js/main.js"></script>
	