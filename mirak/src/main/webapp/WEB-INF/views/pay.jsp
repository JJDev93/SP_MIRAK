<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
<h2>pay화면</h2>
	<div>		
		<c:forEach var="p" items="${payList }">
			${p.id }			${p.name }
			
		</c:forEach>
		
		
	</div>
</body>
</html>