<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>

<meta charset="UTF-8">
<link rel="shortcut icon" href="https://developers.kakao.com/vassets/img/favicon.ico" type="image/x-icon" />
<!--  <link type="text/css" rel="stylesheet" href="https://t1.daumcdn.net/alvolo/_vision/openapi/r2/css/styles.css" media="screen,projection"> -->
<script type="text/javascript" src="https://t1.daumcdn.net/alvolo/_vision/openapi/r2/js/jquery-3.2.1.min.js"></script>

<link rel="stylesheet" href="https://t1.daumcdn.net/alvolo/_vision/openapi/r2/css/github.min.css">
<script src="https://t1.daumcdn.net/alvolo/_vision/openapi/r2/js/highlight.min.js"></script>


<!--<link type="text/css" rel="stylesheet" href="https://vision-api.kakao.com/static/css/common_20191226.css"> -->
<link rel="stylesheet" type="text/css" href="/resources/css/ocr.css?ver1.1"> 
<link type="text/css" rel="stylesheet" href="/resources/css/styles.css?ver1.2" media="screen,projection">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<meta charset="UTF-8">
<title>에이텍 티앤</title>
</head>

<style type="text/css">
li {
	list-style: none;
	display: inline;
	padding: 6px;
}
</style>
<script src="/resources/js/app_20200818r1.min.js?ver1.3"></script>
<link href="<c:url value="/resources/css/list.css?ver1.5" />" rel="stylesheet">
<body>
<div id = root>
	<form role="form" method="get" action="servlet">				
			<c:forEach items="${OCR}" var="OCR">
					<label for="OCR">서버에서 찾은 고속사 코드 :</label>					
					<input type="text" id="OCR_COID"
					name="OCR_COID" class="OCR_COID" value="${OCR.CO_ID}" style="width:30%;"/><br>
					<label for="OCR">서버에서 찾은 고속사 :</label>
					<input type="text" id="OCR_CONM"
					name="OCR_CONM" class="OCR_CONM" value="${OCR.CO_NM}" style="width:30%;"/><br>
					<label for="OCR">서버에서 찾은 차량번호 :</label>
					<input type="text" id="OCR_CAR_NO"
					name="OCR_CAR_NO" class="OCR_CAR_NO" value="${OCR.CAR_NO}" style="width:30%;"/>
			</c:forEach>
	</form>
</div>	
</body>
<script>
//var co_info=$('#OCR_COID').val();
//var test = "test"
//window.open("ocr.jsp?co_info:"+co_info+"test:"+test);
//location.href="/board/ocr?" + co_info + "/" + test;
opener.document.getElementById("Co_id").value = document.getElementById("OCR_COID").value;
opener.document.getElementById("qr_be").value += document.getElementById("OCR_COID").value;

//document.write(x);
//document.write(y);
</script>
</html>