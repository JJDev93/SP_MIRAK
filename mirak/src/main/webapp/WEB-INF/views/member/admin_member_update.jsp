<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/common/admin_hd.jsp"></jsp:include>
<div class="ftco-section">
	<div class="container">
		<div class="justify-content-center">
			<div class="heading-section text-center">
				<h2>회원관리</h2>
				<p>회원정보 수정페이지입니다.</p>
			</div>
		</div>
		<div class="billing-form row justify-content-center">
			<div class="col-xl-7">
				<form action="/admin/memberUpdate/${curPage}/${member.mem_code}" method="post" onsubmit="return confirmUpdateMember();">
					<input type="hidden" class="form-control" name="mem_code" value="${member.mem_code }" readonly>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label for="ID">아이디</label> 
								<input type="text" class="form-control" id="ID" name="mem_id" value="${member.mem_id}" readonly>
								<c:choose>
									<c:when test="${member.mem_isapi == 'google'}">
										Google 빠른로그인 회원입니다
			                        </c:when>
									<c:when test="${member.mem_isapi == 'naver' }">
										Naver 빠른로그인 회원입니다
									</c:when>
									<c:when test="${member.mem_isapi == 'kakao' }">
										Kakao 빠른로그인 회원입니다
									</c:when>
									<c:otherwise> 
										일반 회원입니다.
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<label for="name">이름</label> 
								<input type="text" class="form-control" id="name" name="mem_name" value="${member.mem_name }">
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<label for="age">나이</label> 
								<input type="text" class="form-control" id="age" name="mem_age" value="${member.mem_age }" required>
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<label for="gender">성별</label>
								<div>
									<c:choose>
										<c:when test="${member.mem_gender == '1'}">
											<input type="radio" name="mem_gender" value="1" checked> 남
                                          &nbsp;&nbsp;&nbsp; 
                                          <input type="radio"
												name="mem_gender" value="2"> 여
                                         </c:when>
										<c:when test="${member.mem_gender == '2' }">
											<input type="radio" name="mem_gender" value="1"> 남
                                          &nbsp;&nbsp;&nbsp; 
                                          <input type="radio"
												name="mem_gender" value="2" checked>여
                                       </c:when>
									</c:choose>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<label for="phone">연락처</label> 
								<input type="text" class="form-control" id="phone" name="mem_phone" value="${member.mem_phone }" placeholder=" ' - ' 빼고 입력해주세요 " maxlength="11" pattern="[0-9]{11}" required>
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<label for="address_input_1">주소</label>
								<div class="row mb-2">
									<div class="col-sm-8">
										<input type="text" class="form-control" id="address_input_1" name="mem_zipcode" placeholder="주소지를 입력해주세요" value="${member.mem_zipcode }" readonly="readonly">
									</div>
									<div class="col-sm-4">
										<button type="button" class="btn btn-primary joinBtn address button" onclick="execution_daum_address();">우편번호찾기</button>
									</div>
								</div>
								<input type="text" class="form-control mb-2" readonly="readonly" id="address_input_2" placeholder="주소작성" readonly="readonly" value="${member.mem_add1 }" name="mem_add1"> 
								<input type="text" class="form-control" placeholder="상세주소작성" id="address_input_3" value="${member.mem_add2 }" name="mem_add2">
							</div>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-md-4">
							<a href="/admin/members/${curPage}" class="btn btn-secondary py-3 px-5 w-100">목록</a>
						</div>
						<div class="col-md-4">
							<button type="submit" class="btn btn-primary py-3 px-5 w-100">회원수정</button>
						</div>
						<div class="col-md-4">
							<a href="/admin/member/${curPage}/${member.mem_code}" class="btn btn-danger py-3 px-5 w-100">취소</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/common/admin_ft.jsp"></jsp:include><script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${path}/resources/js/daumAddress.js"></script>
<script>
	function confirmUpdateMember() {
		if (confirm("회원정보를 수정하시겠습니까?")) {
			alert("수정되었습니다");
			return true;
		} else {
			return false;
		}
	}
</script>