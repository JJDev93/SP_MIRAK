<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/admin_hd.jsp"></jsp:include>
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
						<label for="name">Name *</label> <input type="text"
							class="form-control" id="name">
					</div>
				</div>
				<div class="col-md-12">
					<div class="form-group">
						<label for="email">Email *</label> <input type="email"
							class="form-control" id="email">
					</div>
				</div>
				<div class="col-md-12">
					<div class="form-group">
						<label for="website">Website</label> <input type="url"
							class="form-control" id="website">
					</div>
				</div>
				<div class="col-md-12">
					<div class="form-group">
						<label for="website">Website</label> <input type="url"
							class="form-control" id="website">
					</div>
				</div>
				<div class="col-md-12">
					<div class="form-group">
						<label for="website">Website</label> <input type="url"
							class="form-control" id="website">
					</div>
				</div>
				<div class="col-md-12">
					<div class="form-group">
						<label for="website">Website</label> <input type="url"
							class="form-control" id="website">
					</div>
				</div>
			</div>
		</form>		
		<a href="#" class="btn btn-secondary">목록</a>
		<a href="#" class="btn btn-primary">수정</a>
		<a href="#" class="btn btn-danger">삭제</a>
	</div>
</div>
<jsp:include page="../common/admin_ft.jsp"></jsp:include>