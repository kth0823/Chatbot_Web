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
<c:url value="/images/ATECTN.png" var="logo"/>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.3.0/socket.io.js"></script> 
	
	<title>챗봇</title>
	
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css" />

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
			<!-- height:14em;			-->
			width : 92%;
			height:92%;
		
			overflow:auto;
		}
		
		
		.discussion {
		  	list-style: none;
			width : 100%;
			height:100%;
		  	background: #ededed;
		  	margin: 0;
		  	padding: 0 0 50px 0;
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
		  	background: yellow;
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
	<script>
		var host;
		var port;
		var socket;
		
		// 문서 로딩 후 실행됨
		$(function() {

			// 연결하기 버튼 클릭 처리
			$("#connectButton").bind('click', function(event) {
				println('connectButton이 클릭되었습니다.');
				
                   //host = $('#hostInput').val();
                   //port = $('#portInput').val();
					
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

			// 전송 버튼 클릭 시 처리
            $("#add").bind('click', function(event) {	
           		host="http://localhost/";
				port="8080";
				connectToServer(); 
				var data = "CSR이 등록되었습니다.";
           		addToDiscussion2('other', data);
           		self.location = "client041";
           		
          	});

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
		/*
		function addToDiscussion(writer, msg) {
			println("addToDiscussion 호출됨 : " + writer + ", " + msg);
			var now=new Date();
			var sendtime = {};
			var i=0;			
			sendtime[i]=(now.getMonth() + 1) + "월 " + now.getDate() + "일 " + now.getHours() + "시 " + now.getMinutes() + "분 ";  
			
			var img = '/resources/images/ATEC T&.png';
			if (writer == 'other') {
				img = '/resources/images/ATEC T&.png';
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
		*/
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
		    <h4 class="ui horizontal divider header">메시지</h4>
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
			      <div class="avatar">
			        <img src="/resources/images/ATECTN.png" />
			      </div>
			      <div class="messages">
			        <p>CSR 항목을 입력하세요</p>
			        <form name="writeForm" method="post" action="/board/writechat" enctype="multipart/form-data"> 
			        <!--  <form name="writeForm" enctype="multipart/form-data"> -->
					<label for="co_info">고속사</label>
					<select name="Co_id" id="Co_id" class="chk" title="고속사를 선택하세요.">
										<option value=" ">고속사를 선택하세요</option>
								<c:forEach var="co_info" items="${co_info}" varStatus="i">
										<option value="${co_info.co_id}">${co_info.co_nm}</option>
								</c:forEach>
								</select>
					<br>
					<label for="device">단말기</label>
					<select name="deviceid" id="deviceid" class="chk" title="단말기 선택하세요.">
										<option value=" ">단말기를 선택하세요</option>
									<c:forEach var="device" items="${device}" varStatus="i">
										<option value="${device.deviceid}">${device.device}</option>
									</c:forEach>
								</select>
								<br>
					<label for="device">등    록</label>
					<button type="submit" id="add">등   록</button><br>
					</form>					
			      </div>
			    </li>
			  </ol>
			
			</div>
			
		</div>
		
	</div>

</body>
</html>