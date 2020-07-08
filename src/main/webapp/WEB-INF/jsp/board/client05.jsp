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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.3.0/socket.io.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link href="<c:url value="/resources/css/list.css?ver1.5" />" rel="stylesheet">
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="//cdn.rawgit.com/rainabba/jquery-table2excel/1.1.0/dist/jquery.table2excel.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/locale/ko.js"></script>
<!--  <script src="//cdnjs.cloudflare.com/ajax/libs/TableExport/5.2.0/js/tableexport.min.js" type="text/javascript"></script> --> 
<script src="//cdnjs.cloudflare.com/ajax/libs/xlsx/0.16.1/xlsx.core.min.js" type="text/javascript"></script>
<script src="//cdn.tutorialjinni.com/FileSaver.js/1.3.8/FileSaver.js" type="text/javascript"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js" type="text/javascript"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/xlsx/0.16.1/xlsx.js" type="text/javascript"></script>
<script src="//unpkg.com/tableexport@5.2.0/dist/js/tableexport.min.js" type="text/javascript"></script>
<link rel="icon" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico" sizes="32x32">
<link rel="icon" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico" sizes="192x192">
<link rel="apple-touch-icon-precomposed" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico">
<meta name="msapplication-TileImage" content="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico">
	
	<title>챗봇</title>
	
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
		width:100%;
		height:100%; 
		frameborder:0;
		
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
		var now=new Date();
		var week = new Array('일', '월', '화', '수', '목', '금', '토');
		var dayName = week[now.getDay()];
		var sendtime=now.getFullYear()+"년 "+(now.getMonth() + 1) + "월 " + now.getDate() + "일 "+dayName+"요일";
		//var searchlinks="/board/list?searchType=al&keyword=%EA%B8%88%ED%98%B8%EA%B3%A0%EC%86%8D";
		
		//var searchlinks="/board/list?"+'${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#Car_no').val());"
		//var links = "<iframe class='searchlink' src='" +searchlinks+ "'/>";
		
		//var objDiv=document.getElementById("hidden");
		//objDiv.scrollTop=objDiv.scrollHeight;
	

		
		$(document).ready(function () { // 페이지 document 로딩 완료 후 스크립트 실행 
			$("#viewhidden").bind('click', function(event){
				//searchlinks="/board/list?searchType=al&keyword=%EA%B8%88%ED%98%B8%EA%B3%A0%EC%86%8D";
				searchlinks="/board/list2" + '${pageMaker.makeQuery(1)}' + "&searchType1=c&keyword1=" + encodeURIComponent($('#co_info').val())+ "&searchType2=s&keyword2=" + encodeURIComponent($('#Car_no').val());
				//searchlinks="/board/list?+'${pageMaker.makeQuery(1)}'+"&searchType=al+ "&keyword=" + encodeURIComponent($('#Car_no').val());";								
				//status = $("#hidden").css("display"); 
				//if (status == "none") {									
				 //	$("#hidden").css("display", "");
				 //window.open(searchlinks, '_blank');
				 links = "<iframe class='searchlink' src='" +searchlinks+ "'/>";
				 $("#discuss").append(links); 
				// } 
				// else {				 					 				 
				// 	$("#hidden").css("display", "none"); 
				// } 
			 }); 
		});

		// 문서 로딩 후 실행됨
		$(function() {

			// 연결하기 버튼 클릭 처리
			$("#connectButton").bind('click', function(event) {
				println('connectButton이 클릭되었습니다.');
				
                   host = $('#hostInput').val();
                   port = $('#portInput').val();

                   connectToServer();
            });

			// 전송 버튼 클릭 시 처리
            $("#sendButton").bind('click', function(event) {
            	var sender = $('#senderInput').val();
            	var recepient = $('#recepientInput').val();
            	var data = $('#dataInput').val();

          		var output = {sender:sender, recepient:recepient, command:'chat', type:'text', data:data};
            	console.log('서버로 보낼 데이터 : ' + JSON.stringify(output));

           		if (socket == undefined) {
             		alert('서버에 연결되어 있지 않습니다. 먼저 서버에 연결하세요.');
           			return;
             	}

           		socket.emit('message', output);
           		
           		addToDiscussion('self', data);
          	});

    		//$("#viewhidden").bind('click', function(event) { 
        		//var url = "/board/list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#Car_no').val());
        		//var searchlink = "/board/list" + '${pageMaker.makeQuery(1)}' + "&searchType=al"+"&keyword=" + encodeURIComponent($('#Car_no').val());
        		//var searchlink = "/board/list" + '${pageMaker.makeQuery(1)}' + "&searchType=al"+"&keyword=244";
        		
        		
    		//status = $("#hidden").css("display"); 
    			//if (status == "none") {    								
    				// $("#hidden").css("display", "");
    				  //$('html').scrollTop('0');    				      				 
    			// } 
    			// else {    				 				 				 
    				// $("#hidden").css("display", "none"); 
    				 
    			// } 
    		//});     		

			// 로그인 버튼 클릭 시 처리
            $("#loginButton").bind('click', function(event) {
            	var id = $('#idInput').val();
            	var password = $('#passwordInput').val();
            	var alias = $('#aliasInput').val();
            	var today = $('#todayInput').val();

            	var output = {id:id, password:password, alias:alias, today:today};
           		console.log('서버로 보낼 데이터 : ' + JSON.stringify(output));

           		if (socket == undefined) {
            		alert('서버에 연결되어 있지 않습니다. 먼저 서버에 연결하세요.');
            		return;
           		}

            	socket.emit('login', output);
            });
			
         	// 결과 지우기 버튼 클릭 시 처리
            $("#clearButton").bind('click', function(event) {
            	$("#result").html('');
            });

        });
           
		// 서버에 연결하는 함수 정의
        function connectToServer() {

        	var options = {'forceNew':true};
        	var url = 'http://' + host + ':' + port;
        	socket = io.connect(url, options);

        	socket.on('connect', function() {
               	println('웹소켓 서버에 연결되었습니다. : ' + url);

                socket.on('message', function(message) {
                	console.log(JSON.stringify(message));

                	println('<p>수신 메시지 : ' + message.sender + ', ' + message.recepient + ', ' + message.command + ', ' + message.data + '</p>');
	            	
                	addToDiscussion('other', message.data);
                });
	
	            socket.on('response', function(response) {
	            	console.log(JSON.stringify(response));
	            	println('응답 메시지를 받았습니다. : ' + response.command + ', ' + response.code + ', ' + response.message);
	            });
	            
	        });

	        socket.on('disconnect', function() {
	        	println('웹소켓 연결이 종료되었습니다.');
	        });

   		}
           
		function println(data) {
			console.log(data);
			//$('#result').append('<p>' + data + '</p>');
		}
		
		function addToDiscussion(writer, msg) {
			println("addToDiscussion 호출됨 : " + writer + ", " + msg);
			var now=new Date();
			var sendtime = {};
			var i=0;			
			sendtime[i]=(now.getMonth() + 1) + "월 " + now.getDate() + "일 " + now.getHours() + "시 " + now.getMinutes() + "분 ";  
			
			var img = '/resources/images/ATECTN.png';
			if (writer == 'other') {
				img = '/resources/images/ATECTN.png';
			}
			
			var contents = "<li class='" + writer + "'>"
						 + "  <div class='avatar'>"
						 + "    <img src='" + img + "' />"
		      			 + "  </div>"
		      			 + "  <div class='messages'>"
		        		 + "    <p>" + msg + "</p>"
		        		 //+ "    <time datetime='2016-02-10 18:30'>showClock()</time>"
						 + "    <time>"+sendtime[i]+"</time>"
		      			 + "  </div>"
		    			 + "</li>";
			
		    println("추가할 HTML : " + contents);
		    //$(".discussion").prepend(contents);
			$(".discussion").append(contents);	
			i++;
		}

		function fn_valiChk() {
			var regForm = $("div[name='search'] .chk").length;
			for (var i = 0; i < regForm; i++) {
				if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		} 	
		//searchlink="/board/list?searchType=al&keyword=%EA%B8%88%ED%98%B8%EA%B3%A0%EC%86%8D";
	 	 
		//$("#discuss").scrollTop($("discuss").prop(scrollHeight));
		//$("#result").scrollTop($("result").prop(scrollHeight));		
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
			
			  <ol class="discussion" id="discuss">
			    <li class="other">
			      <div class="avatar">
			        <img src="/resources/images/ATECTN.png" />
			      </div>
			      <div class="messages">
			        <p>CSR 조회가 선택되었습니다.</p>					
			      </div>
			    </li>
				<li class="self">
			      <div class="avatar" name="search">
			        <img src="/resources/images/user2.png" />
			      </div>
			      <div class="messages">
			        <p>조회조건</p>
					<label for="co_info">고속사</label>
					<input type="text"id="co_info" name="co_info" class="chk" placeholder="고속사를 입력하세요."/><br>
					<!--  <select name="Co_id" id="Co_id" class="chk" title="고속사를 선택하세요.">
										<option value=" ">고속사를 선택하세요</option>													
								<c:forEach var="co_info" items="${co_info}" varStatus="i">
										<option value="${co_info.co_id}">${co_info.co_nm}</option>
								</c:forEach>
					</select>-->					 
					<label for="device">차량번호</label>
					<input type="text"id="Car_no" name="Car_no" class="chk" placeholder="차량번호를 입력하세요."/><br>					
					<button class="btn btn-success" type="button" id="viewhidden">조회</button><br>		
			      </div>
			    </li>
			<!--	<li class="other">
			      <div class="avatar">
			        <img src="/public/images/ATEC T&.png" />
			      </div>
			      <div class="messages">
			        <p>검색조건에 대한 결과입니다.</p>					
			      </div>
			    </li>
				<li class="other">
			      <div class="avatar">
			        <img src="/public/images/ATEC T&.png" />
			      </div>
			      <div class="messages">
			        <p>1번내역</p>
					<label for="co_info">고속사</label> : 금호고속 <br>
					<label for="car_no">차량번호</label> : 2580 <br>
					<label for="device">단말기</label> : 승차단말기(기타) <br>
					<label for="device">날짜</label> : 2020-02-16<br>
			      </div>
			    </li>
				<li class="other">
			      <div class="avatar">
			        <img src="/public/images/ATEC T&.png" />
			      </div>
			      <div class="messages">
			        <p>2번내역</p>
					<label for="co_info">고속사</label> : 금호고속 <br>
					<label for="car_no">차량번호</label> : 2580 <br>
					<label for="device">단말기</label> : 운전자 <br>
					<label for="device">날짜</label> : 2020-01-16<br>
			      </div>
			    </li>
				<li class="other">
			      <div class="avatar">
			        <img src="/public/images/ATEC T&.png" />
			      </div>
			      <div class="messages">
			        <p>3번내역</p>
					<label for="co_info">고속사</label> : 금호고속 <br>
					<label for="car_no">차량번호</label> : 2580 <br>
					<label for="device">단말기</label> : 리코더 <br>
					<label for="device">날짜</label> : 2020-02-13<br>					
			      </div>
			    </li>  -->
			<!--     
				<li class="other">
			      <div class="avatar">
			        <img src="/resources/images/ATECTN.png" />
			      </div>
			      <div class="messages">
			        <p>검색내역에 대한 링크입니다</p>					
					<button type="button"id="search">내역조회</button><br>
			      </div>
			    </li>   -->
			 	<div id="hidden" style = "display:none;">
				  <iframe src="${searchlink}" width="100%" height="100%" frameborder="0"></iframe>
			<!--  	<script>
					document.write(links);
				</script> -->
				 
				<!--  iframe 검색링크 반환 검토내역 
				<iframe src="/board/list?searchType=al&keyword=%EA%B8%88%ED%98%B8%EA%B3%A0%EC%86%8D" width="100%" height="100%" frameborder="0"></iframe> --> 
			</div>
			<%@include file="button.jsp"%>				  			    
			  </ol>
			</div>
	
		</div>
		
	</div>

</body>
</html>