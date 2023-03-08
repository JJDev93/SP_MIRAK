<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="client_hd.jsp"></jsp:include>
<div class="hero-wrap hero-bread"
	style="background-image: url('${path}/resources/images/bg_1.jpg');">
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="index.html">Home</a></span> <span>Products</span>
				</p>
				<h1 class="mb-0 bread">Products</h1>
			</div>
		</div>
	</div>
</div>


<section class="ftco-section">

	<div class="container">


		<div class="row">
					<c:forEach items="${productList}" var="product">
						<div class="col-md-6 col-lg-4 ftco-animate">
							<div class="product">
									<a href="ProductClientDetail?pro_code=${product.pro_code}"
										class="img-prod"> <img alt="1"
										src="${path}/resources/images/product/${product.pro_image}" style="width:350px; height:250px;">
									</a>
									<div class="text py-3 pb-4 px-3 text-center">
										<h3>
											<a href="ProductClientDetail?pro_code=${product.pro_code}">${product.pro_name}</a>
										</h3>
				
				
									</div>
							</div>
				
						</div>
					</c:forEach>
		</div>



	</div>


</section>


<jsp:include page="client_ft.jsp"></jsp:include>



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