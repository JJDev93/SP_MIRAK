<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.2/css/jquery.dataTables.css">
<script type="text/javascript" src="https://cdn.datatables.net/1.11.2/js/jquery.dataTables.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<style>
li {
      float:left;
      margin-right:10px;
   }

.detail-row .hidden-row {
	display: none;
}

.thead-custom {
	color: #fff;
	background-color: #6c757d;
	border-color: #6c757d;
}

tr .tr-custom {
	background-color: #000;
}

.table-hover tbody .detail-row:nth-child(even):hover {
	background-color: initial;
}

</style>
<jsp:include page="/common/admin_hd.jsp"></jsp:include>
<div class="ftco-section">
	<div class="container-fluid">
	<div class="justify-content-center mb-3 pb-3">
		<div class="heading-section text-center">
			<h2>결제관리</h2>
			<p>결제관리 리스트 페이지 입니다.</p>
		</div>
	</div>
		<div class="bd-example-snippet bd-code-snippet">
			<div class="bd-example">
				<table
					class="table table-striped table-hover table-bordered table-sm">
					<thead class="thead-custom">
						<tr>
							<th scope="col">주문번호</th>
							<th scope="col">상품명</th>
							<th scope="col">총 가격</th>
							<th scope="col">주문자이름</th>
							<th scope="col">전화번호</th>
							<th scope="col">배송지주소</th>
							<th scope="col">결제일</th>
							<th scope="col">주문상태</th>
							<th scope="col">결제취소</th>
							<th scope="col">상세정보</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="payList" items="${payList}">
							<tr class="tr-custom">
								<td>${payList.group_id}</td>
								<td><c:choose>
										<c:when test="${payList.cart_cnt == 1}">
                        ${payList.pro_name}
                    </c:when>
										<c:otherwise>
                        ${payList.pro_name}외 ${payList.cart_cnt-1}종
                    </c:otherwise>
									</c:choose></td>
								<td>${payList.totalPrice}</td>
								<td>${payList.mem_name}</td>
								<td>${payList.mem_phone}</td>
								<td>${payList.mem_add1} ${payList.mem_add2}</td>
								<td>${payList.pay_date}</td>
								<td id="statusTd_${payList.group_id}">${payList.status}</td>
								<td>
								<c:choose>
 								 <c:when test="${payList.status == '결제 완료'}">
    								<button id="statusBtn_${payList.group_id}" class="btn btn-secondary" type="button" onclick="updateStatus(${payList.group_id})">결제취소</button>
  								</c:when>
  								<c:when test="${payList.status == '주문 완료' || payList.status == '결제 취소' || payList.status == '구매 확정'}">
    								<button id="statusBtn_${payList.group_id}" class="btn btn-secondary" type="button" disabled>X</button>
  								</c:when>
								</c:choose>
								</td>
								<td>
									<div class="accordion">
										<button class="detail_btn btn btn-secondary" type="button"
											data-toggle="collapse"
											data-target="#collapse-${payList.group_id}"
											aria-expanded="false"
											aria-controls="collapse-${payList.group_id}"
											data-group_id="${payList.group_id}">
											상세보기<i class='fas fa-angle-down'></i>
										</button>
									</div>
								</td>
							</tr>
							<tr class="detail-row">
								<td class="detail-col" style="padding: 2px;" colspan="10">
									<div class="collapse" id="collapse-${payList.group_id}">
										<div class="table-responsive"
											style="float: right;">
											<table class="table table-hover table-striped table-bordered table-sm">
												<thead class="thead-custom">
													<tr>
														<th>카테고리</th>
														<th style="width:200px;">상품명</th>
														<th style="width:100px;">수량</th>
														<th style="width:100px;">가격</th>
														<th style="width:330px;">희망요일</th>
														<th style="width:150px;">배송시작일</th>
														<th>요청사항</th>
														<th style="width:120px;">주문상태</th>
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
				<div class="row mt-5">
                  <div class="col text-center">
                     <div class="block-27">
                        <table>
                           <tr>
                              <!-- 이전페이지 버튼 -->
                              <c:if test="${pageMaker.prev}">
                                 <ul>
                                    <li class="pageInfo_btn previous">
                                       <a href="'/admin/pays/${pageMaker.startPage-1}'">&lt;</a>
                                    </li>
                                 </ul>
                              </c:if>
                              <c:forEach var="num" begin="${pageMaker.startPage}"
                                 end="${pageMaker.endPage}">
                                 <ul style="text-align: center;">
                                    <li class="pageInfo_btn"><a href="/admin/pays/${num}">${num}</a></li>
                                 </ul>
                              </c:forEach>
                              <!-- 다음페이지 버튼 -->
                              <c:if test="${pageMaker.next}">
                                 <ul>
                                    <li class="pageInfo_btn next">
                                       <a href="'/admin/pays/${pageMaker.endPage + 1 }'">&gt;</a>
                                    </li>
                                 </ul>
                              </c:if>
                           </tr>
                        </table>
                     </div>
                  </div>
               </div>
			</div>
	</div>
</div>

<jsp:include page="/common/admin_ft.jsp"></jsp:include>
</div>
<script>
$(document).on("click", ".detail_btn", function () {
    var open_collapse = $(".collapse.show");
    if (open_collapse.length > 0) {
      open_collapse.each(function () {
        $(this).collapse("hide");
      });
    }

    var group_id = $(this).data("group_id");
    var tbody = $("#accordianBody-" + group_id);
    var detail_btn = $('.detail_btn[data-group_id="' + group_id + '"]');

    $.ajax({
      url: "/admin/payment/" + group_id,
      method: "GET",
      success: function (data) {
        detailTable(data, group_id);
      },
      error: function () {
        alert("데이터를 가져올 수 없습니다.");
      },
    });
  });

function detailTable(data, group_id) {
    var tbody = $("#accordianBody-" + group_id);
    tbody.empty();	  
    var productList = JSON.parse('${productList}');
    data.forEach(function (item) {
    	  var cate = $("<select>").addClass("form-control").css({"max-width":"250px", "height":"40px", "text-align":"center", "font-size":"14px"});
    	  var keys = Object.keys(productList);

    	  keys.forEach(function(key) {
    	    var option = $("<option>").val(key).text(key);
    	    cate.append(option);
    	  });
    	  if (item.pro_code.substr(0, 1) === 'P') {
    	    cate.val('프리미엄');
    	  } else if (item.pro_code.substr(0, 1) === 'O') {
    	    cate.val('1인세트');
    	  } else {
    	    cate.val('2·3인세트');
    	  }
    	  cate.on("change", function() {
    	    var selectCate = $(this).val();
    	    var productListByCate = productList[selectCate];
    	    var pro_name = $("<select>").addClass("form-control").css({"max-width":"250px", "height":"40px", "text-align":"center", "font-size":"14px"});
    	    productListByCate.forEach(function(product) {
    	      var option = $("<option>").val(product.pro_name).text(product.pro_name);
    	      pro_name.append(option);
    	    });
    	    pro_name.on("change", function() {
    	      var selectName = pro_name.val();
    	      var selectProduct = productList[selectCate].find(function(product) {
    	        return product.pro_name === selectName;
    	      });
    	      var selectPrice = selectProduct.pro_price;

    	      console.log("가격은~~" + selectPrice);
    	      console.log("개수는~~" + item.cart_cnt);

    	      var totalPrice = item.cart_cnt * selectPrice;

    	      var totalPriceElement = $(this).closest("tr").find(".total-price");
    	      totalPriceElement.text(totalPrice.toLocaleString() + "원");
    	    });
    	  });
    	
        var cart_cnt = $("<input>").addClass("form-control").attr({
            "type": "number",
            "min": "0",
            "max": "99",
            "step": "1",
            "value": item.cart_cnt
          }).css({"text-align":"center","padding-left":"20px"});

      var cart_day = $("<div>").addClass("cart_day");
      
      var days = ["월", "화", "수", "목", "금", "토", "일"];
      for (var i = 0; i < days.length; i++) {
        var isChecked = item.cart_day.includes(days[i]);
        var input = $("<input>").attr({
          "type": "checkbox",
          "name": "cart_day",
          "id": days[i],
          "value": days[i],
          "class": "form-check-input",
        }).css({"margin-left":"-0.8rem","text-align":"center"}).prop("checked", isChecked);
        var label = $("<label>").attr({
          "for": days[i],
          "class": "form-check-label",
        }).text(days[i]);
        var div = $("<div>").addClass("form-check").css({"display":"inline-block"}).append(input).append(label);
        cart_day.append(div);
      }
      
      var dateString = new Date(item.cart_start).toISOString().slice(0,10);
      var cart_start = $("<input>").attr({
          "type": "text",
          "name": "cart_start",
          "class": "form-control input-number",
          "readonly": true,
      }).val(dateString).datepicker({dateFormat: "yy-mm-dd"}).css({"text-align":"center"});
      
      var pay_req =  $("<input>").attr({
          "type": "text",
          "name": "pay_req",
          "class": "form-control input-number",
      }).val(item.pay_code);
      
      var pay_code = item.pay_code;
      
      tbody.append(
        $("<tr>").append(
          $("<td>").css("height", "40px").attr("class", "changeUpdate").attr("id", "cate_" + pay_code).attr("name", "cate").append(cate),
          $("<td>").css("height", "40px").attr("class", "changeUpdate").attr("id", "pro_name_" + pay_code).attr("name", "pro_name").append(pro_name),
          $("<td>").css("height", "40px").attr("class", "changeUpdate").attr("id", "cart_cnt_" + pay_code).attr("name", "cart_cnt").append(cart_cnt),
          $("<td>").css("height", "40px").attr("class", "changeUpdate").attr("id", "totalPrice_" + pay_code).attr("name", "totalPrice").text(totalPrice),
          $("<td>").css("height", "40px").attr("class", "changeUpdate").attr("id", "cart_day_" + pay_code).attr("name", "cart_day").append(cart_day),
          $("<td>").css("height", "40px").attr("class", "changeUpdate").attr("id", "cart_start_" + pay_code).attr("name", "cart_start").append(cart_start),
          $("<td>").css("height", "40px").attr("class", "changeUpdate").attr("id", "pay_req_" + pay_code).attr("name", "pay_req").append(pay_req),
          $("<td>").css("height", "40px").attr("class", "changeUpdate").attr("id", "status_" + pay_code).attr("name", "status").text(item.status)
        )
      );
	});
    };

  $(".collapse").on("hidden.bs.collapse", function () {
    var group_id = $(this).attr("id").split("-")[1];
    var detailBtn = $('.detail_btn[data-group_id="' + group_id + '"]');
    detailBtn.html("상세보기<i class='fas fa-angle-down'></i>");
  });

  $(".collapse").on("shown.bs.collapse", function () {
    var group_id = $(this).attr("id").split("-")[1];
    var detailBtn = $('.detail_btn[data-group_id="' + group_id + '"]');
    detailBtn.html("닫기<i class='fas fa-angle-up'></i>");
  });
</script>
