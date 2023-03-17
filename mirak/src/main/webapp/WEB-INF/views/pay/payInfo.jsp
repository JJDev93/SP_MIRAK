<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/common/client_hd.jsp"></jsp:include>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">



$(function(){
	

	
	$(".payCancel").click(function(){
		
		alert('asdf')
		
		
		// 카카오페이 결제 취소 전송
		$.ajax({
			type:"get"
			,url:"/pay/kakao/cancel"
			,data:{
				
				
			},
			success:function(response){
				
				
				location.href = response.next_redirect_pc_url			
			}
		})
	})
})


</script>



<div class="hero-wrap hero-bread"
	style="background-image: url('${path}/resources/images/bg_1.jpg');">
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="#">My Page</a></span> <span></span>
				</p>
				<h1 class="mb-0 bread">마이 페이지</h1>
			</div>
		</div>
	</div>
</div>
<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-10 ftco-animate">
				<div class="row mb-5">
					<ul class="nav nav-tabs w-100">
						<li class="nav-item"><a class="nav-link" href="/mypage">마이페이지</a></li>
						<li class="nav-item"><a class="nav-link" href="/cart">장바구니</a></li>
						<li class="nav-item"><a class="nav-link active"
							href="/payInfo">결제내역</a></li>
					</ul>
				</div>


				<section class="ftco-section ftco-degree-bg">
					<div class="container">
						<div class="row">
							<div class="col-lg-12 ftco-animate">
								<div class="row">
								
									<c:forEach items="${payVOList}" var="payVO">

									<div class="col-md-12 d-flex ftco-animate">
										<div class="blog-entry align-self-stretch d-md-flex">
<!-- 											<a href="blog-single.html" class="block-20"> </a> -->
											<div class="block-20"style="background-image: url(${path}/resources/images/product/${payVO.pro_image })"> ${payVO.pro_image }</div>
											<div class="text d-block pl-md-4">
												<div class="meta mb-3">
													<div>
														주문일 : ${payVO.pay_date}
													</div>
													
													
												</div>
												<h3 class="heading">
									 				<a href="#">${payVO.pro_name} </a>
												</h3>
												<p>Far far away, behind the word mountains, far from the
													countries Vokalia and Consonantia, there live the blind
													texts.</p>
												<p>
													<button href="" class="btn btn-primary py-2 px-3 payCancel" value="">주문취소</button>
												</p>
											</div>
										</div>
									</div>
									
									</c:forEach>

								</div>
							</div>
							<!-- .col-md-8 -->


						</div>
					</div>
				</section>

			</div>
		</div>
	</div>

</section>




<jsp:include page="/common/client_ft.jsp"></jsp:include>

</body>
</html>