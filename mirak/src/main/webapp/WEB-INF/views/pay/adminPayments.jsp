<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/common/admin_hd.jsp"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<style>
.detail-row .hidden-row {
	display: none;
}
</style>
<h3>관리자 결제내역 리스트</h3>
<div class="ftco-section">
	<div class="container-fluid">
		<div class="bd-example-snippet bd-code-snippet">
			<div class="bd-example">
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">주문번호</th>
							<th scope="col">상품명</th>
							<th scope="col">도시락 총개수</th>
							<th scope="col">가격</th>
							<th scope="col">주문자이름</th>
							<th scope="col">전화번호</th>
							<th scope="col">요청사항</th>
							<th scope="col">결제일</th>
							<th scope="col">주문상태</th>
							<th scope="col">상세정보</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="payList" items="${payList}">
							<tr>
								<td>${payList.group_id}</td>
								<td><c:choose>
										<c:when test="${payList.cart_cnt == 1}">
                        ${payList.pro_name}
                    </c:when>
										<c:otherwise>
                        ${payList.pro_name}외 ${payList.cart_cnt-1}종
                    </c:otherwise>
									</c:choose></td>
								<td>${payList.cart_cnt}</td>
								<td>${payList.totalPrice}</td>
								<td>${payList.mem_name}</td>
								<td>${payList.mem_phone}</td>
								<td>${payList.pay_req}</td>
								<td>${payList.pay_date}</td>
								<td>${payList.status}</td>
								<td>
									<div class="accordion">
										<button class="btn btn-dark" type="button"
											data-toggle="collapse"
											data-target="#collapse-${payList.group_id}"
											aria-expanded="false"
											aria-controls="collapse-${payList.group_id}"
											data-group_id="${payList.group_id}">상세보기▼</button>
									</div>
								</td>
							</tr>
							<tr class="detail-row">
								<td style="padding: 2px;" colspan="10">
									<div class="collapse" id="collapse-${payList.group_id}">
										<div class="table-responsive">
											<table class="table table-hover table-striped">
												<thead>
													<tr>
														<th>상품명</th>
														<th>수량</th>
														<th>가격</th>
														<th>희망요일</th>
														<th>배송시작일</th>
														<th>주문상태</th>
													</tr>
												</thead>
												<tbody id="accordianBody-${payList.group_id}"></tbody>
											</table>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 		<div class="row mt-5"> -->
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
<!-- 	</div> -->
<!-- </div> -->
<script>
$(document).ready(function() {
	  $(document).on("click", ".btn-dark", function() {
	    var group_id = $(this).data("group_id");
	    var tbody = $("#accordianBody-" + group_id);
	    
	    // AJAX 요청을 보내고 테이블을 업데이트합니다.
	    $.ajax({
	      url: "/admin/pays/" + group_id,
	      method: "GET",
	      success: function(data) {
	        tbody.empty(); // tbody 내용 지우기
	        data.forEach(function(item) {
	        	console.log(data);
	          // 데이터를 행으로 변환하여 tbody에 추가합니다.
	          tbody.append("<tr>" +
	            "<td>" + item.pro_name + "</td>" +
	            "<td>" + item.cart_cnt + "</td>" +
	            "<td>" + item.totalPrice + "</td>" +
	            "<td>" + item.cart_day + "</td>" +
	            "<td>" + item.cart_start + "</td>" +
	            "<td>" + item.status + "</td>" +
	          "</tr>");
	          console.log("sdfsfsdfsd");
	        });
	      },
	      error: function() {
	        alert("데이터를 가져올 수 없습니다.");
	      }
	    });
	  });
	});
</script>

<jsp:include page="/common/admin_ft.jsp"></jsp:include>