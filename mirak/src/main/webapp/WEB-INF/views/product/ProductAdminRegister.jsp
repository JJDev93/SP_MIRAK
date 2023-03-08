<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="productregister" method="post" enctype="multipart/form-data">
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td bgcolor="orange" width="70">상품코드</td>
					<td align="left"><input type="text" name="pro_code" /></td>
				</tr>
				<tr>
					<td bgcolor="orange">상품명</td>
					<td align="left"><input type="text" name="pro_name" size="10" /></td>
				</tr>
				<tr>
					<td bgcolor="orange">상품가격</td>
					<td align="left"><input type="text" name="pro_price" size="10" /></td>
				</tr>
				<tr>
					<td bgcolor="orange">상품설명</td>
					<td align="left"><textarea name="pro_desc" cols="40" rows="10"></textarea></td>
				</tr>
				<tr>
					<td bgcolor="orange">반찬 개수</td>
					<td align="left"><input type="text" name="pro_cnt" size="10" /></td>
				</tr>
				<tr>
					<td bgcolor="orange">옵션명</td>
					<td align="left"><input type="text" name="opt_name" size="10" /></td>
				</tr>
				<tr>
					<td bgcolor="orange">옵션가격</td>
					<td align="left"><input type="text" name="opt_price" size="10" /></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value=" 상품 등록 " /></td>
				</tr>
				
			</table>
		</form>
</body>
</html>