<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<table border="1" cellpadding="0" cellspacing="0" width="500">
		<tr>
			<th bgcolor="orange" width="100">상품코드</th>
			<th bgcolor="orange" width="100">상품명</th>
			<th bgcolor="orange" width="100">상품가격</th>
			<th bgcolor="orange" width="100">상품설명</th>
			<th bgcolor="orange" width="100">반찬 개수</th>
			<th bgcolor="orange" width="200">옵션명</th>
			<th bgcolor="orange" width="200">옵션가격</th>


		</tr>
		<c:forEach items="${productList}" var="product" varStatus="status">
			<tr>
				<td>${product.pro_code }</td>
				<td><a href="ProductAdminDetail?pro_code=${product.pro_code}">${product.pro_name }</a></td>
				<td>${product.pro_price }</td>
				<td>${product.pro_desc }</td>
				<td>${product.pro_cnt }</td>
				<td>${optionList[status.index].opt_name }</td>
				<td>${optionList[status.index].opt_price }</td>
				

			</tr>
		</c:forEach>
	


	</table>
	<br>
	<a href="ProductAdminRegister">상품 등록</a>

</body>
</html>