<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/common/admin_hd.jsp"></jsp:include>
<div class="ftco-section admin-list">
	<div class="container">
		<div class="justify-content-center mb-3 pb-3">
			<div class="heading-section text-center">
				<h2>회원관리</h2>
				<p>회원관리 리스트 페이지 입니다.</p>
			</div>
		</div>
		<div class="bd-example-snippet bd-code-snippet">
			<div class="bd-example">
				<table class="table table-hover table-bordered">
					<thead>
						<tr>
							<th scope="col" style="width:60px;">번호</th>
							<th scope="col">ID</th>
							<th scope="col">이름</th>
							<th scope="col">나이</th>
							<th scope="col">성별</th>
							<th scope="col">연락처</th>
							<th scope="col">가입일자</th>
							<th scope="col" width="80px">수정</th>
							<th scope="col" width="80px">식제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${memberList}" var="member">
						<tr>
							<td scope="row">${member.mem_code}</td>
							<td><a href="/admin/member/${curPage}/${member.mem_code}">${member.mem_id }</a></td>
							<td>${member.mem_name }</td>
							<td>${member.mem_age }</td>
							<td>
								<c:choose>
									<c:when test="${member.mem_gender == '1'}">
										남	
									</c:when>
									<c:when test="${member.mem_gender == '2' }">
										여
									</c:when>
								</c:choose>
							</td>
							<td>${member.mem_phone }</td>
							<td><fmt:formatDate value="${member.mem_regdate }"/></td>
							<td><a href="/admin/memberUpdate/${curPage}/${member.mem_code}" class="btn btn-primary">수정</a></td>
							<td><a href="/admin/memberDel/${curPage}/${member.mem_code}" class="btn btn-danger" onclick="return confirmDelMember()">삭제</a></td>
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
							<li class="pageInfo_btn previous" id="abc"><a href="/admin/members/${pageMaker.startPage-1}">&lt;</a></li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="/admin/members/${num}">${num}</a></li>
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<li class="pageInfo_btn next" id="abc"><a href="/admin/members/${pageMaker.endPage + 1 }">&gt;</a></li>
						</c:if>
						<!-- 다음페이지 버튼 -->
					</ul>
				</div>
			</div>
		</div>
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