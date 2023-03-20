<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
#abc{
	float: left;
	margin-right: 10px;
}
</style>
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
								class="img-prod"> <img alt="1"
								src="${path}/resources/images/product/${product.pro_image}"
								style="width: 350px; height: 250px;">
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



		</div>
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">

		<!-- 	<div class="row mt-5"> -->
		<!-- 			<div class="col text-center"> -->
		<!-- 				<div class="block-27"> -->
		<!-- 					<ul> -->
		<!-- 						<li><a href="#">&lt;</a></li> -->
		<!-- 						<li class="active"><span>1</span></li> -->
		<!-- 						<li><a href="#">2</a></li> -->
		<!-- 						<li><a href="#">3</a></li> -->
		<!-- 						<li><a href="#">4</a></li> -->
		<!-- 						<li><a href="#">5</a></li> -->
		<!-- 						<li><a href="#">&gt;</a></li> -->
		<!-- 					</ul> -->
		<!-- 				</div> -->
		<!-- 			</div> -->
		<!-- 		</div> -->


		<div class="col text-center"
			style="margin: 0 auto; width: 700px; height: 100px;">
			<div class="block-27" style="text-align: center;">
				<div class="col text-center">
					<!-- 각 번호 페이지 버튼 -->
					<table>
						<tr>
							<!-- 이전페이지 버튼 -->
							<c:if test="${pageMaker.prev}">
								<ul>
									<li class="pageInfo_btn previous" id="abc"><a
										href="javascript:acyncMovePage('ProductClientListT?pageNum= ${pageMaker.startPage-1}');">&lt;</a></li>
								</ul>
							</c:if>
							<c:forEach var="num" begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}">

								<ul style="text-align: center;">

									<li class="pageInfo_btn" id="abc"><a
										href="javascript:acyncMovePage('/ProductClientListT?pageNum=${num}');">${num}</a></li>
								</ul>
							</c:forEach>
							<!-- 다음페이지 버튼 -->
							<c:if test="${pageMaker.next}">
								<ul>
									<li class="pageInfo_btn next" id="abc"><a
										href="javascript:acyncMovePage('ProductClientListT?pageNum=${pageMaker.endPage + 1 }');">&gt;</a></li>
								</ul>
							</c:if>
						</tr>
					</table>
				</div>
			</div>
		</div>


	</section>






	<script src="${path}/resources/js/product/product.js"></script>
	<jsp:include page="/common/client_ft.jsp"></jsp:include>
</div>
</body>
<script>
$(".pageInfo a").on("click", function(e){
	 
	 e.preventDefault();
     moveForm.find("input[name='pageNum']").val($(this).attr("href"));
     moveForm.attr("action", "/ProductClientList");
     moveForm.submit();
});



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
</html>