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
										class="btn btn-primary mb-12" data-group-id="${pay.group_id}">상세▼</button>
									<div class="accordion" id="accordion-${payList.group_id}"></div>
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
	$(document).on("click", "#adminPayListDetail", function() {
	    var groupId = $(this).data("group-id");
	    var accordionId = "accordion-" + groupId;
	    var accordionContainer = $("<div>", {class: "accordion", id: accordionId});
	    
	    $.ajax({
	        url: "/admin/pays/" + groupId,
	        type: "GET",
	        dataType: "json",
	        success: function(data) {
	            $.each(data, function(index, pay) {
	                var cardId = "card-" + pay.id;
	                var cardHeader = $("<div>", {class: "card-header", id: cardId + "-heading"});
	                var cardTitle = $("<h5>", {class: "mb-0"});
	                var cardButton = $("<button>", {class: "btn btn-link", "data-toggle": "collapse", "data-target": "#" + cardId, "aria-expanded": "false", "aria-controls": cardId});
	                var cardBody = $("<div>", {class: "collapse", id: cardId, "aria-labelledby": cardId + "-heading", "data-parent": "#" + accordionId});
	                var cardContent = $("<div>", {class: "card-body"});
	                
	                cardButton.append(pay.pro_name);
	                cardTitle.append(cardButton);
	                cardHeader.append(cardTitle);
	                
	                cardContent.append("도시락 개수: " + pay.cart_cnt);
	                cardContent.append("<br>");
	                cardContent.append("가격: " + pay.totalPrice);
	                cardBody.append(cardContent);
	                
	                accordionContainer.append($("<div>", {class: "card"}).append(cardHeader, cardBody));
	            });
	            
	            $("#accordion-container").html(accordionContainer);
	            $("#" + accordionId).accordion();
	        },
	        error: function(jqXHR, textStatus, errorThrown) {
	            console.log(textStatus, errorThrown);
	        }
	    });
	});
</script>

<jsp:include page="/common/admin_ft.jsp"></jsp:include>