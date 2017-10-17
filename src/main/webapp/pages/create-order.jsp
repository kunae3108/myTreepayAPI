<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.security.*" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Treepay</title>

<script type="text/javascript" src="https://paytest.treepay.co.th/js/plugin.tp" charset="utf-8"></script>
<script type="text/javascript">
	window.onload = function()
	{
	    var today = new Date();
	    var year  = today.getFullYear();
	    var month = today.getMonth() + 1;
	    var date  = today.getDate();
	    var time  = today.getTime();
	
	    if(parseInt(month) < 10) {
	        month = "0" + month;
	    }
	
	    var order_no = year + "" + month + "" + date + "" + time;
	    
	    document.tp_form.order_no.value = order_no;
	
	    document.tp_form.ret_url.value = "http://localhost:8080/myTreepayAPI/ott-succss";
	}

    //Call TreePay payment window
    function submitdataforhash() {
        /* TP_Pay_Execute(document.tp_form); */ // Call TreePay payment window with document form name
    	document.tp_form.submit();
    }
</script>
</head>

<body>
    <form:form name="tp_form" action="beforePay" method="post" modelAttribute="paymentModel">
 		<!-- Payment Process Parameters -->
 		Pay Type :
        <form:select path="pay_type">
            <option value="PACA">Credit/Debit Card</option>
            <option value="PARC">Recurring Payment</option>
            <option value="PAIN">Installment</option>
            <option value="PABK">Direct debit</option>
        </form:select>
        <br>
        Language :
        <form:select path="tp_langFlag" >
            <option value="en">EN</option>
            <option value="th">TH</option>
        </form:select>
        <br>
        
        <!-- Merchant ID -->
        Site CD :
        <form:input type="text" path="site_cd" value="A0000187FB"/><br>
        Secure Key : 
        <form:input type="text" path="secure_key" value="0alx7PU-l5C5DyXdc5uuPFz5T3lbOfYQ6BMro-8AV14cuw8vGVc92mHEqY-sHauNy6Is4bA4lNjqEEOBjKkfAc8ECWhIKb2rNWJo5r-swvc95yncWI42uDgZX1F15yUFruzIA1OrcwtesS9e8ALnLx5JVbBCiqx.P1CbE0UgkGMWKUUc4SFPijYSKEwA3nkwm-KbvuGKHK9dWT7JSHuYEfCPsS93XVxWpp4vXsqNPtouicZzZqSctCggVvWMpnkXtazqHoBanPWMZcOwWFsAIZjmxc8C92ACMvXfE2yu3CZHfZg0verROuU5LNtp7wpW5idytJ3GKcBLJT2T8xpuf-u__"/><br>
        
        <!-- Parameters only for Recurring Payment -->
        Bill End :
        <form:input type="text" path="bill_end" value="20170705"/><br>
        
        <!-- Parameters only for Recurring Payment -->
        Bill Freq : 
        <form:select path="bill_freq">
            <option value="W">Weekly</option>
            <option value="B">Bi-Weekly</option>
            <option value="M">Monthly</option>
        </form:select><br>
       
        <!-- Payment Connection URL  -->
        Return URL : 
        <form:input type="text" path="ret_url" value=""/><br>
        
        Currency : 
        <form:select path="currency">
            <option value="764">THB</option>
            <option value="840">USD</option>
        </form:select><br>
        
        <!-- Customer's Order information -->
        User ID : <form:input type="text" path="user_id" value="test"/><br>
        Order No : <form:input type="text" path="order_no" value=""/><br>
        Good Name : <form:input type="text" path="good_name" value="goods"/><br>
        Trade Money : <form:input type="text" path="trade_mony" value="9999"/><br>
        Order FName : <form:input type="text" path="order_first_name" value="hong"/><br>
        Order LName : <form:input type="text" path="order_last_name" value="gildong"/><br>
        Order City : <form:input type="text" path="order_city" value="Bangkok"/><br>
        Order Addr : <form:input type="text" path="order_addr" value="Silom Bangkok"/><br>
        Order Country : <form:input type="text" path="order_country" value="TH"/><br>
        Order Email : <form:input type="text" path="order_email" value="test@treepay.co.th"/><br>
        Order Tel : <form:input type="text" path="order_tel" value="0897776666"/><br>
        Order Post Code : <form:input type="text" path="order_post_code" value="10500"/><br>
        
        Recv FName : <form:input type="text" path="recv_first_name" value="hong"/><br>
        Recv LName : <form:input type="text" path="recv_last_name" value="gildong"/><br>
        Recv City : <form:input type="text" path="recv_city" value="Bangkok"/><br>
        Recv Addr : <form:input type="text" path="recv_addr" value="Dindaeng Bangkok"/><br>
        Recv Country : <form:input type="text" path="recv_country" value="TH"/><br>
        Recv Email : <form:input type="text" path="recv_email" value="test@treepay.co.th"/><br>
        Recv Tel : <form:input type="text" path="recv_tel" value="0636667777"/><br>
        Recv Post Code : <form:input type="text" path="recv_post_code" value="10400"/><br>
        Logo Type : <form:input type="text" path="logo_type" value="F"/><br>
        
        <input type="button" name="hash" value="hash" onClick="submitdataforhash();" > 

    </form:form>


</body>
</html>