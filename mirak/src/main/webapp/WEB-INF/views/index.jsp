<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/common/client_hd.jsp"></jsp:include>
<style>
.product{
	border:none; 
	border-radius: 6px;
	box-shadow: 0 4px 20px 0 rgba(0, 0, 0, 0.05);
	background: white;
	margin-top: 20px;
	padding: 10px;
}

</style>
<!-- START 슬라이더 -->
<section id="home-section" class="hero">
	<div class="home-slider owl-carousel">
		<div class="slider-item" style="background-image: url(${path}/resources/images/bg_2.jpg);height:100%;">
			<div class="overlay"></div>
			<div class="container">
				<div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">
					<div class="col-md-12 ftco-animate text-center">
						<h1 class="mb-2">맛과 행복을 전하는 도시락 &nbsp; 미락(美樂)</h1>
						<h2 class="subheading mb-4">Lunch box that conveys taste and happiness &nbsp; MiRak</h2>
						<!-- <p>
							<a href="#" class="btn btn-primary">View Details</a>
						</p> -->
					</div>
				</div>
			</div>
		</div>

		<div class="slider-item" style="background-image: url(${path}/resources/images/bg_1.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">
					<div class="col-sm-12 ftco-animate text-center">
						<h1 class="mb-2">하루 한 끼! 점심대용식!&nbsp;다양한 종류로 맛있게!</h1>
						<h2 class="subheading mb-4">We deliver high-quality lunch boxes &amp; Freshly</h2>
						<!-- <p>
							<a href="#" class="btn btn-primary">View Details</a>
						</p> -->
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- START 공지, 추천 -->
<div class="container-fluid pt-5 ">
	<div class="row mb-5" style="">
		<div class="col-md-6">
			<section class="ftco-section ftco-category">
				<div class="justify-content-center mb-3 pb-1">
					<div class="heading-section text-center ftco-animate">
						<h2 class="mb-4">인기상품</h2>
					</div>
				</div>
				<div class="row" style="border-radius: 6px; background: #f6f9f6; padding:10px;">
					<c:forEach items="${productList2}" var="product">
						<div class="col-md-6 ftco-animate">
		    				<div class="product">
		    					<a href="ProductClientDetail/${product.pro_code}" class="img-prod" >
		    						<div class="imgDiv" style="width: 100%; height: 250px; background: url(${path}/resources/images/product/${product.pro_image}) no-repeat 50% 50%; background-size: contain;"></div>
		    					</a>
		    					<div class="text py-3 pb-4 px-3 text-center">
									<h3 class="text-center">
										<a href="ProductClientDetail/${product.pro_code}"  class="text_wrap">${product.pro_name}</a>
									</h3>
		    						<div class="d-flex">
		    							<div class="pricing">
				    						<p class="price"><span class="mr-2 price-dc"></span><span class="price-sale">${product.pro_price} 원</span></p>
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
				<div class="justify-content-center mb-3 pb-1">
					<div class="heading-section text-center ftco-animate">
						<h2 class="mb-4">추천상품</h2>
					</div>
				</div>
				<div class="row" style="border-radius: 6px; background: #f6f9f6; padding:10px;">
					<c:forEach items="${productList1}" var="product">						
						<div class="col-md-6 ftco-animate">
		    				<div class="product">
		    					<a href="ProductClientDetail/${product.pro_code}" class="img-prod">
		    						<div class="imgDiv" style="width: 100%; height: 250px; background: url(${path}/resources/images/product/${product.pro_image}) no-repeat 50% 50%; background-size: contain;"></div>
		    					</a>
		    					<div class="text py-3 pb-4 px-3 text-center">
									<h3 class="text-center">
										<a href="ProductClientDetail/${product.pro_code}" class="text_wrap">${product.pro_name}</a>
									</h3>
		    						<div class="d-flex">
		    							<div class="pricing">
				    						<p class="price"><span class="mr-2 price-dc"></span><span class="price-sale">${product.pro_price} 원</span></p>
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