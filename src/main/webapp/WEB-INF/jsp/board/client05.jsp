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
	href="//cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css" />
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<link href="<c:url value="/resources/css/chat.css?ver1.0" />"
	rel="stylesheet">
<link rel="icon"
	href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico"
	sizes="32x32">
<link rel="icon"
	href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico"
	sizes="192x192">
<link rel="apple-touch-icon-precomposed"
	href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico">
<meta name="msapplication-TileImage"
	content="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico">

<title>챗봇</title>


<script>
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
										
 											 var txt_co = document.getElementById("co_info"); 
 											 var txt_car = document.getElementById("Car_no");
 											
											
											 searchR = '<li class="other"id="viewhidden2" >'
													+ '<div class="avatar">'
													+ '<img src="/resources/images/ATECTN.png" />'
													+ '</div>'
													+ '<div class="messages">'
													+  '<p>'+txt_co.value+' '+txt_car.value+' 챗봇 조회 결과.</p>'
													+ '</div>' + '</li>	';
											

											$(searchR).insertBefore('#self_sq');
											$(links).insertBefore("#self_sq");

											//$("#discuss").append(links);

											$('#result').scrollTop($("#result")[0].scrollHeight);	

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

	
</script>
</head>
<body>


	<div class="container">

		<div id="cardbox" class="ui blue fluid card">

			<!-- 결과 표시 -->
			<h4 class="ui horizontal divider header">
				<script type="text/javascript">
        document.write(sendtime);</script>
			</h4>
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
						<div class="avatar">
							<img src="/resources/images/user.png" class="s_img" />
						</div>
						<div class="messages">
							<p>조회조건</p>

							<img src="/resources/images/office-building.png" /> <input
								type="text" id="co_info" name="co_info" class="chk"
								placeholder="고속사 입력" style="width: 70%;" /><br> <img
								src="/resources/images/bus.png" /> <input type="text"
								id="Car_no" name="Car_no" class="chk" placeholder="차량번호 입력"
								style="width: 70%;" /><br>
							<button class="btn btn-success" id="viewhidden">조회</button>
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