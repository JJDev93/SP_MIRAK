<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/common/admin_hd.jsp"></jsp:include>
<div class="ftco-section">
	<div class="container">
		<div class="justify-content-center mb-3 pb-3">
			<div class="heading-section text-center">
				<h2>회원관리</h2>
				<p>회원 상세페이지 입니다.</p>
			</div>
		</div>
		<div class="p-5 bg-light mb-4">
			<div class="row">
				<input type="hidden" class="form-control" name="mem_code" value="${member.mem_code }" readonly>
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
						<input type="text" class="form-control" id="name" name="mem_name" value="${member.mem_name }" readonly>
					</div>
				</div>
				<div class="col-md-12">
					<div class="form-group">
						<label for="age">나이</label> 
						<input type="text" class="form-control" id="age" name="mem_age" value="${member.mem_age }" readonly>
					</div>
				</div>
				<div class="col-md-12">
					<div class="form-group">
						<label for="gender">성별</label> 
						<c:choose>
							<c:when test="${member.mem_gender == '1'}">
								<input type="text" class="form-control" id="gender" name="mem_gender" value="남" readonly>
	                        </c:when>
							<c:when test="${member.mem_gender == '2' }">
								<input type="text" class="form-control" id="gender" name="mem_gender" value="여" readonly>
							</c:when>
						</c:choose>
					</div>
				</div>
				<div class="col-md-12">
					<div class="form-group">
						<label for="phone">연락처</label> 
						<input type="text" class="form-control" id="phone" name="mem_phone" value="${member.mem_phone }" readonly>
					</div>
				</div>
				<div class="col-md-12">
					<div class="form-group">
						<label for="address_input_1">주소</label> 
						<input type="text" class="form-control mb-2" id="address_input_1" name="mem_zipcode" value="${member.mem_zipcode }" readonly>
						<input type="text" class="form-control mb-2" id="address_input_2" name="mem_add1" value="${member.mem_add1 }" readonly>
						<input type="text" class="form-control" id="address_input_3" name="mem_add2" value="${member.mem_add2 }" readonly>
					</div>
				</div>
				<div class="col-md-12">
					<div class="form-group">
						<label for="phone">가입일자</label> 
						<input type="text" class="form-control" id="regdate" name="mem_regdate" value="<fmt:formatDate value="${member.mem_regdate }"/>" readonly>
					</div>
				</div>
			</div>
		</div>		
		<a href="/admin/members/${curPage}" class="btn btn-secondary">목록</a>
		<a href="/admin/memberUpdate/${curPage}/${member.mem_code}" class="btn btn-primary">수정</a>
		<a href="/admin/memberDel/${curPage}/${member.mem_code}" class="btn btn-danger" onclick="return confirmDelMember()">삭제</a>
	</div>
</div>
<jsp:include page="/common/admin_ft.jsp"></jsp:include>
<script>
function confirmDelMember() {
  if (confirm("회원을 삭제하시겠습니까?")) {
    alert("삭제되었습니다");
    return true;
  }else{
	return false;
  }
}
</script>