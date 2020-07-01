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
<link href="<c:url value="/resources/css/other.css?ver1.4" />" rel="stylesheet">
		
<title>에이텍 티앤</title>
</head>

<style type="text/css">
li {
	list-style: none;
	display: inline;
	padding: 6px;
}
</style>
<script type="text/javascript">
function closeWin() {
	var nvua = navigator.userAgent;
	if (nvua.indexOf('MSIE') >= 0){
	if(nvua.indexOf('MSIE 5.0') == -1) {
	top.opener = '';
	}
	} else if (nvua.indexOf('Gecko') >= 0){
	top.name = 'CLOSE_WINDOW';
	wid = window.open('','CLOSE_WINDOW');
	}
	top.close();
	}
</script>
<body>
				<div id=root>	
				<c:if test="${!empty device}">
				   <label for="device">*단말기</label>
			 	   <select name="deviceid" id="deviceid" class="chk" title="요청지역을 선택하세요.">
			 	   		<option value="">     </option>
						<c:forEach var="device" items="${device}" varStatus="i">							
							<option value="${device.deviceid}">${device.device}</option>													
							<!--<c:if test="${device.deviceid}==${read.deviceid}">selected</c:if>${device.device}</option> -->
						</c:forEach>
					</select>  
				</c:if>
				<!-- 	<button class="write_btn btn btn-success" type="submit" href="#" onclick="javascript : var win = window.open('', '_self'); win.close();return false;"> 등록 </button>
				<button class="fileAdd_btn btn btn-info" type="submit" href="#" onclick="javascript : var win = window.open('', '_self'); win.close();return false;"> 이전 </button>		 -->
				<button class="write_btn btn btn-success" type="submit" onclick="location.href='http://localhost:3000/public/client04.html'"> 등록 </button>
				<button class="fileAdd_btn btn btn-info" type="submit" onclick="location.href='http://localhost:3000/public/client04.html'"> 이전 </button>
				</div>		
</body>

</body>
</html>