<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta name="viewport"
	content="width=device-width, height=device-height, initial-scale=1">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.3.0/socket.io.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="<c:url value="/resources/css/list.css?ver1.5" />"
	rel="stylesheet">
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script
	src="//cdn.rawgit.com/rainabba/jquery-table2excel/1.1.0/dist/jquery.table2excel.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/locale/ko.js"></script>
<!--  <script src="//cdnjs.cloudflare.com/ajax/libs/TableExport/5.2.0/js/tableexport.min.js" type="text/javascript"></script> -->
<script
	src="//cdnjs.cloudflare.com/ajax/libs/xlsx/0.16.1/xlsx.core.min.js"
	type="text/javascript"></script>
<script src="//cdn.tutorialjinni.com/FileSaver.js/1.3.8/FileSaver.js"
	type="text/javascript"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"
	type="text/javascript"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/xlsx/0.16.1/xlsx.js"
	type="text/javascript"></script>
<script src="//unpkg.com/tableexport@5.2.0/dist/js/tableexport.min.js"
	type="text/javascript"></script>
<c:url value="/images/ATECTN.png" var="logo" />
<link rel="icon" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico" sizes="32x32">
<link rel="icon" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico" sizes="192x192">
<link rel="apple-touch-icon-precomposed" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico">
<meta name="msapplication-TileImage" content="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico">
	
<title>챗봇</title>

<style>
<style>
		* {
			padding:0;
			margin:0;
			box-sizing:border-box;
  			font-family: "나눔고딕", NanumGothic, "맑은고딕", "Malgun Gothic";
  			font-size: 16;
  			letter-spacing: -1pt;
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
    		/*추가 2020-07-06 : 아래 3줄 테두리 둥글게, 최대4개 입력가능. 왼쪽상단부터 시계방향*/
  			border-radius: 15px;
  			background: #b2c7d9;
  			display: inline-block;  	
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
  			background-color: #b2c7d9;  	
		}
		
		
		.discussion {
		  	list-style: none;
			width : 100%;
			height:100%;
		  	background: #b2c7d9;
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
		  	background: #ffeb33;
		  	border-bottom-right-radius: 0;
  			/*추가 2020-07-06 : 아래 1줄  테두리 둥글게, 최대4군데 입력가능. 왼쪽상단부터 시계방향*/
  			border-radius: 10px 10px 0 10px;  			
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
		  	border: 5px solid #ffeb33;
		  	border-right-color: transparent;
		  	border-top-color: transparent;
		  	box-shadow: 0 1px 5px rgba(0, 0, 0, 0.2);
		}
		
		.messages {
		  	background: white;
		  	padding: 10px;
		  	/*수정 2020-07-06 : 아래 1줄 테두리 둥글게, 최대4개 입력가능. 왼쪽상단부터 시계방향*/
  			border-radius: 0 10px 10px 10px;
		  	box-shadow: 0 1px 5px rgba(0, 0, 0, 0.2);	    			
		}		

		.messages p {
		  	font-size: 0.8em;
		  	margin: 0 0 0.2em 0;
		}
		
		.messages time {
		  	font-size: 0.7em;
		  	color: #ccc;
		}
.searchlink {
	width: 100%;
	height: 100%;
	frameborder: 0;
}
	.messages button {
		  	font-size: 0.5em;		  	
		}	
		
</style>
<script>
	var host;
	var port;
	var socket;
	var search = 0;
	var searchlinks;
	var links;
	var searchR;
	var now=new Date();
	var week = new Array('일', '월', '화', '수', '목', '금', '토');
	var dayName = week[now.getDay()];
	var sendtime=now.getFullYear()+"년 "+(now.getMonth() + 1) + "월 " + now.getDate() + "일 "+dayName+"요일";
	$(document)
			.ready(
					function() { // 페이지 document 로딩 완료 후 스크립트 실행 
						$("#viewhidden")
								.bind(
										'click',
										function(event) {
											searchlinks = "/board/list2"
													+ '${pageMaker.makeQuery(1)}'
													+ "&searchType1=c&keyword1="
													+ encodeURIComponent($(
															'#co_info').val())
													+ "&searchType2=s&keyword2="
													+ encodeURIComponent($(
															'#Car_no').val());

											links = "<iframe class='searchlink' src='" +searchlinks+ "'/>";
										

											searchR = '<li class="other"id="viewhidden2" >'
													+ '<div class="avatar">'
													+ '<img src="/resources/images/ATECTN.png" />'
													+ '</div>'
													+ '<div class="messages">'
													+ '<p> CSR 조회 결과.</p>'
													+ '</div>' + '</li>	';

											$(searchR).insertBefore('#self_sq');
											$(links).insertBefore("#self_sq");
											//$("#discuss").append(links);
										});
					});

	function fn_valiChk() {
		var regForm = $("div[name='search'] .chk").length;
		for (var i = 0; i < regForm; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}
	$(document).ready(function() {
	      $("#discuss").scrollTop($("#discuss")[0].scrollHeight);
	});
</script>
</head>
<body>


	<div class="container">

		<div id="cardbox" class="ui blue fluid card">

			<br>
			<!-- 결과 표시 -->
			<h4 class="ui horizontal divider header"><script type="text/javascript">
        document.write(sendtime);</script></h4>
			<div class="ui segment" id="result">

				<ol class="discussion" id="discuss">
					<li class="other">
						<div class="avatar">
							<img src="/resources/images/ATECTN.png" />
						</div>
						<div class="messages">
							<p>CSR 조회가 선택되었습니다.</p>
						</div>
					</li>
					<li class="self" id="self_sq">
						<div class="avatar" name="search">
							<img src="/resources/images/ATECTN.png" />
						</div>
						<div class="messages">
							<p>조회조건</p>
							<label for="co_info">고속사</label> <input type="text" id="co_info"
								name="co_info" class="chk" placeholder="고속사를 입력하세요." /><br>
							<label for="device">차량번호</label> <input type="text" id="Car_no"
								name="Car_no" class="chk" placeholder="차량번호를 입력하세요." /><br>
							<button type="button" id="viewhidden">조회</button>
							<br>
						</div>
					</li>
		
<%@include file="button.jsp"%>
				</ol>
			</div>

		</div>

	</div>

</body>
</html>