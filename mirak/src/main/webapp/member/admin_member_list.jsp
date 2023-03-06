<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/admin_hd.jsp"></jsp:include>
<div class="ftco-section">
	<div class="container">
		<div class="justify-content-center mb-3 pb-3">
			<div class="heading-section text-center">
				<h2>회원관리</h2>
				<p>회원관리 리스트 페이지 입니다.</p>
			</div>
		</div>
		<a href="#" class="btn btn-primary mb-4">회원 추가</a>
		<form action="#" class="p-5 bg-light mb-4">
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label for="name">Name *</label> <input type="text"
							class="form-control" id="name">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="email">Email *</label> <input type="email"
							class="form-control" id="email">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="website">Website</label> <input type="url"
							class="form-control" id="website">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="website">Website</label> <input type="url"
							class="form-control" id="website">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="website">Website</label> <input type="url"
							class="form-control" id="website">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="website">Website</label> <input type="url"
							class="form-control" id="website">
					</div>
				</div>
				<div class="col-md-12">
					<input type="submit" value="검색" class="btn btn-primary">
				</div>
			</div>
		</form>
		<div class="bd-example-snippet bd-code-snippet">
			<div class="bd-example">
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">First</th>
							<th scope="col">Last</th>
							<th scope="col">Handle</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>Jacob</td>
							<td>Thornton</td>
							<td>@fat</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td colspan="2">Larry the Bird</td>
							<td>@twitter</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row mt-5">
			<div class="col text-center">
				<div class="block-27">
					<ul>
						<li><a href="#">&lt;</a></li>
						<li class="active"><span>1</span></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">&gt;</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../common/admin_ft.jsp"></jsp:include>