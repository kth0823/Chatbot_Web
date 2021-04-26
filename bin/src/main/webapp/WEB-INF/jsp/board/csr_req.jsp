<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="<c:url value="/resources/css/other.css?ver1.3" />" rel="stylesheet">
		
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
				<c:if test="${!empty csr_req}">

				 <!--  	<select name="Csr_reqid" id="Csr_reqid" style="width: 160px;"
						class="chk" title="접수대분류를 선택하세요.">
						<c:forEach var="csr_req" items="${csr_req}" varStatus="i">
							<option value="${csr_req.csr_reqid}">
							<c:if test="${csr_req.csr_reqid}==${read.csr_reqid}">selected</c:if>${csr_req.csr_req}</option>
						</c:forEach>
					</select> -->

				</c:if>		
</body>

</body>
</html>