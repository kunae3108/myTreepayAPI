<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.security.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Treepay</title>

<script type="text/javascript"
	src="https://paytest.treepay.co.th/js/plugin.tp" charset="utf-8"></script>
<script type="text/javascript">
	//Call TreePay payment window
	function fn_treepay_approve() {
		TP_Pay_Execute(document.tp_form); // Call TreePay payment window with document form name
	}
</script>
</head>

<body>
	<form:form modelAttribute="paymentModel" name="tp_form">
		<!-- Payment Process Parameters -->
        Pay Type : <form:input type="text" path="pay_type" />
		<br>
        Currency : <form:input type="text" path="currency" />
		<br>
        
        Lang : <form:input type="text" path="tp_langFlag" />
		<br>
        
        Site CD : <form:input type="text" path="site_cd" />
		<br>
		<!-- Parameters only for Recurring Payment -->
        Bill End : <form:input type="text" path="bill_end" />
		<br>
        
        Bill Freq : <form:input type="text" path="bill_freq" />
		<br>

		<!-- Payment Connection URL  -->
        Return URL : <form:input type="text" path="ret_url" />
		<br>

		<!-- Customer's Order information -->
        User ID : <form:input type="text" path="user_id" />
		<br>
        Order No : <form:input type="text" path="order_no" />
		<br>
        Good Name : <form:input type="text" path="good_name" />
		<br>
        Trade Money : <form:input type="text" path="trade_mony" />
		<br>
        Order FName : <form:input type="text" path="order_first_name" />
		<br>
        Order LName : <form:input type="text" path="order_last_name" />
		<br>
        Order City : <form:input type="text" path="order_city" />
		<br>
        Order Addr : <form:input type="text" path="order_addr" />
		<br>
        Order Country : <form:input type="text" path="order_country" />
		<br>
        Order Email : <form:input type="text" path="order_email" />
		<br>
        Order Tel : <form:input type="text" path="order_tel" />
		<br>
        Order Post Code : <form:input type="text" path="order_post_code" />
		<br>
        
        Recv FName : <form:input type="text" path="recv_first_name" />
		<br>
        Recv LName : <form:input type="text" path="recv_last_name" />
		<br>
        Recv City : <form:input type="text" path="recv_city" />
		<br>
        Recv Addr : <form:input type="text" path="recv_addr" />
		<br>
        Recv Country : <form:input type="text" path="recv_country" />
		<br>
        Recv Email : <form:input type="text" path="recv_email" />
		<br>
        Recv Tel : <form:input type="text" path="recv_tel" />
		<br>
        Recv Post Code : <form:input type="text" path="recv_post_code" />
		<br>
        
        Logo Type : <form:input type="text" path="logo_type" />
		<br>

		<form:input type="hidden" path="hash_data" />
		<form:input type="hidden" path="res_cd" />
		<form:input type="hidden" path="res_msg" />
		<input type="button" onclick="fn_treepay_approve();" value="payment"
			alt="">
	</form:form>


</body>
</html>