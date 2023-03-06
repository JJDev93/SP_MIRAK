<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/common/client_hd.jsp"></jsp:include>
    <section class="ftco-section contact-section" action="login" method="post">
    
      <div class="container">
        <div class="row block-9">
          <div class="col-md-6 order-md-last d-flex" >
            <form action="login" method="post" class="bg-white p-5 contact-form">
              <div class="form-group">
                <input type="text" class="form-control" name="memid" placeholder="이메일(ID)">
              </div>
              <div class="form-group"> 
                <input type="text" class="form-control" name="mempw" placeholder="비밀번호">
              </div>
              <div class="form-group">
                <input type="submit" value="로그인" class="btn btn-primary py-3 px-5">
              </div>
            </form>
          
          </div>
        </div>
      </div>
      
      <div class="container">
			<div class="row no-gutters ftco-services">
				<div
					class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services mb-md-0 mb-4">
						<div
							class="icon bg-color-1 active d-flex justify-content-center align-items-center mb-2">
							<span class="flaticon-shipped"></span>
						</div>
						<div class="media-body">
							<h3 class="heading">Kakao</h3>
						</div>
					</div>
				</div>
				<div
					class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services mb-md-0 mb-4">
						<div
							class="icon bg-color-2 d-flex justify-content-center align-items-center mb-2">
							<span class="flaticon-diet"></span>
						</div>
						<div class="media-body">
							<h3 class="heading">Naver</h3>
						</div>
					</div>
				</div>
				<div
					class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services mb-md-0 mb-4">
						<div
							class="icon bg-color-3 d-flex justify-content-center align-items-center mb-2">
							<span class="flaticon-award"></span>
						</div>
						<div class="media-body">
							<h3 class="heading">Google</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
		
    </section>
	<jsp:include page="/common/client_ft.jsp"></jsp:include>
  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="${path}/resources/js/jquery.min.js"></script>
  <script src="${path}/resources/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${path}/resources/js/popper.min.js"></script>
  <script src="${path}/resources/js/bootstrap.min.js"></script>
  <script src="${path}/resources/js/jquery.easing.1.3.js"></script>
  <script src="${path}/resources/js/jquery.waypoints.min.js"></script>
  <script src="${path}/resources/js/jquery.stellar.min.js"></script>
  <script src="${path}/resources/js/owl.carousel.min.js"></script>
  <script src="${path}/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="${path}/resources/js/aos.js"></script>
  <script src="${path}/resources/js/jquery.animateNumber.min.js"></script>
  <script src="${path}/resources/js/bootstrap-datepicker.js"></script>
  <script src="${path}/resources/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${path}/resources/js/google-map.js"></script>
  <script src="${path}/resources/js/main.js"></script>
    
  </body>
</html>