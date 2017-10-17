<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
  src="https://code.jquery.com/jquery-3.2.1.js"
  integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
  crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
	<h3>One Time Token API Validation Result</h3>
	<div id=showBox >
	
	</div>
</body>


<script type="text/javascript">
	$(document).ready(function(){
		var message = '${message}';
		
			if (/^[\],:{}\s]*$/.test(message.replace(/\\["\\\/bfnrtu]/g, '@').
			replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, ']').
			replace(/(?:^|:|,)(?:\s*\[)+/g, ''))) {
				var jsonParse=JSON.parse(message);
				$("#showBox").html('<p>Response : '+jsonParse.res_msg+' ('+jsonParse.res_cd+')</p>');
				console.log(jsonParse);
				if(jsonParse.res_cd=='C475'){
					$("#showBox").append('<a href='+jsonParse.auth_url+'><input type="button" value="Request to pay"></a>');
				}else{
					$("#showBox").append('<a href="${pageContext.request.contextPath}/ott-index"><input type="button"value="Back" /></a>');
				}
				
			}else{

				alert(message);

			}
	})
		


</script>
</html>