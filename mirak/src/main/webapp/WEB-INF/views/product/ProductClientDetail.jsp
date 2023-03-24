<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/common/client_hd.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<div class="hero-wrap hero-bread"
   style="background-image: url('${path}/resources/images/bg_3.jpg');">
   <div class="container">
      <div
         class="row no-gutters slider-text align-items-center justify-content-center">
         <div class="col-md-9 ftco-animate text-center">
            <c:if test="${fn : contains(product.pro_code, 'P')}">
               <h1 class="mb-0 bread">프리미엄</h1>
            </c:if>
            <c:if test="${fn : contains(product.pro_code, 'T')}">
               <h1 class="mb-0 bread">2·3인세트</h1>
            </c:if>
            <c:if test="${fn : contains(product.pro_code, 'O')}">
               <h1 class="mb-0 bread">1인세트</h1>
            </c:if>            
         </div>
      </div>
   </div>
</div>
<form method="post">
<input type="hidden" value="${product.pro_code}" name="pro_code">
   <section class="ftco-section">
      <div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="tagcloud">
					<a href="/ProductClientList" class="tag-cloud-link">전체메뉴</a>&nbsp;&gt;&nbsp;
					<c:if test="${fn : contains(product.pro_code, 'P')}">
		               <a href="/ProductClientListP" class="tag-cloud-link">프리미엄</a>
		            </c:if>
		            <c:if test="${fn : contains(product.pro_code, 'T')}">
						<a href="/ProductClientListT" class="tag-cloud-link">2·3인세트</a>
		            </c:if>
		            <c:if test="${fn : contains(product.pro_code, 'O')}">
						<a href="/ProductClientListO" class="tag-cloud-link">1인세트</a>
		            </c:if>  
					&nbsp;&gt;&nbsp;
					<a href="" class="tag-cloud-link">${product.pro_name}</a>
				</div>
			</div>
		</div>
         <div class="row">
            <input type="hidden" name="pro_code" value="${product.pro_code }">
            <div class="col-lg-6 mb-5 ftco-animate">
               <a href="${path}/resources/images/product/${product.pro_image}" class="image-popup"> 
                  <img alt="1" src="${path}/resources/images/product/${product.pro_image}" class="img-fluid" alt="${product.pro_desc}" title="${product.pro_name}">
               </a>
            </div>
            <div class="col-lg-6 product-details pl-md-5 ftco-animate">
               <h3>${product.pro_name}</h3>
               <p class="price" style="margin-bottom:-30px;">
                  가격 &nbsp; <span >${product.pro_price}</span>
               </p>
               
               <div class="row mt-4">
               
<!--                   <div class="input-group col-md-6 d-flex mb-3"> -->
<!--                      <p style="margin-top: 5px;">수량 : &nbsp;&nbsp;</p> -->
<!--                      <input type="number" id="result" name="cart_cnt" -->
<!--                         class="form-control input-number" min="1" max="100" value="1" -->
<!--                         > -->
<!--                         onchange="payBtnCnt()" -->
<!--                   </div> -->
                  
                  <div class="w-100"></div>
							<div class="input-group col-md-6 d-flex mb-3">
	             	<span class="input-group-btn mr-2">
	                	수량 &nbsp;&nbsp; <button type="button" class="quantity-left-minus btn"  data-type="minus" data-field="">
	                   <i class="ion-ios-remove"></i>
	                	</button>
	            		</span>
	             	<input type="text" id="result" name="result" class="form-control input-number" value="1" min="1" max="100">
	             	<span class="input-group-btn ml-2">
	                	<button type="button" class="quantity-right-plus btn" data-type="plus" data-field="">
	                     <i class="ion-ios-add"></i>
	                 </button>
	             	</span>
	          	</div>
	          	
               </div>
               
               <label for="start">배송 시작일<input type="date" name="cart_start" class="form-control input-number" style="width: 240px;" id="start" min=""></label>
               <br> 요일 선택<br>   
                              
               <label for="mon"><input type="checkbox" name="cart_day" id="mon" style="transform: scale(1.5);" value="월" >&nbsp;&nbsp;월</label>
               &nbsp;&nbsp; 
               <label for="tue"><input type="checkbox" name="cart_day" id="tue" style="transform: scale(1.5);" value="화" >&nbsp;&nbsp;화</label>
               &nbsp;&nbsp; 
               <label for="wed"><input type="checkbox" name="cart_day" id="wed" style="transform: scale(1.5);" value="수">&nbsp;&nbsp;수</label>
               &nbsp;&nbsp;   
               <label for="thu"><input type="checkbox" name="cart_day" id="thu" style="transform: scale(1.5);" value="목">&nbsp;&nbsp;목</label>
               &nbsp;&nbsp;
               <label for="fri"><input type="checkbox" name="cart_day" id="fri" style="transform: scale(1.5);" value="금">&nbsp;&nbsp;금</label>
               &nbsp;&nbsp;
               <label for="sat"><input type="checkbox" name="cart_day" id="sat" style="transform: scale(1.5);" value="토">&nbsp;&nbsp;토</label>   
               &nbsp;&nbsp;   
                <label for="sun"><input type="checkbox" name="cart_day" id="sun" style="transform: scale(1.5);" value="일">&nbsp;&nbsp;일</label>
               &nbsp;&nbsp; <br>
                <label for="all"><input type="checkbox" name="cart_all" id="all" style="transform: scale(1.5);" value="all" onclick='selectAll(this)'>&nbsp;&nbsp;전체선택</label>
                &nbsp;&nbsp; 
                <label for="pyeong"><input type="checkbox" name="cart_pyeong" id="pyeong" style="transform: scale(1.5);" value="pyeong" onclick='selectpyeong(this)'>&nbsp;&nbsp;주중선택</label>
                &nbsp;&nbsp; 
                <label for="jumal"><input type="checkbox" name="cart_jumal" id="jumal" style="transform: scale(1.5);" value="jumal" onclick='selectjumal(this)'>&nbsp;&nbsp;주말선택</label>
               
               <br> <br>
               <c:choose>
                   <c:when test="${sessionScope.mem_id eq 'admin'}">
                   </c:when>
                   <c:otherwise>
                     <p>
                        <a href="/cart/${product.pro_code }/1" id="cartBtn" class="btn btn-primary py-3 px-5" onclick="return payBtnCnt()">장바구니</a>
                        <a href="/pay/${product.pro_code }/1" id="payBtn" class="btn btn-black py-3 px-5" onclick="return payBtnCnt()">즉시 구매</a>
                     </p>
                   </c:otherwise>
                </c:choose>
            </div>
         </div>
	<h3>${product.pro_name}</h3>
	<p>${fn:replace(product.pro_desc, '.', "<br/>")}</p>
      </div>
     
   </section>
</form>
<jsp:include page="/common/client_ft.jsp"></jsp:include>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>


<script>
const resultInput = document.getElementById('result');

resultInput.addEventListener('change', function() {
  const resultValue = parseFloat(resultInput.value);

  if (isNaN(resultValue) || resultValue <= 0 || !Number.isInteger(resultValue)) {
    alert('최소 1이상의 수량을 선택해 주세요');
    resultInput.value = 1;
  }
});

</script>


<!-- 수량 변경 기능 --> 
<script>
		$(document).ready(function(){

		var result=0;
		   $('.quantity-right-plus').click(function(e){
		        
		        // Stop acting like a button
		        e.preventDefault();
		        // Get the field name
		        var result = parseInt($('#result').val());
		        
		        // If is not undefined
		            
		            $('#result').val(result + 1);

		          
		            // Increment
		        
		    });

		     $('.quantity-left-minus').click(function(e){
		        // Stop acting like a button
		        e.preventDefault();
		        // Get the field name
		        var result = parseInt($('#result').val());
		        
		        // If is not undefined
		      
		            // Increment
		            if(result>1){
		            $('#result').val(result - 1);
		            }
		    });
		    
		});
	</script>

<script>

function selectjumal(selectjumal)  {
    const checkboxes3 
         = document.querySelectorAll('#sat, #sun');
    
    checkboxes3.forEach((checkbox) => {
      checkbox.checked = selectjumal.checked;
    })
  }
</script>


<script>

function selectpyeong(selectpyeong)  {
    const checkboxes2 
         = document.querySelectorAll('#mon, #tue, #wed, #thu, #fri');
    
    checkboxes2.forEach((checkbox) => {
      checkbox.checked = selectpyeong.checked;
    })
  }
</script>

<script>

function selectAll(selectAll)  {
     const checkboxes 
          = document.getElementsByName('cart_day');
     
     checkboxes.forEach((checkbox) => {
       checkbox.checked = selectAll.checked;
     })
   }
</script>
<script>

$(function() {
   $('input[name="daterange"]').daterangepicker(
         {
            opens : 'left'
         },
         function(start, end, label) {
            console.log("A new date selection was made: "
                  + start.format('YYYY-MM-DD') + ' to '
                  + end.format('YYYY-MM-DD'));
         });
});

   const payBtnCnt = function() {

      const dateInput = document.getElementById('start');

      if (!dateInput.value) {

         alert('날짜를 입력해주세요.');
         return false;
      }
      
      const checkboxes = document.getElementsByName('cart_day');
      let isChecked = false;

      for (let i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
          isChecked = true;
          break;
        }
      }

      if (!isChecked) {
        alert('최소 하루 이상의 요일을 선택해 주세요');
        return false;
      }

      let cnt = document.getElementById("result").value;

      let start = document.getElementById("start").value;
      let mon = document.getElementById("mon").checked ? "월" : "";
      let tue = document.getElementById("tue").checked ? "화" : "";
      let wed = document.getElementById("wed").checked ? "수" : "";
      let thu = document.getElementById("thu").checked ? "목" : "";
      let fri = document.getElementById("fri").checked ? "금" : "";
      let sat = document.getElementById("sat").checked ? "토" : "";
      let sun = document.getElementById("sun").checked ? "일" : "";

      document.getElementById("payBtn").href = "/pay/${product.pro_code}/"
            + cnt + "/" + start + "/" + mon + tue + wed + thu + fri + sat
            + sun;
      document.getElementById("cartBtn").href = "/cart/${product.pro_code}/"
            + cnt + "/" + start + "/" + mon + tue + wed + thu + fri + sat
            + sun;
   }

   

   let today = new Date().toISOString().substr(0, 10);
   document.getElementById("start").min = today;   
   document.getElementById('start').valueAsDate = new Date();
   
</script>