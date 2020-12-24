<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
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
<body>
	<form role="form" method="get" action="servlet" >				
			<c:forEach items="${OCR}" var="OCR">
					<label for="OCR">서버에서 찾은 고속사 :</label>					
					<input type="text" id="OCR"
					name="OCR"  value="${OCR.CO_NM}" style="width:30%;"/>
			</c:forEach>
	</form>
</body>
</html>