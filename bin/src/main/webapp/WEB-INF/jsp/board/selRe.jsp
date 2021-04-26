<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link href="<c:url value="/resources/css/list.css?ver1.4" />" rel="stylesheet">
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="//cdn.rawgit.com/rainabba/jquery-table2excel/1.1.0/dist/jquery.table2excel.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/locale/ko.js"></script> 
<script src="//cdnjs.cloudflare.com/ajax/libs/xlsx/0.16.1/xlsx.core.min.js" type="text/javascript"></script>
<script src="//cdn.tutorialjinni.com/FileSaver.js/1.3.8/FileSaver.js" type="text/javascript"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js" type="text/javascript"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/xlsx/0.16.1/xlsx.js" type="text/javascript"></script>
<script src="//unpkg.com/tableexport@5.2.0/dist/js/tableexport.min.js" type="text/javascript"></script>
<link rel="icon" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico" sizes="32x32">
<link rel="icon" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico" sizes="192x192">
<link rel="apple-touch-icon-precomposed" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico">
<meta name="msapplication-TileImage" content="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	
<title>에이텍티앤</title>
	 	<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
		</style>
		<script type="text/javascript"> 
		var mindate;
		$(document).ready(function() {
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function() {
				if (fn_valiChk()) {
					return false;
				}
				formObj.attr("action", "/board/excelDown");
				formObj.attr("method", "post");
	 			formObj.submit();
			});
			//fn_addFile();			
		})	
		
		$(function() {
		    $( "#keyword1" ).datepicker({
		         changeMonth: true,	       
		         dayNames: ['일요일','월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
		         dayNamesMin: ['일','월', '화', '수', '목', '금', '토'], 
		         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
		         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		         buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
		         showOn: "both",	        	 
	        	 currentText: '오늘 날짜', 
	             closeText: '닫기', 
	             dateFormat: "yy-mm-dd",
	            	 onClose: function( selectedDate ) {    
	                        // 시작일(fromDate) datepicker가 닫힐때
	                        // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
	                        $("#keyword2").datepicker( "option", "minDate", selectedDate );
	        }            	 
		  });
		  	//초기값을 오늘 날짜로 설정
	        $('#keyword1').datepicker('setDate', 'today-1M'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
		});
		
		$(function() {															
		    $( "#keyword2" ).datepicker({		    	
		         changeMonth: true,	       
		         dayNames: ['일요일','월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
		         dayNamesMin: ['일','월', '화', '수', '목', '금', '토'], 
		         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
		         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		         buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
		         showOn: "both",
		         //minDate: mindate(),
	        	 currentText: '오늘 날짜', 
	             closeText: '닫기', 
	             dateFormat: "yy-mm-dd",
	            	 onClose: function( selectedDate ) {
	                        // 종료일(toDate) datepicker가 닫힐때
	                        // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
	                        $("#keyword1").datepicker( "option", "maxDate", selectedDate );
	                    } 		                         	 
		  });
		  	//초기값을 오늘 날짜로 설정
	        $('#keyword2').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)	        
		});

		
			
	
</script>
</head>
<body>
	<div id="root">
		<header>
			<h1>등록내역 레포트 출력(기간설정)</h1>
		</header>		
		<div>
			<%@include file="nav.jsp"%>
		</div>
		<br>
		<br>
		<form name="writeForm" method="post" action="/board/excelDown" enctype="multipart/form-data">
		<label for="Start">*출력기간</label><br>
							<input type="text"
								id="keyword1" name="keyword1" class="chk" size="12" title="접수일자를 선택하세요." style="width: 40%;" />
							<label for="End">~</label>	
							<input type="text"
								id="keyword2" name="keyword2" class="chk" size="12" title="접수일자를 선택하세요." style="width: 40%;" />
								<button class="write_btn btn btn-success" type="submit"> 조회 </button>
								<br>
		</form>
	</div>
</body>
</html>