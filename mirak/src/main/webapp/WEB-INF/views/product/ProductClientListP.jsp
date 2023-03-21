<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<div id="test">
	<c:set var="path" value="${pageContext.request.contextPath}" />
	<jsp:include page="/common/client_hd.jsp"></jsp:include>
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
							<a href="ProductClientDetail/${product.pro_code}"
								class="img-prod"> <img alt="${product.pro_desc}"
								src="${path}/resources/images/product/${product.pro_image}"
								style="width: 350px; height: 250px;" title="${product.pro_name}">
							</a>
							<div class="text py-3 pb-4 px-3 text-center">
								<h3>
									<a href="ProductClientDetail/${product.pro_code}">${product.pro_name}</a>
								</h3>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
			<div class="row mt-5"> -->
				<div class="col text-center">
					<div class="block-27">
						<ul>
							<!-- 이전페이지 버튼 -->
							<c:if test="${pageMaker.prev}">
								<li class="pageInfo_btn previous" id="abc"><a href="javascript:acyncMovePage('ProductClientListP?pageNum= ${pageMaker.startPage-1}');">&lt;</a></li>
							</c:if>
							<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
								<li class="pageInfo_btn" id="abc"><a href="javascript:acyncMovePage('/ProductClientListP?pageNum=${num}');">${num}</a></li>
							</c:forEach>
							<!-- 다음페이지 버튼 -->
							<c:if test="${pageMaker.next}">
								<li class="pageInfo_btn next" id="abc"><a href="javascript:acyncMovePage('ProductClientListP?pageNum=${pageMaker.endPage + 1 }');">&gt;</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="${path}/resources/js/product/product.js"></script>
	<jsp:include page="/common/client_ft.jsp"></jsp:include>
</div>
</body>
<script>
	function acyncMovePage(url){
	   // ajax option
	   var ajaxOption = {
	           url : url,
	           async : true,
	           type : "POST",
	           dataType : "html",
	           cache : false
	   };
	   
	   $.ajax(ajaxOption).done(function(data){
	       // Contents 영역 삭제
	       $('#test').children().remove();
	       // Contents 영역 교체
	       $('#test').html(data);
	   });
	}
</script>