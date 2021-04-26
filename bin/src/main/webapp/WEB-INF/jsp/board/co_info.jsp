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
	<style>
		* {
			padding:0;
			margin:0;
			box-sizing:border-box;
		}
		
		html {
			width:100%;
			height:100%;
		}
		
		body {
			width:100%;
			height:100%;
			color: #000;
			background-color: #fff;
		}
				
		.container {
			width:100%;
			height:100%;
			display:flex;
			flex-flow:column wrap;
			align-items:center;
			justify-content:center;
		}

		#cardbox {
			width:94%;
			height:94%;
			padding-left:0.4em;
			padding-right:0.4em;
			padding-top : 0.4em;
		}

		#iconImage {
			display:inline;
		}
		
		#titleText {
			font-size:1.4em;
			font-weight:bold;
			color:#777;
		}
		
		#contentsText {
			color:#999;
		}
		
		#result {			
			width :100%;
			height:100%;		
			overflow:auto;
		}
		
		
		.discussion {
		  	list-style: none;
			width : 100%;
			height:100%;
		  	background: #ededed;
		  	margin: 0;
		  	padding: 0 0 50px 0;
		  	overflow:auto;
		}
		
		.discussion li {
		  	padding: 0.5em;
		  	overflow: hidden;
		  	display: flex;
		}
		
		.discussion .avatar {
		  	width: 40px;
		  	position: relative;
		}
		
		.discussion .avatar img {
		  	display: block;
		  	width: 100%;
		}
		
		.other .avatar:after {
		  	content: "";
		  	position: absolute;
		  	top: 0;
		  	right: 0;
		  	width: 0;
		  	height: 0;
		  	border: 5px solid white;
		  	border-left-color: transparent;
		  	border-bottom-color: transparent;
		}
		
		.self {
		  	justify-content: flex-end;
		  	align-items: flex-end;
		}
		
		.self .messages {
		  	order: 1;
		  	border-bottom-right-radius: 0;
		}
		
		.self .avatar {
		  	order: 2;
		}
		
		.self .avatar:after {
		  	content: "";
		  	position: absolute;
		  	bottom: 0;
		  	left: 0;
		  	width: 0;
		  	height: 0;
		  	border: 5px solid white;
		  	border-right-color: transparent;
		  	border-top-color: transparent;
		  	box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
		}
		
		.messages {
		  	background: white;
		  	padding: 10px;
		  	border-radius: 2px;
		  	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
		}
		
		.messages p {
		  	font-size: 0.8em;
		  	margin: 0 0 0.2em 0;
		}
		
		.messages time {
		  	font-size: 0.7em;
		  	color: #ccc;
		}
		
		
	</style>

<style type="text/css">
li {
	list-style: none;
	display: inline;
	padding: 6px;
}
</style>
<script type="text/javascript">
<script>
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
				<c:if test="${!empty co_info}">
					<label for="Co_id">*고속사</label>
				 	<select name="Co_id" id="Co_id" class="chk" title="고속사를 선택하세요.">
						<option value="">     </option>
						<c:forEach var="co_info" items="${co_info}" varStatus="i">							
							<option value="${co_info.co_id}">${co_info.co_nm}</option>
							<!--<c:if test="${co_info}==${read.co_id}">selected</c:if>${co_info.co_nm}</option> -->
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