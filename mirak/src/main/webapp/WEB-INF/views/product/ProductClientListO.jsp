<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<div id="test">
	<c:set var="path" value="${pageContext.request.contextPath}" />
	<jsp:include page="/common/client_hd.jsp"></jsp:include>
	<div class="hero-wrap hero-bread"
		style="background-image: url('${path}/resources/images/bg_3.jpg'); ">

		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-0 bread">프리미엄</h1>
				</div>
			</div>
		</div>
	</div>
	
	<section class="ftco-section">
		<div class="container">
              <div class="tagcloud">
                <a href="/ProductClientList" class="tag-cloud-link">전체메뉴</a>&nbsp;&gt;&nbsp;
                <a href="/ProductClientListO" class="tag-cloud-link">1인세트</a>
              </div>
			<div class="row">
				<c:forEach items="${productList}" var="product">
					<div class="col-md-6 col-lg-4 ftco-animate">
	    				<div class="product">
	    					<a href="/ProductClientDetail/${product.pro_code}" class="img-prod" >
<%-- 	    						<div class="imgDiv" style="width: 100%; height: 250px; background: url(${path}/resources/images/product/${product.pro_image}) no-repeat 50% 50%; background-size: contain;"></div> --%>
<!-- 	    						<div class="imgDiv" style="width: 100%; height: 250px; no-repeat 50% 50%; background-size: contain;"> -->
	    						<img src="${path}/resources/images/product/${product.pro_image}" class="img-fluid" alt="${product.pro_desc2}" title="${product.pro_name}">
<!-- 	    						</div> -->
	    					</a>
	    					<div class="text py-3 pb-4 px-3 text-center">
								<h3 class="text-center">
									<a href="/ProductClientDetail/${product.pro_code}"  class="text_wrap">${product.pro_name}</a>
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
			
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
			
			<div class="row mt-5">
				<div class="col text-center">
					<div class="block-27">
						<ul>
							<!-- 이전페이지 버튼 -->
							<c:if test="${pageMaker.prev}">
<%-- 								<li class="pageInfo_btn previous" id="abc"><a href="javascript:acyncMovePage('ProductClientList?pageNum= ${pageMaker.startPage-1}');">&lt;</a></li> --%>
								<li class="pageInfo_btn previous" id="abc"><a href="ProductClientListO?pageNum= ${pageMaker.startPage-1}">&lt;</a></li>
							</c:if>
							<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
<%-- 								<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active" : "" }"" id="abc"><a href="javascript:acyncMovePage('/ProductClientList?pageNum=${num}');">${num}</a></li> --%>
								<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active" : "" }"" id="abc"><a href="/ProductClientListO?pageNum=${num}">${num}</a></li>
							</c:forEach>
							<!-- 다음페이지 버튼 -->
							<c:if test="${pageMaker.next}">
<%-- 								<li class="pageInfo_btn next" id="abc"><a href="javascript:acyncMovePage('ProductClientList?pageNum=${pageMaker.endPage + 1 }');">&gt;</a></li> --%>
								<li class="pageInfo_btn next" id="abc"><a href="ProductClientListO?pageNum=${pageMaker.endPage + 1 }">&gt;</a></li>
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