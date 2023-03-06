<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="./common/client_hd.jsp"></jsp:include>

	<div class="hero-wrap hero-bread"
		style="background-image: url('${path}/resources/images/bg_1.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home</a></span> <span>Checkout</span>
					</p>
					<h1 class="mb-0 bread">Checkout</h1>
				</div>
			</div>
		</div>
	</div>
	
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-7 ftco-animate">
					<form action="#" class="billing-form">
						<h3 class="mb-4 billing-heading">회원가입</h3>
						<div class="row align-items-end">
							<div class="col-md-6">
								<div class="form-group">
									<label for="firstname">Firt Name</label> <input type="text"
										class="form-control" placeholder="">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="lastname">Last Name</label> <input type="text"
										class="form-control" placeholder="">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group">
									<label for="country">State / Country</label>
									<div class="select-wrap">
										<div class="icon">
											<span class="ion-ios-arrow-down"></span>
										</div>
										<select name="" id="" class="form-control">
											<option value="">France</option>
											<option value="">Italy</option>
											<option value="">Philippines</option>
											<option value="">South Korea</option>
											<option value="">Hongkong</option>
											<option value="">Japan</option>
										</select>
									</div>
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="streetaddress">Street Address</label> <input
										type="text" class="form-control"
										placeholder="House number and street name">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<input type="text" class="form-control"
										placeholder="Appartment, suite, unit etc: (optional)">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="towncity">Town / City</label> <input type="text"
										class="form-control" placeholder="">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="postcodezip">Postcode / ZIP *</label> <input
										type="text" class="form-control" placeholder="">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="phone">Phone</label> <input type="text"
										class="form-control" placeholder="">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="emailaddress">Email Address</label> <input
										type="text" class="form-control" placeholder="">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group mt-4">
									<div class="radio">
										<label class="mr-3"><input type="radio" name="optradio">
											Create an Account? </label> <label><input type="radio"
											name="optradio"> Ship to different address</label>
									</div>
								</div>
							</div>
						</div>
					</form>
					<!-- END -->
				</div>

				<!-- .col-md-8 -->
			</div>
		</div>
	</section>
	<!-- .section -->
	
	<jsp:include page="./common/client_ft.jsp"></jsp:include>
	
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
	<script src="${path}/resources/js/main.js"></script>
</body>
</html>
