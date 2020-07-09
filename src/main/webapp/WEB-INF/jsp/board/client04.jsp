<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>	
	<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1">
	<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="<c:url value="/resources/css/chat.css?ver1.0" />" rel="stylesheet">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="icon" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico" sizes="32x32">
<link rel="icon" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico" sizes="192x192">
<link rel="apple-touch-icon-precomposed" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico">
<meta name="msapplication-TileImage" content="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico">
	
	<title>챗봇</title>
	
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css" />
	
	<script>
		var now=new Date();
		var week = new Array('일', '월', '화', '수', '목', '금', '토');
		var dayName = week[now.getDay()];
		var sendtime=now.getFullYear()+"년 "+(now.getMonth() + 1) + "월 " + now.getDate() + "일 "+dayName+"요일";		
		
		$(function() {
		    $( "#Date" ).datepicker({
		         changeMonth: true,	       
		         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
		         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
		         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
		         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		         buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
		         showOn: "both", 
	        	 minDate: -20, 
	        	 maxDate: "+3D",
	        	 currentText: '오늘 날짜', 
	             closeText: '닫기', 
	             dateFormat: "yy-mm-dd"            	 
		  });
		  	//초기값을 오늘 날짜로 설정
	        $('#Date').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
		});

			  
		function addToDiscussion2(writer, msg) {
			println("addToDiscussion 호출됨 : " + writer + ", " + msg);
			var now=new Date();
			var sendtime = {};
			var i=0;			
			sendtime[i]=(now.getMonth() + 1) + "월 " + now.getDate() + "일 " + now.getHours() + "시 " + now.getMinutes() + "분 ";  
			
			var img = '/resources/images/ATECTN.png';
			if (writer == 'other') {
				img = '/resources/images/ATECTN.png';
			}
			
			var contents = "<li class='other'>"
						 + "  <div class='avatar'>"
						 + "    <img src='" + img + "' />"
		      			 + "  </div>"
		      			 + "  <div class='messages'>"
		        		 + "    <p>CSR이 등록되었습니다.</p>"
		        		 //+ "    <time datetime='2016-02-10 18:30'>showClock()</time>"
						 + "    <time>"+sendtime[i]+"</time>"
		      			 + "  </div>"
		    			 + "</li>";
			
		    println("추가할 HTML : " + contents);
		    //$(".discussion").prepend(contents);
			$(".discussion").append(contents);	
			i++;
		}

		$(document).ready(function() {
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function() {
				if (fn_valiChk()) {
					return false;
				}
				else{
				formObj.attr("action", "/board/writechat");
				formObj.attr("method", "post");
	 			formObj.submit();	 			
				}
			});
		})

		function fn_valiChk() {
			var regForm = $("form[name='writeForm'] .chk").length;
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
		<!--	 <div class="content">
			 	<div class="left floated author">
			 		<img id="iconImage" class="ui avatar image" src="./images/author.png">
				</div>
				<div>
					<div id="titleText" class="header">일대일 채팅</div>
   					<div id="contentsText" class="description">
				       	연결 및 로그인 후 메시지를 보내세요.
				    </div>
				</div>
			 </div>
		
			<br>
			<!-- 연결하기 -->
		  <!--  <div>
		    	<div class="ui input">
		        	<input type="text" id="hostInput" value="localhost" />
		        </div>
		        <div class="ui input">
		        	<input type="text" id="portInput" value="3000" />
		        </div>
				<br><br>
		        <input class="ui primary button" type="button" id="connectButton" value="연결하기" />
		    </div>
		    <br>
		    <!-- 로그인/로그아웃 -->
		    <!--<div>
		    	<div class="ui input">
					<input type="text" id="idInput" value="test01" />
				</div>
				<div class="ui input">
					<input type="password" id="passwordInput" value="123456" />
				</div>
				<div class="ui input">
					<input type="text" id="aliasInput" value="소녀시대" />
				</div>
				<div class="ui input">
					<input type="text" id="todayInput" value="좋은 날!" />
				</div>
				<br><br>
				<input class="ui primary button" type="button" id="loginButton" value="로그인" />
				<input class="ui primary button" type="button" id="logoutButton" value="로그아웃" />
			</div>
		    <br>
		    <!-- 전송하기 -->
		   <!-- <div>
		    	<div class="description">
		    		<span>보내는사람 아이디 :</span> 
		    		<div class="ui input">
		    			<input type="text" id="senderInput" value="test01" />
		    		</div>
		    	</div>
			    <div class="description">
			    	<span>받는사람 아이디 :</span> 
			    	<div class="ui input">
			    		<input type="text" id="recepientInput" value="ALL" />
			    	</div>
			    </div>
			    <div class="description">
			    	<span>메시지 데이터 :</span> 
			    	<div class="ui input">
			    		<input type="text" id="dataInput" value="안녕!"/> 
			    	</div>
			    </div>
				<br>
				<input class="ui primary button" type="button" id="sendButton" value="전송" />
				<input class="ui primary button" type="button" id="clearButton" value="결과 지우기" />
			</div>    
		     
		    <br>
		    
		    <!-- 결과 표시 -->
		    <h4 class="ui horizontal divider header"><script type="text/javascript">
        document.write(sendtime);</script></h4>
			<div class="ui segment" id="result">			
			  <ol class="discussion">
			    <li class="other">
			      <div class="avatar">
			        <img src="/resources/images/ATECTN.png" />
			      </div>
			      <div class="messages">
			        <p>CSR 입력이 선택되었습니다.</p>
			      </div>
			    </li>
				<li class="self">
			      <div class="avatar" >
			        <img src="/resources/images/user.png" class="s_img"/>
			      </div>
			      <div class="messages">
			        <p>CSR 항목을 입력하세요</p>
			        <form name="writeForm" method="post" action="/board/writechat" enctype="multipart/form-data"> 
			        <!--  <form name="writeForm" enctype="multipart/form-data"> -->
			        <img src="/resources/images/calendar.png" />
					<input type="text"
								id="Date" name="Date" class="chk" title="접수일자 선택하세요" style="width: 70%;"/><br>
					<img src="/resources/images/office-building.png" />
					<select name="Co_id" id="Co_id" class="chk" title="고속사를 선택하세요" style="width: 70%;">																			 	 
								<c:forEach var="co_info" items="${co_info}" varStatus="i">
										<option value="${co_info.co_id}">${co_info.co_nm}</option>
								</c:forEach>
								</select>
					<br>
					<img src="/resources/images/bus.png"  />								
								 <input type="text" id="Car_no" name="Car_no" class="chk"  title="차량번호를 선택하세요" placeholder="차량번호 입력" style="width: 70%;" /><br>
					<img src="/resources/images/check.png" />
					<select name="csr_reqid" id="csr_reqid" class="chk" title="접수대분류 선택하세요" style="width: 70%;">										
									<c:forEach var="csr_req" items="${csr_req}" varStatus="i">
										<option value="${csr_req.csr_reqid}">${csr_req.csr_req}</option>
									</c:forEach>
								</select>
								<br>					
					<button class="write_btn btn btn-success" type="submit">등   록</button><br>
					</form>					
			      </div>
			    </li>
			    <%@include file="button.jsp"%>
			  </ol>
			
			</div>
			
		</div>
		
	</div>

</body>
</html>