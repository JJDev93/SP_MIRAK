<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/common/admin_hd.jsp"></jsp:include>
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
										<c:otherwise>${payList.pro_name}외 ${payList.cart_cnt-1}종</c:otherwise>
									</c:choose></td>
								<td>${payList.cart_cnt}</td>
								<td>${payList.totalPrice}</td>
								<td><button id="adminPayListDetail"
										class="btn btn-primary mb-12" data-group-id="${pay.group_id}">상세▼</button></td>
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
	$(document).on(
			"click",
			"#adminPayListDetail",
			function() {
				var groupId = $(this).data("group-id");

				$.ajax({
					type : "GET",
					url : "/adminPayments/" + groupId,
					success : function(data) {
						// 가져온 데이터를 아코디언의 body에 추가
						var accordionBody = $("#accordionBody");
						accordionBody.empty();

						$.each(data, function(i, item) {
							var row = "<tr><td>" + item.pay_code + "</td><td>"
									+ item.pro_name + "</td><td>"
									+ item.cart_cnt + "</td><td>"
									+ item.totalPrice + "</td></tr>";
							accordionBody.append(row);
						});

						// 아코디언 펼치기
						$("#accordion").collapse("show");
					},
					error : function() {
						alert("데이터를 가져오는 데 실패했습니다.");
					}
				});
			});
</script>
<jsp:include page="/common/admin_ft.jsp"></jsp:include>