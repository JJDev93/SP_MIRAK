<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<style>
	h3 a{
		font-size:18px;
	}
</style>
<jsp:include page="/common/client_hd.jsp"></jsp:include>
<!-- START 슬라이더 -->
<section id="home-section" class="hero">
	<div class="home-slider owl-carousel">
		<div class="slider-item"
			style="background-image: url(${path}/resources/images/bg_1.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">
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
		<div class="slider-item"
			style="background-image: url(${path}/resources/images/bg_2.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">
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
						<h2 class="mb-4">인기상품</h2>
					</div>
				</div>
				<div class="row">
					<c:forEach items="${productList2}" var="product">
						<div class="col-md-6 ftco-animate">
		    				<div class="product">
		    					<a href="ProductClientDetail/${product.pro_code}" class="img-prod" style="width: 100%; height: 250px; background: url(${path}/resources/images/product/${product.pro_image}) no-repeat 50% 50%; background-size: contain;"> 
		    						<%-- <img alt="1" src="${path}/resources/images/product/${product.pro_image}" style="width: 350px; height: 250px;" title="${product.pro_name}"> --%>
		    						<!-- <span class="status">30%</span> -->
		    						<div class="overlay"></div>
		    					</a>
		    					<div class="text py-3 pb-4 px-3 text-center">
									<h3 class="text-center">
										<a href="ProductClientDetail/${product.pro_code}">${product.pro_name}</a>
									</h3>
		    						<div class="d-flex">
		    							<div class="pricing">
				    						<p class="price"><span class="mr-2 price-dc"></span><span class="price-sale">${product.pro_price} 원</span></p>
				    					</div>
			    					</div>
			    					<div class="bottom-area d-flex px-3">
			    						<div class="m-auto d-flex">
			    							<a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center">
			    								<span><i class="ion-ios-menu"></i></span>
			    							</a>
			    							<a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
			    								<span><i class="ion-ios-cart"></i></span>
			    							</a>
			    							<a href="#" class="heart d-flex justify-content-center align-items-center ">
			    								<span><i class="ion-ios-heart"></i></span>
			    							</a>
		    							</div>
		    						</div>
		    					</div>
		    				</div>
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
						<div class="col-md-6 ftco-animate">
		    				<div class="product">
		    					<a href="ProductClientDetail/${product.pro_code}" class="img-prod" style="width: 100%; height: 250px; background: url(${path}/resources/images/product/${product.pro_image}) no-repeat 50% 50%; background-size: contain;"> 
		    						<!-- <span class="status">30%</span> -->
		    						<div class="overlay"></div>
		    					</a>
		    					<div class="text py-3 pb-4 px-3 text-center">
									<h3 class="text-center">
										<a href="ProductClientDetail/${product.pro_code}">${product.pro_name}</a>
									</h3>
		    						<div class="d-flex">
		    							<div class="pricing">
				    						<p class="price"><span class="mr-2 price-dc"></span><span class="price-sale">${product.pro_price} 원</span></p>
				    					</div>
			    					</div>
			    					<div class="bottom-area d-flex px-3">
			    						<div class="m-auto d-flex">
			    							<a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center">
			    								<span><i class="ion-ios-menu"></i></span>
			    							</a>
			    							<a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
			    								<span><i class="ion-ios-cart"></i></span>
			    							</a>
			    							<a href="#" class="heart d-flex justify-content-center align-items-center ">
			    								<span><i class="ion-ios-heart"></i></span>
			    							</a>
		    							</div>
		    						</div>
		    					</div>
		    				</div>
		    			</div>
					</c:forEach>
				</div>
			</section>
		</div>
	</div>
</div>
<!-- END 공지, 추천 -->

<jsp:include page="/common/client_ft.jsp"></jsp:include>
<script>
	$(document).ready(function() {
		console.log("message : "+"${message}");
		console.log("mem_id : "+"${mem_id}");
		if("${message}" !=""){
			alert("${message}");
			 <%session.setAttribute("message","");%>
		}
	})
</script>