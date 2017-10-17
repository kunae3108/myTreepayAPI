<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://paytest.treepay.co.th/pay/getFpId.tp?site_cd=${paymentModel.site_cd}&pay_type=${paymentModel.pay_type}" charset="utf-8"></script>
</head>
<body>
	<script>
		if("" == treepay_fp_id){
			alert("Merchant ID is not support payment type.!")
			location.replace("${pageContext.request.contextPath}/createOrder");
		}
	
		$(document).ready(function(){
			$("#fp_id").val(treepay_fp_id);
		})
	</script>
	
	<form:form name="tp_form" action="oct-process" method="POST" modelAttribute="paymentModel">
		<!-- Hidden Field -->
		<form:input type="hidden" path="secure_key" />
		<form:input type="hidden" path="pay_type" />
		<form:input type="hidden" path="order_no" />
		<form:input type="hidden" path="trade_mony" />
		<form:input type="hidden" path="site_cd" />
		<form:input type="hidden" path="user_id" />
		<form:input type="hidden" path="passwd" />
	
		fp_id : <form:input type="text" path="fp_id" id="fp_id" value="" />
		<br> 
		token_no : <form:input type="text" path="token_no" />
		<br> 
		<input type="submit" value="test OCT" />
	</form:form>
	
	
</body>
</html>