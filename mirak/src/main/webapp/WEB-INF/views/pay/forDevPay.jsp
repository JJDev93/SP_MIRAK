<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post">

	<input type="text" name="pro_code" value="O01">
	<input type="text" name="cart_cnt" value="1">

<input type="submit" formaction="/pay" value="pay">

<button formaction="/cartpay">cartpay</button>
</form>
</body>
</html>