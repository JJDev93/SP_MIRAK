<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.2/css/jquery.dataTables.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
					class="table table-hover table-bordered">
					<thead>
						<tr>
							<th scope="col">주문번호</th>
							<th scope="col">주문내역</th>
							<th scope="col">가격</th>
							<th scope="col">이름</th>
							<th scope="col">연락처</th>
							<th scope="col">주소</th>
							<th scope="col">결제일</th>
							<th scope="col">주문상태</th>
							<th scope="col">결제취소</th>
							<th scope="col">상세</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="payList" items="${payList}">
							<tr>
								<td>${payList.group_id}</td>
								<td class="detail_td" id="pro_name_${payList.group_id}" data-toggle="collapse" data-target="#collapse-${payList.group_id}" aria-expanded="false" aria-controls="collapse-${payList.group_id}" data-group_id="${payList.group_id}"><span class="main-color">${payList.pro_name}<c:if test="${payList.cart_cnt > 1 }"> 외 ${payList.cart_cnt - 1 }개 품목</c:if></span>
								</td>
								<td id="totalPrice_${payList.group_id}">${payList.totalPrice}</td>
								<td>${payList.mem_name}</td>
								<td>${payList.mem_phone}</td>
								<td>${payList.mem_add1}${payList.mem_add2}</td>
								<td>${payList.pay_date}</td>
								<td id="statusTd_${payList.group_id}">${payList.status}</td>
								<td>
									<button class="btn btn-danger py-2 px-3 payCancel"
										id="payCancel_${payList.group_id}"
										data-group_id="${payList.group_id}"
										data-total_price="${payList.totalPrice}"
										data-pro_name='${payList.pro_name} <c:if test="${payList.cart_cnt > 1 }"> 외 ${payList.cart_cnt - 1 }개 품목</c:if>'
										<c:if test="${payList.status eq '주문 취소'}">disabled</c:if>>결제취소</button>
								</td>
								<td>
									<div class="accordion">
										<button class="detail_btn btn btn-primary py-2 px-3"
											type="button" data-toggle="collapse"
											data-target="#collapse-${payList.group_id}"
											aria-expanded="false"
											aria-controls="collapse-${payList.group_id}"
											data-group_id="${payList.group_id}">
											보기 <i class='fas fa-angle-down'></i>
										</button>
									</div>
								</td>
							</tr>
							<tr class="detail-row collapse" id="collapse-${payList.group_id}">
								<td class="detail-col" style="padding: 2px;" colspan="10">
									<div class="" >
										<div class="table-responsive" style="float: right;">
											<table
												class="table table-hover table-bordered">
												<thead>
													<tr>
														<th>카테고리</th>
														<th style="width: 200px;">상품명</th>
														<th style="width: 100px;">수량</th>
														<th style="width: 100px;">결제금액</th>
														<th style="width: 100px;">변경금액</th>
														<th style="width: 330px;">요일</th>
														<th style="width: 150px;">배송일</th>
														<th>요청사항</th>
														<th style="width: 85px;">변경</th>
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
		<div class="row mt-5">
			<div class="col text-center">
				<div class="block-27">
					<ul>
						<!-- 이전페이지 버튼 -->
						<c:if test="${pageMaker.prev}">
							<li class="pageInfo_btn previous"><a
								href="/admin/pays/${pageMaker.startPage-1}">&lt;</a></li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }""><a
								href="/admin/pays/${num}">${num}</a></li>
						</c:forEach>
						<!-- 다음페이지 버튼 -->
						<c:if test="${pageMaker.next}">
							<li class="pageInfo_btn next"><a
								href="/admin/pays/${pageMaker.endPage + 1 }">&gt;</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/common/admin_ft.jsp"></jsp:include>
<script>
$('.payCancel[disabled]').each(function() {
     $(this).text('취소된 주문');
   });

$(document).on("click", ".detail_btn, .detail_td", function () {
   console.log("클릭이벤트 실행");
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

   $(".payCancel").on("click", function() {
         let totalPrice = $(this).data('total_price');
         console.log(totalPrice);
         let group_id = $(this).data('group_id');
         let pro_name = $(this).data('pro_name');

         let result = confirm("선택하신 상품은 <<" + pro_name + ">>입니다. \n 주문을 취소하시겠습니까?")

         if (result) {
            $.ajax({
               type : "get",
               url : "/pay/kakao/cancel",
               data : {
                  group_id : group_id,
                  totalPrice : totalPrice,
               },
               success : function(response) {
                  alert("결제가 취소되었습니다.");
                  var status = $("#statusTd_" + group_id).text();
                  $('#statusTd_' + group_id).text("주문 취소");
                  $('#payCancel_' + group_id).attr("disabled", true).val("취소된 주문");
                  
               },
                  error: function(xhr, status, error) {
                      alert("결제취소가 실패했습니다.");
                    }
            });
         };
      });

function detailTable(data, group_id) {
    var tbody = $("#accordianBody-" + group_id);
    tbody.empty();     
    var productList = JSON.parse('${productList}');
    let selectCate;
    let pro_code;
    data.forEach(function (item) {
          pro_code = item.pro_code;
          var pay_code = item.pay_code;
         var cate = $("<select>").addClass("form-control").attr("id", "cate_" + pay_code).css({"max-width":"250px", "height":"40px", "text-align":"center", "font-size":"14px"});
         var keys = Object.keys(productList);
         keys.forEach(function(key) {
           var option = $("<option>").val(key).text(key);
           cate.append(option);
         });
         if (pro_code.substr(0, 1) === 'P') {
           cate.val('프리미엄');
         } else if (pro_code.substr(0, 1) === 'O') {
           cate.val('1인세트');
         } else {
           cate.val('2·3인세트');
         }

             selectCate = cate.val();
           var pro_name = $("<select>").addClass("form-control").attr("id", "pro_name_" + pay_code).css({"max-width":"250px", "height":"40px", "text-align":"center", "font-size":"14px"});
           var productListByCate = productList[selectCate];
           
           if (productListByCate) {
                productListByCate.forEach(function(product) {
                   var option = $("<option>").val(product.pro_name).text(product.pro_name);
                   if (product.pro_name === item.pro_name) {
                     option.attr("selected", true);
                   }
                   pro_name.append(option);
                });
              } else {
                console.log("해당 카테고리의 상품이 존재하지 않습니다.");
              }
           
           var selectProduct = productListByCate.find(function(product) {
              return product.pro_name === pro_name.val();
             });
           if (selectProduct) {
                var selectPrice = selectProduct.pro_price;
                var totalPrice = item.cart_cnt * selectPrice;
                var changePrice = item.cart_cnt * selectPrice;
              } else {
                console.log("상품을 찾을 수 없습니다.");
              }
    
        var cart_cnt = $("<input>").addClass("form-control").attr({
            "type": "number",
            "min": "0",
            "max": "99",
            "step": "1",
            "value": item.cart_cnt,
          }).attr("id", "cart_cnt_" + pay_code).css({"text-align":"center","padding-left":"20px"});
        
        cate.on("change", function() {
           
             var pay_code = $(this).attr("id").replace("cate_", "");
             selectCate = $(this).val();
             var productListByCate = productList[selectCate];
             var pro_name = $("#pro_name_" + pay_code);
             pro_name.empty();
             if (productListByCate) {
               productListByCate.forEach(function(product) {
                 var option = $("<option>").val(product.pro_name).text(product.pro_name);
                 pro_name.append(option);
               });
             } else {
               console.log("해당 카테고리의 상품이 존재하지 않습니다.");
             }
           });
        
        var cnt = parseInt((cart_cnt).val());
        
        pro_name.on("change", function() {
             var pay_code = $(this).attr("id").replace("pro_name_", "");
             var selectPro_name = $(this).val();
             var selectCate = $("#cate_" + pay_code).val();
             var productListByCate = productList[selectCate];
             var selectProduct = productListByCate.find(function(product) {
               return product.pro_name === selectPro_name;
             });
             pro_code = selectProduct.pro_code;
             var selectPrice = selectProduct ? selectProduct.pro_price : 0;
             var cnt = parseInt($("#cart_cnt_" + pay_code).val());
             var changePrice = cnt * selectPrice;
             $("#changePrice_" + pay_code).text(changePrice);
           });
        
        cart_cnt.on("change", function() {
           var cnt = parseInt($(this).val());
           var changePrice = cnt * selectPrice;
          $("#changePrice_" + pay_code).text(changePrice);
        });

      var cart_day = $("<div>").addClass("cart_day");
      
      var days = ["월", "화", "수", "목", "금", "토", "일"];
      for (var i = 0; i < days.length; i++) {
        var isChecked = item.cart_day.includes(days[i]);
        var input = $("<input>").attr({
          "type": "checkbox",
          "name": "cart_day_" + pay_code,
          "id": days[i],
          "value": days[i],
          "class": "form-check-input cart_day_" + pay_code + "",
        }).css({"margin-left":"-0.8rem","text-align":"center"}).prop("checked", isChecked);
        var label = $("<label>").attr({
          "class": "form-check-label",
        }).text(days[i]);
        label.prepend(input);
        var div = $("<div>").addClass("form-check").css({"display":"inline-block"}).append(label);
        cart_day.append(div);
      }
      

      
      var dateString = new Date(item.cart_start);
      var localDateString = dateString.getFullYear() + "-" + ("0" + (dateString.getMonth() + 1)).slice(-2) + "-" + ("0" + dateString.getDate()).slice(-2);
      var cart_start = $("<input>").attr({
          "type": "text",
          "name": "cart_start",
          "class": "form-control input-number",
          "readonly": true,
      }).val(localDateString).datepicker({dateFormat: "yy-mm-dd"}).css({"text-align":"center"});
      
      var pay_req =  $("<input>").attr({
          "type": "text",
          "name": "pay_req",
          "class": "form-control input-number",
      }).val(item.pay_req);
      
      var modify = $("<input>").attr({
          "type": "button",
          "name": "modify",
          "value": "변경",
          "class": "btn btn-primary",
      });
      if($("#statusTd_" + group_id).text() == "주문 취소") {
         modify.attr("disabled", true).val("취소된 주문");
      }
      
      
      modify.on("click", function() {
          const checkedValues = [];
          const checkboxes = document.querySelectorAll("input[name='cart_day_" + pay_code + "']:checked");
          checkboxes.forEach(function(checkbox) {
            checkedValues.push(checkbox.value);
          });

          if (confirm("정보를 변경하시겠습니까?")) {
            $.ajax({
              type: "POST",
              url: "/admin/pays/update",
              data: {
              pro_code: pro_code,
                pay_code: pay_code,
                pro_name: pro_name.val(),
                cart_cnt: cart_cnt.val(),
                totalPrice: $("#changePrice_" + pay_code).text(),
                cart_day: checkedValues.join(""),
                cart_start: cart_start.val(),
                pay_req: pay_req.val(),
              },
              success: function(data) {
                alert("정보가 변경되었습니다.");

                     var productName = cart_cnt.val() == 1 ? pro_name.val() : pro_name.val() + "외 " + (cart_cnt.val() - 1) + "종";
                     var totalPrice = $("#changePrice_" + pay_code).text();
                     $('#pro_name_' + group_id).text(productName);
                     $('#totalPrice_' + group_id).text(totalPrice);
                     
                      },
              error: function(xhr, status, error) {
                alert("업데이트가 실패했습니다.");
              }
          })
        }
      });
      
        
        tbody.append(
          $("<tr>").append(
            $("<td>").css("height", "40px").attr("name", "cate").append(cate),
            $("<td>").css("height", "40px").attr("name", "pro_name").append(pro_name),
            $("<td>").css("height", "40px").attr("name", "cart_cnt").append(cart_cnt),
            $("<td>").css("height", "40px").attr("name", "totalPrice").text(totalPrice),
            $("<td>").css("height", "40px").attr("name", "changePrice").attr("id", "changePrice_" + pay_code).text(changePrice),
            $("<td>").css("height", "40px").append(cart_day),
            $("<td>").css("height", "40px").append(cart_start),
            $("<td>").css("height", "40px").attr("name", "pay_req").append(pay_req),
            $("<td>").css("height", "40px").attr("name", "modify").append(modify)
          )
        );
      })};
    
  $(".collapse").on("hidden.bs.collapse", function () {
    var group_id = $(this).attr("id").split("-")[1];
    var detailBtn = $('.detail_btn[data-group_id="' + group_id + '"]');
    detailBtn.html("보기<i class='fas fa-angle-down'></i>");
  });

  $(".collapse").on("shown.bs.collapse", function () {
    var group_id = $(this).attr("id").split("-")[1];
    var detailBtn = $('.detail_btn[data-group_id="' + group_id + '"]');
    detailBtn.html("닫기<i class='fas fa-angle-up'></i>");
  });
</script>