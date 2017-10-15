<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://paytest.treepay.co.th/js/plugin_api.tp" charset="utf-8"></script>
<script type="text/javascript">
	// Calling the authentication function through JS
	function fn_treepay_approve() {
		// Create Json Objcet
		var card = {
			"cert_url" : $("#cert_url").val(),//Jquery example to get value from input text.
			"ret_field" : $("#ret_field").val(),
			"order_no" : $("#order_no").val(),
			"trade_mony" : $("#trade_mony").val(),
			"card_number" : $("#card_number").val(),
			"expiration_yy" : $("#expiration_yy").val(),
			"expiration_mm" : $("#expiration_mm").val(),
			"ver" : $("#ver").val(),
			"first_card_holder_name" : $("#first_card_holder_name").val(),
			"last_card_holder_name" : $("#last_card_holder_name").val(),
			"pay_type" : $("#pay_type").val(),
			"currency" : $("#currency").val(),
			"tp_langFlag" : $("#tp_langFlag").val(),
			"site_cd" : $("#site_cd").val()
		// Merchant ID (Generate by Tree Pay)
		};
		testar(card); // Use this function for create Token with Treepay.
		TP_Pay_Execute(card); // Use this function for create Token with Treepay.
	}
	function testar() {
		var ae = arguments;
		console.log(ae);
	}

	function m_Completepayment(retObj) {
// 		alert('response_code: '+retObj.res_cd)
		if (retObj.res_cd == "0000") // Check response massage if success will return  "0000"
		{
// 			alert('ott: '+retObj.ott)
			var token = retObj.ott;
			// Send token to your server for make Authorization Request.

			// If you receive res_cd 0000(success), submit ott
			document.form_pay.ott.value = token;
			//alert(token);
			document.form_pay.submit(); // Page redirection to process hash data. 
			// Prior to OTT js authorization request, hash data process is mandatory.
		} else {
			alert("[" + retObj.res_cd + "] " + retObj.res_msg);
		}
		// if success: receive retObj to below type
		// {"res_cd":"0000","res_msg":"success","ott":"5F2E463FF9EFC953FE3B325CB947BE923FC33B8892AD14D098F3EA52EF4A5BD1"}
		// if failed: receive res_cd and res_msg value only.

	}
</script>
</head>
<body>
	<form:form name='form_pay' id="form_pay" method="post" action="ott-process" modelAttribute="ottModel" >
		<p>
			<strong>Integration Information</strong><br> 
			cert_url : <form:input type="text" path="cert_url" id="cert_url" value="http://localhost:8080/myTreepayAPI/ott-index" />
			<br> 
<%-- 			ret_url : <form:input type="text" path="ret_url" id="ret_url" value="http://localhost:8080/myTreepayAPI/success.jsp" /> --%>
<!-- 			<br> -->
			ret_field : <form:input type="text" path="ret_field" id="ret_field" value="m_Completepayment" />
			<br>
			ver : <form:input type="text" path="ver" id="ver" value="1.0" />
			<br>
		</p>

		<p>
			<strong>Order Information</strong>
			<br> 
			order_no <form:input type="text" path="order_no" id="order_no" value="123456789" />
			<br>
			trade_mony <form:input type="text" path="trade_mony" id="trade_mony" value="1004" />
			<br> 
			user_id <form:input type="text" path="user_id" id="user_id" value="anusorn_pn2" />
			<br> 
			good_name <form:input type="text" path="good_name" id="good_name" value="test product" />
			<br>
			order_first_name <form:input type="text" path="order_first_name" id="order_first_name" value="hong" />
			<br> 
			order_last_name <form:input type="text" path="order_last_name" id="order_last_name" value="gildong" />
			<br> 
			order_city <form:input type="text" path="order_city" id="order_city" value="Seoul" />
			<br>
			order_addr <form:input type="text" path="order_addr" id="order_addr" value="Guro-gu" />
			<br> 
			order_country <form:input type="text" path="order_country" id="order_country" value="TH" />
			<br>
			order_email <form:input type="text" path="order_email" id="order_email" value="test@test.co.kr" />
			<br> 
			order_tel <form:input type="text" path="order_tel" id="order_tel" value="01012341234" />
			<br>
			order_post_code <form:input type="text" path="order_post_code" id="order_post_code" value="303" />
			<br> 
			recv_first_name <form:input type="text" path="recv_first_name" id="recv_first_name" value="hong" />
			<br>
			recv_last_name <form:input type="text" path="recv_last_name" id="recv_last_name" value="gildong" />
			<br> 
			recv_city <form:input type="text" path="recv_city" id="recv_city" value="Seoul" />
			<br>
			recv_addr <form:input type="text" path="recv_addr" id="recv_addr" value="Guro-gu" />
			<br> 
			recv_country <form:input type="text" path="recv_country" id="recv_country" value="Seoul" />
			<br>
			recv_email <form:input type="text" path="recv_email" id="recv_email" value="test@test.co.kr" />
			<br> 
			recv_tel <form:input type="text" path="recv_tel" id="recv_tel" value="01012341234" />
			<br>
			recv_post_code <form:input type="text" path="recv_post_code" id="recv_post_code" value="303" />
			<br>
		</p>


		<p>
			<strong>Card Information</strong>
			<br>
			<!-- Should not be stored to merchant’s server -->
			card_number <form:input type="text" path="card_number" id="card_number" value="4000000000000002" />
			<br> 
			expiration_yy <form:input type="text" path="expiration_yy" id="expiration_yy" value="20" />
			<br>
			expiration_mm <form:input type="text" path="expiration_mm" id="expiration_mm" value="12" />
			<br> 
			first_card_holder_name <form:input type="text" path="first_card_holder_name" id="first_card_holder_name" value="hong" />
			<br>
			last_card_holder_name <form:input type="text" path="last_card_holder_name" id="last_card_holder_name" value="gildong" />
			<br> 
			cvn <form:input type="text" path="cvn" id="cvn" value="123" /><br>
		</p>

		<p>
			<strong>Site Information</strong>
			<br> 
			pay_type <form:input type="text" path="pay_type" id="pay_type" value="PACA" />
			<br>
			currency <form:input type="text" path="currency" id="currency" value="764" />
			<br>
			tp_langFlag <form:input type="text" path="tp_langFlag" id="tp_langFlag" value="th" />
			<br> 
			site_cd <form:input type="text" path="site_cd" id="site_cd" value="A0000187FB" />
			<br>
			secure_key <form:input type="text" path="secure_key" id="secure_key" value="0alx7PU-l5C5DyXdc5uuPFz5T3lbOfYQ6BMro-8AV14cuw8vGVc92mHEqY-sHauNy6Is4bA4lNjqEEOBjKkfAc8ECWhIKb2rNWJo5r-swvc95yncWI42uDgZX1F15yUFruzIA1OrcwtesS9e8ALnLx5JVbBCiqx.P1CbE0UgkGMWKUUc4SFPijYSKEwA3nkwm-KbvuGKHK9dWT7JSHuYEfCPsS93XVxWpp4vXsqNPtouicZzZqSctCggVvWMpnkXtazqHoBanPWMZcOwWFsAIZjmxc8C92ACMvXfE2yu3CZHfZg0verROuU5LNtp7wpW5idytJ3GKcBLJT2T8xpuf-u__" />
		</p>

		<p>
			<strong>One Time Token</strong>
			<br> 
			ott <form:input type="text" path="ott" id="ott" value="" /><br>
		</p>

		<input type="button" value="Request payment" onclick="fn_treepay_approve();" />
	</form:form>
</body>
</html>