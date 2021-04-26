<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>

<meta charset="UTF-8">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>에이텍 티앤</title>
</head>

<style type="text/css">
#root button{
	font-size :2.0em;
}

#root{
	font-size :4.0em;
}

</style>
<script src="/resources/js/app_20200818r1.min.js?ver1.3"></script>
<!--  <link href="<c:url value="/resources/css/list.css?ver1.5" />" rel="stylesheet"> -->
<body>
<div id = root>
	<p>검색한 차량의 정보가 없습니다.</p>
	<button type="submit" class="btn btn-info" data-section="adult" onclick="location.href='/board/ocr'">돌아가기</button>
</div>	
</body>
<script>
	alert("검색한 차량의 정보가 없습니다");
	opener.parent.document.getElementById('qrcode').style.visibility="hidden";
	window.close();
</script>
</html>