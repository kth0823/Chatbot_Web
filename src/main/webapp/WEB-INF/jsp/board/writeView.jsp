<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="<c:url value="/resources/css/other.css?ver1.5" />" rel="stylesheet">



<title>에이텍티앤</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='writeForm']");
		$(".write_btn").on("click", function() {
			if (fn_valiChk()) {
				return false;
			}
			formObj.attr("action", "/board/write");
			formObj.attr("method", "post");
 			formObj.submit();
		});
		fn_addFile();
	})
	 /*function fn_valiChk() {
		var regForm = $("form[name='writeForm'] .chk").length;
		for (var i = 0; i < regForm; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	} */

	$(document).ready(function () { // 페이지 document 로딩 완료 후 스크립트 실행 
		var status;
		$("#viewhidden").click(function () { 
			status = $("#hidden").css("display"); 
			if (status == "none") {
				$("#viewhidden").text("▲부품입력항목 접기");				
				 $("#hidden").css("display", "inherit"); 
				 $("#hidden").css("width", "100%");
			 } 
			 else {
				 $("#viewhidden").text("▼부품입력항목 펼치기");				 				 
				 $("#hidden").css("display", "none"); 
				 } 
			 }); 
		});

	$(document).ready(function () { // 페이지 document 로딩 완료 후 스크립트 실행 
		var status; 
		$("#viewhidden2").click(function () { 
			status = $("#hidden2").css("display"); 
			if (status == "none") {
				$("#viewhidden2").text("▲처리내역 접기");				
				 $("#hidden2").css("display", "inherit");
				 $("#hidden2").css("width", "100%"); 
			 } 
			 else {
				 $("#viewhidden2").text("▼처리내역 펼치기");				 				 
				 $("#hidden2").css("display", "none"); 
				 } 
			 }); 
		});

		
	function fn_addFile(){
		var fileIndex = 1;
		//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
		$(".fileAdd_btn").on("click", function(){
			$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
		});
		$(document).on("click","#fileDelBtn", function(){
			$(this).parent().remove();			
		});
	}
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

	$(function() {
	    $( "#Pro_date" ).datepicker({
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
        $('#Pro_date').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
	});
	function close(){		
			self.close();   //자기자신창을 닫습니다.		
	}
</script>
<body>

	<div id="root">
		<header>
			<h1>CSR 입력</h1>
		</header>
		<hr />

		<div>
			<%@include file="nav.jsp"%>
		</div>
		<hr />

		<section id="container">
			<form name="writeForm" method="post" action="/board/write" enctype="multipart/form-data">
				<table id="writedata">
					<tbody>
						<tr>
							<td><label for="Date">*접수일자</label><br>
							<input type="text"
								id="Date" name="Date" class="chk" size="12" title="접수일자를 선택하세요." style="width: 98%;" />								
							</td>
						</tr>  
					 	<tr>
							<td><label for="Csr_typeid">*접수구분</label><br><!-- <input type="text"
								id="Csr_typeid" name="Csr_typeid" class="chk" size="12" title="접수구분 선택하세요." />
								 -->
								 <select name="Csr_typeid" id="Csr_typeid" style="width: 98%;"
								class="chk" title="접수구분을 선택하세요.">
										<option value=" ">	</option>
								<c:forEach var="csr_type" items="${csr_type}" varStatus="i">
										<option value="${csr_type.csr_typeid}">${csr_type.csr_type}</option>
								</c:forEach>
								</select>								 								
							</td>
						</tr>						
						<tr>
							<td><label for="Co_id">*고속사</label><br><!-- <input type="text"
								id="Co_id" name="Co_id" class="chk" title="고속사를 선택하세요." /> --> 								
								<select name="Co_id" id="Co_id" class="chk" title="고속사를 선택하세요."  style="width: 98%;" >										
								<c:forEach var="co_info" items="${co_info}" varStatus="i">
										<option value="${co_info.co_id}">${co_info.co_nm}</option>
								</c:forEach>
								</select>
								</td>
						</tr>
						<tr>
							<td><label for="Car_no">*차량번호</label><br>								
								 <input type="text" id="Car_no" name="Car_no" class="chk" placeholder="차량번호를 입력하세요." style="width: 98%;" />
								</td>
						</tr>
				 		<tr>
							<td><label for="Pro_date">*처리일자</label><br>
							<input type="text"
								id="Pro_date" name="Pro_date" class="chk" size="12" title="처리일자를 선택하세요." style="width: 98%;" />								
							</td>
						</tr> 
					 	<tr>
							<td>
							<label for="Csr_reqid">*접수대분류</label><br>
							<!--  <input type="text"
								id="Csr_reqid" name="Csr_reqid" class="chk" title="대분류를 선택하세요." />-->								
								<select name="Csr_reqid" id="Csr_reqid" class="chk" title="접수대분류를 선택하세요." style="width: 98%;">									
								<c:forEach var="csr_req" items="${csr_req}" varStatus="i">
									<option value="${csr_req.csr_reqid}">${csr_req.csr_req}</option>
									</c:forEach>
								</select>
								</td>
						</tr>
						
						<tr>
							<td><label for="Csr_cont">*접수내용</label><br><textarea
									id="Csr_cont" name="Csr_cont" class="chk"
									title="내용을 입력하세요."style="width: 98%;"></textarea></td>
						</tr>
						
						<tr>
							<td><label for="Fix_areaid">*처리지역</label><br><!--  <input type="text"
								id="Fix_areaid" name="Fix_areaid" class="chk" title="접수지역을 선택하세요." /> --> 								
								<select name="Fix_areaid" id="Fix_areaid" class="chk" title="처리지역을 선택하세요."style="width: 98%;">
									<option value=" ">처리지역을 선택하세요</option>
								<c:forEach var="fix_area" items="${fix_area}" varStatus="i">
									<option value="${fix_area.fix_areaid}">${fix_area.fix_area}</option>
								</c:forEach>
								</select>
								</td>
						</tr>
				 		<tr>
							<td><label for="Zoneid">*처리거점</label><br><!--  <input type="text"
								id="Zoneid" name="Zoneid" class="chk" title="처리지역을 선택하세요." / >-->
							 	<select name="zoneid" id="zoneid" style="width: 98%;"
									class="chk" title="처리지역을 선택하세요.">
										<option value=" ">	</option>
									<c:forEach var="zone" items="${zone}" varStatus="i">
										<option value="${zone.zoneid}">${zone.zone}</option>
									</c:forEach>
								</select>								
								</td>								
						</tr>
						<tr>
							<td>
								<a href="#" id="viewhidden2" onclick="return false;" class="button">▼처리내역 펼치기</a>
							</td>
						</tr> 
						<tbody id="hidden2" style = "display:none;">  
						<tr>
							<td><label for="Deviceid">*단말기종류</label><br><!-- <input type="text"
								id="Deviceid" name="Deviceid" class="chk" title="단말기종류를 선택하세요." />  -->
						 		<select name="deviceid" id="deviceid" 
										class="chk" title="요청지역을 선택하세요." style="width: 98%;">										
									<c:forEach var="device" items="${device}" varStatus="i">
										<option value="${device.deviceid}">${device.device}</option>
									</c:forEach>
								</select>
							</td>
						</tr>  
					 	<tr>
							<td><label for="Fix_ctgid">처리대분류</label><br>
							<!--  <input type="text"
								id="Fix_ctgid" name="Fix_ctgid" class="chk" size="12" title="처리대분류를 선택하세요." /> -->
						 	<select name="Fix_ctgid" id="Fix_ctgid" style="width: 98%;"
										class="chk" title="처리대분류을 선택하세요.">										
									<c:forEach var="fix_ctg" items="${fix_ctg}" varStatus="i">
										<option value="${fix_ctg.fix_ctgid}">${fix_ctg.fix_ctg}</option>
									</c:forEach>
								</select>								
								</td>
						</tr>
						
						
						<tr>
							<td><label for="Fix_cont">조치내용</label><br>
							 <textarea id="Fix_cont" name="Fix_cont" class="chk"
									title="조치내용을 입력하세요." style="width: 98%;"></textarea></td>
						</tr>
						
						
						
						<tr>
							<td><label for="Be_ih">교체전</label><br>
							<input type="text"
								id="Be_ih" name="Be_ih" class="chk" title="교체 전 단말기시리얼넘버를 입력하세요." style="width: 98%;" /></td>
						</tr>
						
							<tr>
							<td><label for="Af_ih">교체후</label><br>
							<input type="text"
								id="Af_ih" name="Af_ih" class="chk" title="교체 후 단말기시리얼넘버를 입력하세요." style="width: 98%;" /></td>
						</tr>
						<tr>
							<td><label for="Etc">기타</label><br>
							<input type="text"
								id="Etc" name="Etc" class="chk" title="메모내역" style="width: 98%;"/></td>
						</tr>
						</tbody> 
						<tr>
							<td><label for="Userid">*처리담당자</label><br><!--  <input type="text"
								id="Userid" name="Userid" class="chk" title="담당자를 선택하세요." /> -->
								<select name="userid" id="userid" style="width: 98%;"
									class="chk" title="작성자를 선택하세요.">
										<option value=" ">	</option>
								<c:forEach var="user" items="${user}" varStatus="i">
										<option value="${user.userid}">${user.user}</option> 
								</c:forEach>
								</select>								
								</td>
						</tr>  
						<tr>
							<td><label for="Statusid">*접수상태</label><br><!--  <input type="text"
								id="Statusid" name="Statusid" class="chk" title="접수상태를 선택하세요." /> -->
					 		<select name="statusid" id="statusid" style="width: 98%;"
									class="chk" title="처리상태을 선택하세요."> 
								<option value=" ">	</option>
								<c:forEach var="status" items="${status}" varStatus="i">
									<option value="${status.statusid}">${status.status}</option>
								</c:forEach>
								</select>
								</td>								
						</tr> 	
						</tbody>						
						<tr> 
							<td>
								<a href="#" id="viewhidden" onclick="return false;" class="button">▼부품입력 펼치기</a>
							</td> 
						</tr>
						<tbody id="hidden" style = "display:none;">												
						<tr>
							<td><label for="Gps_ant">GPS 안테나</label><br> 
							<input type="text"
								id="Gps_ant" name="Gps_ant" class="chk" size="12" title="처리대분류를 선택하세요." style="width: 98%;"/></td>
						</tr>
						<tr>
							<td><label for="Audio_cab">오디오 케이블</label><br>
							 <input type="text"
								id="Audio_cab" name="Audio_cab" class="chk" size="12" title="처리대분류를 선택하세요." style="width: 98%;"/></td>
						</tr>
						<tr>
							<td><label for="Video_cab">비디오 케이블</label><br> 
							<input type="text"
								id="Video_cab" name="Video_cab" class="chk" size="12" title="처리대분류를 선택하세요." style="width: 98%;"/></td>
						</tr>
						<tr>
							<td><label for="Led_cab">LED 케이블</label><br>
							<input type="text"
								id="Led_cab" name="Led_cab" class="chk" size="12" title="처리대분류를 선택하세요." style="width: 98%;"/></td>
						</tr>
						<tr>
							<td><label for="Y_cab">Y 케이블</label><br>
							<input type="text"
								id="Y_cab" name="Y_cab" class="chk" size="12" title="처리대분류를 선택하세요." style="width: 98%;"/></td>
						</tr>
						<tr>
							<td><label for="Afc_cab">AFC 케이블</label><br> 
							<input type="text"
								id="Afc_cab" name="Afc_cab" class="chk" size="12" title="처리대분류를 선택하세요." style="width: 98%;"/></td>
						</tr>
						<tr>
							<td><label for="Bms_cab">BMS 케이블</label><br>
							 <input type="text"
								id="Bms_cab" name="Bms_cab" class="chk" size="12" title="처리대분류를 선택하세요." style="width: 98%;"/></td>
						</tr>
						<tr>
							<td><label for="Audio_gender">오디오 젠더</label><br>
							<input type="text"
								id="Audio_gender" name="Audio_gender" class="chk" size="12" title="처리대분류를 선택하세요." style="width: 98%;"/></td>
						</tr>
						<tr>
							<td><label for="Cushion">쿠션</label><br>
							 <input type="text"
								id="Cushion" name="Cushion" class="chk" size="12" title="처리대분류를 선택하세요." style="width: 98%;"/></td>
						</tr>
						<tr>
							<td><label for="Lte_ant">LTE 안테나</label><br>
							<input type="text"
								id="Lte_ant" name="Lte_ant" class="chk" size="12" title="처리대분류를 선택하세요." style="width: 98%;"/></td>
						</tr>
						<tr>
							<td><label for="Wifi_ant">WIFI 안테나</label><br> 
							<input type="text"
								id="Wifi_ant" name="Wifi_ant" class="chk" size="12" title="처리대분류를 선택하세요." style="width: 98%;"/></td>
						</tr>
						<tr>
							<td><label for="Print_bar">프린트 영수증 심지봉</label><br>
							<input type="text"
								id="Print_bar" name="Print_bar" class="chk" size="12" title="처리대분류를 선택하세요." style="width: 98%;"/></td>
						</tr>
						<tr>
							<td><label for="Hexbolt">육각볼트</label><br>
							<input type="text"
								id="Hexbolt" name="Hexbolt" class="chk" size="12" title="처리대분류를 선택하세요." style="width: 98%;"/></td>
						</tr>
						<tr>
							<td><label for="Baseplate">베이스플레이트</label><br>
							<input type="text"
								id="Baseplate" name="Baseplate" class="chk" size="12" title="처리대분류를 선택하세요." style="width: 98%;"/></td>
						</tr>
						</tbody>
						<tbody>												
						<tr>
							<td><label for="Simple">단순민원여부 체크</label><br> <!-- <input type="text"
								id="Simple" name="Simple" class="chk" size="12" title="처리대분류를 선택하세요." /> -->
								<select name="simpleid" id="simpleid" class="chk" title="처리상태을 선택하세요." style="width: 98%;">
								<option value=" ">단순민원 체크를 선택하세요</option> 								
								<c:forEach var="simple" items="${simple}" varStatus="i">
									<option value="${simple.simpleid}">${simple.simple}</option>
								</c:forEach>
								</select>
								</td>
						</tr>						
						<tr>
							<td id="fileIndex">
							</td>
						</tr>		
						<tr>
							<td>								
								<button class="fileAdd_btn btn btn-info" type="button"> 파일추가 </button>					
					    		<button class="write_btn btn btn-success" type="submit"> 등록 </button>					
							</td>
						</tr>											
						</tbody>				
				</table>
			</form>
		</section>
		<hr />
	</div>
</body>
</html>
