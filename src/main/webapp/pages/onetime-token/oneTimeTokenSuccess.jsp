<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/"><input type="button" value="Home"></a>
	<a href="${pageContext.request.contextPath}/ott-index"><input type="button" value="Back to OTT"></a>
	<table width="70%"align="center">
		<tr>
			<td>red_code : </td><td>${message.res_cd }</td>
		</tr>
		<tr>
			<td>res_msg : </td><td>${message.res_msg }</td>
		</tr>
		<tr>
			<td>tno : </td><td>${message.tno }</td>
		</tr>
		<tr>
			<td>trade_mony : </td><td>${message.trade_mony }</td>
		</tr>
		<tr>
			<td>trade_ymd : </td><td>${message.trade_ymd }</td>
		</tr>
		<tr>
			<td>trade_hms : </td><td>${message.trade_hms }</td>
		</tr>
		<tr>
			<td>card_no : </td><td>${message.card_no }</td>
		</tr>
		<tr>
			<td>auth_no : </td><td>${message.auth_no }</td>
		</tr>
		<tr>
			<td>auth_ymd : </td><td>${message.auth_ymd }</td>
		</tr>
		<tr>
			<td>auth_hms : </td><td>${message.auth_hms }</td>
		</tr>
	</table>
</body>
</html>