
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="dec"	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      "currency" : $("currency").val(),
      "tp_langFlag" : $("#tp_langFlag").val(),
      "site_cd" : $("#site_cd").val()
    // Merchant ID (Generate by Tree Pay)
    };

    TP_Pay_Execute(card); // Use this function for create Token with Treepay.
  }

  function m_Completepayment(retObj) {
    if (retObj.res_cd == "0000") // Check response massage if success will return  "0000"
    {
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
<a href="${pageContext.request.contextPath}"><input type="button"value="Back" /></a>
  <form name="form_pay" id="form_pay" method="post" action="completePay.php">
    <p>
      <strong>Integration Information</strong><br> cert_url <input
        type="text" name="cert_url" id="cert_url"
        value="http://localhost/testOTT_PHP/" /><br> ret_url <input
        type="text" name="ret_url" id="ret_url"
        value="http://localhost/testOTT_PHP/result.php" /><br> ret_field <input
        type="text" name="ret_field" id="ret_field"
        value="m_Completepayment" /><br> ver <input type="text"
        name="ver" id="ver" value="1.0" /><br>
    </p>

    <p>
      <strong>Order Information</strong><br> order_no <input
        type="text" name="order_no" id="order_no" value="123456789" /><br>
      trade_mony <input type="text" name="trade_mony" id="trade_mony"
        value="1004" /><br> user_id <input type="text" name="user_id"
        id="user_id" value="anusorn_pn2" /><br> good_name <input
        type="text" name="good_name" id="good_name" value="test product" /><br>
      order_first_name <input type="text" name="order_first_name"
        id="order_first_name" value="hong" /><br> order_last_name <input
        type="text" name="order_last_name" id="order_last_name"
        value="gildong" /><br> order_city <input type="text"
        name="order_city" id="order_city" value="Seoul" /><br>
      order_addr <input type="text" name="order_addr" id="order_addr"
        value="Guro-gu" /><br> order_country <input type="text"
        name="order_country" id="order_country" value="TH" /><br>
      order_email <input type="text" name="order_email" id="order_email"
        value="test@test.co.kr" /><br> order_tel <input type="text"
        name="order_tel" id="order_tel" value="01012341234" /><br>
      order_post_code <input type="text" name="order_post_code"
        id="order_post_code" value="303" /><br> recv_first_name <input
        type="text" name="recv_first_name" id="recv_first_name" value="hong" /><br>
      recv_last_name <input type="text" name="recv_last_name"
        id="recv_last_name" value="gildong" /><br> recv_city <input
        type="text" name="recv_city" id="recv_city" value="Seoul" /><br>
      recv_addr <input type="text" name="recv_addr" id="recv_addr"
        value="Guro-gu" /><br> recv_country <input type="text"
        name="recv_country" id="recv_country" value="Seoul" /><br>
      recv_email <input type="text" name="recv_email" id="recv_email"
        value="test@test.co.kr" /><br> recv_tel <input type="text"
        name="recv_tel" id="recv_tel" value="01012341234" /><br>
      recv_post_code <input type="text" name="recv_post_code"
        id="recv_post_code" value="303" /><br>
    </p>


    <p>
      <strong>Card Information</strong><br>
      <!-- Should not be stored to merchant’s server -->
      card_number <input type="text" name="card_number" id="card_number"
        value="4000000000000002" /><br> expiration_yy <input
        type="text" name="expiration_yy" id="expiration_yy" value="20" /><br>
      expiration_mm <input type="text" name="expiration_mm"
        id="expiration_mm" value="12" /><br> first_card_holder_name
      <input type="text" name="first_card_holder_name"
        id="first_card_holder_name" value="hong" /><br>
      last_card_holder_name <input type="text" name="last_card_holder_name"
        id="last_card_holder_name" value="gildong" /><br>
      cvn <input type="text" name="cvn" id="cvn" value="352" /><br>
    </p>

    <p>
      <strong>Site Information</strong><br> pay_type <input
        type="text" name="pay_type" id="pay_type" value="PACA" /><br>
      currency <input type="text" name="currency" id="currency" value="764" /><br>
      tp_langFlag <input type="text" name="tp_langFlag" id="tp_langFlag"
        value="th" /><br> site_cd <input type="text" name="site_cd"
        id="site_cd" value="A0000187FB" /><br>
    </p>

    <p>
      <strong>One Time Token</strong><br> ott <input type="text"
        name="ott" id="ott" value="" /><br>
    </p>

    <input type="button" value="Request payment"
      onclick="fn_treepay_approve();" />
  </form>
</body>
</html>