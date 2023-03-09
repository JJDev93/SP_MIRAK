<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/common/admin_hd.jsp"></jsp:include>
<div class="ftco-section">
	<div class="container">
		<div class="justify-content-center mb-3 pb-3">
			<div class="heading-section text-center">
				<h2>회원관리</h2>
				<p>회원 상세페이지 입니다.</p>
			</div>
		</div>
		<form action="#" class="p-5 bg-light mb-4">
			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<label for="ID">아이디</label> 
						<input type="text" class="form-control" id="ID" value="${member.mem_id }" readonly>
					</div>
				</div>
				<div class="col-md-12">
					<div class="form-group">
						<label for="name">이름</label> 
						<input type="text" class="form-control" id="name" value="${member.mem_name }" readonly>
					</div>
				</div>
				<div class="col-md-12">
					<div class="form-group">
						<label for="age">나이</label> 
						<input type="text" class="form-control" id="age" value="${member.mem_age }" readonly>
					</div>
				</div>
				<div class="col-md-12">
					<div class="form-group">
						<label for="gender">성별</label> 
						<c:choose>
							<c:when test="${member.mem_gender == '1'}">
								<input type="text" class="form-control" id="gender" value="남" readonly>
	                        </c:when>
							<c:when test="${member.mem_gender == '0' }">
								<input type="text" class="form-control" id="gender" value="여" readonly>
							</c:when>
						</c:choose>
					</div>
				</div>
				<div class="col-md-12">
					<div class="form-group">
						<label for="phone">연락처</label> 
						<input type="text" class="form-control" id="phone" value="${member.mem_phone }" readonly>
					</div>
				</div>
			</div>
		</form>		
		<a href="/adminMembers" class="btn btn-secondary">목록</a>
	</div>
</div>
<jsp:include page="/common/admin_ft.jsp"></jsp:include>