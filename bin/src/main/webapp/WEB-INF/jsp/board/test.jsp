<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="<c:url value="/resources/css/list.css?ver1.5" />" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="<c:url value="/resources/css/other.css?ver1.5" />" rel="stylesheet">
<link rel="icon" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico" sizes="32x32">
<link rel="icon" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico" sizes="192x192">
<link rel="apple-touch-icon-precomposed" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico">
<meta name="msapplication-TileImage" content="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico">

<meta charset="UTF-8">
<title>로그 추출 페이지</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>
 <script type="text/javascript">
     function fileinfo(){
            var file = document.getElementById("file").files[0];
        document.getElementById("table").innerHTML += "<tr><td>파일이름</td><td>"+file.name+"</td></tr>";
        document.getElementById("table").innerHTML += "<tr><td>파일크기</td><td>"+file.size+"</td></tr>";
        document.getElementById("table").innerHTML += "<tr><td>파일타입</td><td>"+file.type+"</td></tr>";
        document.getElementById("table").innerHTML += "<tr><td>파일수정날짜</td><td>"+file.lastModifiedDate+"</td></tr>";   	
 
     }
     function fileread(){
        var file = document.getElementById("file").files[0];
        var reader = new FileReader();
        reader.readAsText(file, "utf-8");
        reader.onload=function(){
            var view=document.getElementById("content");
            var down;
            var setting="";
           	setting=$("input:checkbox[name='setting']:checked").val();
           	if((setting!="GPS")&&(setting!="LTE")){
           		setting=$('input[name=search]').val();
            }            
            view.textContent = reader.result;
            down= reader.result.split("\n");            
            
            var t=0
            var x=new Array();
            var index=new Array();
            var log="";
            var y=new Array();
            var len=down.length-1;            
            for (t=0;t<len;t++){            	
            	x[t]=down[t].indexOf(setting, 0);
            	 if (x[t]!=-1){
            		log+=down[t];
            		log+="\n";	
					if (t==len) break;
                }
            }
              	
            document.getElementById("download").value=log;
          
        };
        reader.onerror = function(event){
            switch(event.target.error.code){
                case error.NOT_FOUND_ERR:
                    alert("읽을 파일을 찾지 못하였습니다..");break;
                case error.SECURITY_ERR:
                    alert("보안상 안전하지 않습니다..");break;
                case error.ABORT_ERR:
                    alert("읽기가 중지되었습니다."); break;
                case error.NOT_READABLE_ERR:
                    alert("읽기 권한이 없습니다."); break;
                case error.ENCODING_ERR:
                    alert("파일 용량이 상한을 초과하였습니다."); break;
 
            }
       
        };
     }
  </script>
  <img src="http://gw.atectn.com/upload/img/logo/atec/2029/IMG_COMP_LOGO_2029.png"/>
 </head>   
 <body>
 	<header>
			<h1>로그분석</h1>
	</header>
    <input id="file" type="file">
    <label for="">추출할 값</label>    
    <input type="checkbox" id="setting" name="setting" value="GPS" style="font-size:6;">GPS</input>
    <input type="checkbox" id="setting"name="setting" value="LTE" style="font-size:6;">LTE</input><br>
    <label for="">검색어</label>
    <input type="text" id="search"name="search" value="" placeholder="검색어를 입력하세요." style="font-size:6;"/>
    <br/>
    <input type="button" onclick="fileinfo()" value="파일 정보">
    <input type="button" onclick="fileread()" value="파일 내용 ">
    <br/>
    <br/>    
    <table id="table"></table>
    <textarea id="content" readonly style="width:90%; height:500px;"></textarea><br><br>
    <label for="">추출된 로그</label><br>
    <textarea id="download" readonly style="width:90%; height:500px;"></textarea>
 </body>
</html>