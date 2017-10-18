<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.security.*" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Treepay</title>

<script type="text/javascript" src="https://paytest.treepay.co.th/js/plugin.tp" charset="utf-8"></script>
<%-- <script src="<c:url value='/static/js/jquery-3.2.0.js'/>"/> --%>



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
	
	    document.tp_form.ret_url.value = "http://localhost:8080/myTreepayAPI/pay-success";
	}

	
	
    //Call TreePay payment window
    function submitdataforhash() {
    		document.tp_form.action = "redirect-beforePay";
    		document.tp_form.submit();
    }
    
    //Call TreePay payment window
    function submitToOTT() {
    		document.tp_form.action = "ott-index";
    		document.tp_form.submit();
    }
    
    function submitToOCT(){
		document.tp_form.action = "oct-process";
		document.tp_form.submit();
    }
    
    $(document).ready(function(){
    	
    	
    		$("#pay_type").on('change',function(){
    			if($(this).val() == 'PAOC'){
    				$("#oct").show();
    				$("#passwd").show();
    				$("#token_no").show();
    				
    				$("#ott").hide();
    				$("#redirect").hide();
    			}else{
    				$("#oct").hide();
    				$("#passwd").hide();
    				$("#token_no").hide();

    				$("#ott").show();
    				$("#redirect").show();
    			}
    			
    		})
    		
    })
</script>
</head>

<body>
	<a href="${pageContext.request.contextPath}/"><input type="button"value="Back" style="margin-bottom: 10px;"/></a>
	<h3>Order Infomation</h3>
    <form:form name="tp_form" method="post" modelAttribute="paymentModel">
 		<!-- Payment Process Parameters -->
 		Pay Type :
        <form:select id="pay_type" path="pay_type">
            <option value="PACA">Credit/Debit Card</option>
            <option value="PAOC">One Click Payment for Debit/Credit Card</option>
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
        <form:input type="text" path="site_cd" value="A0000228NH"/><br>
        Secure Key : 
        <form:input type="text" path="secure_key" value="4UeRIkB.vADBwQtFLXlg825ATscKem1w8NVSwh7PpP6vD82Y8TAiu0.wKqIp-YHP0HEss9Dac0Alv-Zf0.QZYHQA0YYDrBjmhfX9mUzCqhsV3docOSKIAfxKETj-XZ-h2iSibhN4dyWdtsPOW-5K39LlsojAHeYHROslkx3-.7rh5i0uxEVY5Yxbsi7LvKLp7p2f7ljhXcSbT7Zmwv9dQjS1eaSwK6.uffEpDgpDYfNUCQ0zGsBqbs2eLbkdJw1gMI0AaahJ7ZeI6ec117VT8cPdB3eWP-btrwkklhfowPoUMSRRgoACxWy9LzAbfmyyoIEwtn8.M4fVcsyYxxxgLVY__"/><br>
        
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
        User ID : <form:input type="text" path="user_id" value="thom"/><br>
        Password : <form:input id="passwd" type="text" path="passwd" value="123456"  cssStyle="display:none;"/><br>
        Token No : <form:input id="token_no" type="text" path="token_no" value="1710492118000002" cssStyle="display:none;"/><br>
        Order No : <form:input type="text" path="order_no" value=""/><br>
        Good Name : <form:input type="text" path="good_name" value="goods"/><br>
        Trade Money : <form:input type="text" path="trade_mony" value="909"/><br>
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
        
		<p>Payment Method</p>
        <input type="button" id="ott" name="ott" value="OTT Request" onClick="submitToOTT();" style="margin-right: 10px; background-color: #ffbac6;"/>
        <input type="button" id="oct" name="oct" value="OCT Request" onClick="submitToOCT();" style="margin-right: 10px; background-color: #eef58c; display: none; "/>
        <input type="button" id="redirect" name="redirect" value="Redirect Page" onClick="submitdataforhash();" style="background-color: #bee8c0;" /> 

    </form:form>


</body>
</html>