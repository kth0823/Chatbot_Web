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
<link href="<c:url value="/resources/css/other.css?ver1.5" />" rel="stylesheet">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="icon" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico" sizes="32x32">
<link rel="icon" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico" sizes="192x192">
<link rel="apple-touch-icon-precomposed" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico">
<meta name="msapplication-TileImage" content="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico">
	
<title>에이텍티앤</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='readForm']");

		// 수정 
		$(".update_btn").on("click", function() {
			formObj.attr("action", "/board/updateView");
			formObj.attr("method", "get");
			formObj.submit();
		})

		// 삭제
		$(".delete_btn").on("click", function() {
			var deleteYN = confirm("삭제하시겠습니까?");
			if (deleteYN == true) {

				formObj.attr("action", "/board/delete");
				formObj.attr("method", "post");
				formObj.submit();

			}
		})
		// 목록
		$(".list_btn").on("click", function(){
		
		location.href = "/board/list?page=${scri.page}"
		+"&perPageNum=${scri.perPageNum}"
		+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
		})


		})
		function fn_fileDown(fileNo){
			var formObj = $("form[name='readForm']");
			$("#FILE_NO").attr("value", fileNo);
			formObj.attr("action", "/board/fileDown");
			formObj.submit();
		}

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
</script>
<body>

<div class="container" id="root">
		<header>
			<h1>CSR 상세내역</h1>
		</header>
		<hr />
		<div>
			<%@include file="nav.jsp"%>
		</div>
		<hr />

		<section id="container">
			<form name="readForm" role="form" method="post">
				  <input type="hidden" id="bno" name="bno" value="${read.bno}" />
				  <input type="hidden" id="page" name="page" value="${scri.page}"> 
				  <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
				  <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
				  <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				  <input type="hidden" id="FILE_NO" name="FILE_NO" value=""> 
			</form>

			<div class="form-group">
				<label for="date">접수일자</label><br>
				<input type="text" id="date"
					name="date" value="${read.date}" style="width: 98%;"/>
			</div>
			<div class="form-group">
				<label for="csr_type">접수구분</label><br>
				<!--  <input type="text" id="csr_typeid"
					name="csr_typeid" value="${read.csr_typeid}" />-->
					<select name="csr_type" id="csr_type" class="chk" title="접수구분을 선택하세요." style="width: 98%;">
						<c:forEach var="csr_type" items="${csr_type}" varStatus="i">
							<option value="${csr_type.csr_typeid}" <c:if test="${read.csr_typeid eq csr_type.csr_typeid}">selected</c:if>>${csr_type.csr_type}</option>
						</c:forEach>
					</select>					
			</div>
			<div class="form-group">
				 <label for="co_id">고속사</label><br>
				 <!-- <input type="text" id="co_id"
					name="co_id" value="${read.co_id}" /> -->
					<select name="Co_id" id="Co_id" class="chk" title="고속사를 선택하세요." style="width: 98%;">
						<c:forEach var="co_info" items="${co_info}" varStatus="i">
							<option value="${co_info.co_id}" <c:if test="${read.co_id eq co_info.co_id}">selected</c:if>>${co_info.co_nm}</option>
						</c:forEach>
					</select>				
					
			</div>
			<div class="car_no"><br>
				<label for="car_no">차량번호</label><input type="text" id="car_no"
					name="car_no" value="${read.car_no}" style="width: 98%;" />
			</div>		
			<div class="form-group">
				<label for="pro_date">처리날짜</label><br>
				<input type="text" id="pro_date"
					name="pro_date" value="${read.pro_date}" style="width: 98%;"/>
			</div>			
			<div class="form-group">
				<label for="csr_reqid">요청(대분류)</label><br>
			<!-- 	<input type="text" id="csr_reqid"
					name="csr_reqid" value="${read.csr_reqid}" /> -->
					<%@include file="csr_req.jsp"%>
					<select name="Csr_reqid" id="Csr_reqid" class="chk" title="접수대분류를 선택하세요." style="width: 98%;">
						<c:forEach var="csr_req" items="${csr_req}" varStatus="i">
							<option value="${csr_req.csr_reqid}"<c:if test="${read.csr_reqid eq csr_req.csr_reqid}">selected</c:if>>${csr_req.csr_req}</option>
						</c:forEach>
					</select>
			</div>
			<div class="form-group">
				<label for="csr_cont">접수내용</label><br>
				<textarea id="csr_cont" name="csr_cont" style="width: 98%;"><c:out
						value="${read.csr_cont}" /></textarea>
			</div>
			<div class="form-group">
				<label for="fix_areaid">처리지역</label><br><!--  <input type="text" id="fix_areaid"
					name="fix_areaid" value="${read.fix_areaid}" /> -->
					<%@include file="fix_area.jsp"%>
					<select name="Fix_areaid" id="Fix_areaid" class="chk" title="접수지역을 선택하세요." style="width: 98%;">
						<c:forEach var="fix_area" items="${fix_area}" varStatus="i">							
							<option value="${fix_area.fix_areaid}"<c:if test="${read.fix_areaid eq fix_area.fix_areaid}">selected</c:if>>${fix_area.fix_area}</option>
						</c:forEach>
					</select>
					
			</div>

			<div class="form-group">
				<label for="zoneid">처리거점</label><br><!--  <input type="text"
					id="zoneid" name="zoneid" value="${read.zoneid}" />-->
					<select name="zoneid" id="zoneid" class="chk" title="처리지역을 선택하세요." style="width: 98%;">
						<c:forEach var="zone" items="${zone}" varStatus="i">							
							<option value="${zone.zoneid}"<c:if test="${read.zoneid eq zone.zoneid}">selected</c:if>>${zone.zone}</option>
						</c:forEach>
					</select> 					
			</div>
			<div>
				<a href="#" id="viewhidden2" onclick="return false;" class="button">▼처리내역 펼치기</a>
			</div>
		<div id="hidden2" style = "display:none;">	
			<div class="form-group">
				<label for="deviceid">단말기 종류</label><br><!-- <input type="text"
					id="deviceid" name="deviceid" value="${read.deviceid}" />  -->
					 <select name="deviceid" id="deviceid" class="chk" title="요청지역을 선택하세요." style="width: 98%;">
						<c:forEach var="device" items="${device}" varStatus="i">
							<option value="${device.deviceid}"<c:if test="${read.deviceid eq device.deviceid}">selected</c:if>>${device.device}</option>
						</c:forEach>
					</select>
			</div>
			<div class="form-group">
				<label for="fix_ctgid">처리대분류</label><br>
				<!-- <input type="text" id="fix_ctg"
					name="fix_ctg" value="${read.fix_ctg}" />  -->					
					<select name="fix_ctgid" id="fix_ctgid" class="chk" title="처리대분류을 선택하세요." style="width: 98%;">
						<c:forEach var="fix_ctg" items="${fix_ctg}" varStatus="i">
							<option value="${fix_ctg.fix_ctgid}"<c:if test="${read.fix_ctgid eq fix_ctg.fix_ctgid}">selected</c:if>>${fix_ctg.fix_ctg}</option>
						</c:forEach>
					</select>
			</div>
			<div class="form-group">
				<label for="fix_cont">조치내용</label><br>
				<textarea id="fix_cont" name="fix_cont" style="width: 98%;"><c:out
						value="${read.fix_cont}" /></textarea>
			</div>
			<div class="form-group">
				<label for="be_ih">교체전 단말기no</label><br>
				<input type="text"
					id="be_ih" name="be_ih" value="${read.be_ih}" style="width: 98%;"/>
			</div>
			<div class="form-group">
				<label for="af_ih">교체후 단말기no</label><br>
				<input type="text"
					id="af_ih" name="af_ih" value="${read.af_ih}" style="width: 98%;" />
			</div>
			<div class="form-group">
				<label for="etc">기타</label><br>
				<input type="text" id="etc"
					name="etc" value="${read.etc}" style="width: 98%;" />
			</div>
		</div>
			<div class="form-group">
				<label for="userid">처리담당자</label><br><!--  <input type="text"
					id="userid" name="userid" value="${read.userid}" />
					-->
					<select name="userid" id="userid" class="chk" title="작성자를 선택하세요." style="width: 98%;">
						<c:forEach var="user" items="${user}" varStatus="i">
							<option value="${user.userid}"<c:if test="${read.userid eq user.userid}">selected</c:if>>${user.user}</option> 
						</c:forEach>
					</select> 					
			</div>
			<div class="form-group">
				<label for="statusid">접수상태</label><br><!--<input type="text"
					id="statusid" name="statusid" value="${read.statusid}" />   -->
					<select name="statusid" id="statusid" class="chk" title="처리  상태를 선택하세요." style="width: 98%;">
						<c:forEach var="status" items="${status}" varStatus="i">
							<option value="${status.statusid}"<c:if test="${read.statusid eq status.statusid}">selected</c:if>>${status.status}</option>
						</c:forEach>
					</select>					
			</div>
			<div>
				<a href="#" id="viewhidden" onclick="return false;" class="button">▼부품입력 펼치기</a>
			</div>			
		<div id="hidden" style = "display:none;">	
			<div class="form-group">
				<label for="gps_ant">GPS 안테나</label><br>
				<input type="text" id="etc"
					name="gps_ant" value="${read.gps_ant}"  style="width: 98%;"/>
			</div>
			<div class="form-group">
				<label for="audio_cab">오디오 케이블</label><br>
				<input type="text" id="etc"
					name="audio_cab" value="${read.audio_cab}"  style="width: 98%;"/>
			</div>
			<div class="form-group">
				<label for="video_cab">비디오 케이블</label><br>
				<input type="text" id="etc"
					name="video_cab" value="${read.video_cab}" style="width: 98%;" />
			</div>
			<div class="form-group">
				<label for="led_cab">LED 케이블</label><br>
				<input type="text" id="etc"
					name="led_cab" value="${read.led_cab}" style="width: 98%;"/>
			</div>
			<div class="form-group">
				<label for="y_cab">Y 케이블</label><br>
				<input type="text" id="etc"
					name="y_cab" value="${read.y_cab}" style="width: 98%;"/>
			</div>
			<div class="form-group">
				<label for="afc_cab">AFC 케이블</label><br>
				<input type="text" id="etc"
					name="afc_cab" value="${read.afc_cab}" style="width: 98%;"/>
			</div>
			<div class="form-group">
				<label for="bms_cab">BMS 케이블</label><br>
				<input type="text" id="etc"
					name="bms_cab" value="${read.bms_cab}" style="width: 98%;"/>
			</div>
			<div class="form-group">
				<label for="audio_gender">오디오 젠더</label><br>
				<input type="text" id="etc"
					name="audio_gender" value="${read.audio_gender}" style="width: 98%;"/>
			</div>
			<div class="form-group">
				<label for="cushion">쿠션</label><br>
				<input type="text" id="etc"
					name="cushion" value="${read.cushion}" style="width: 98%;"/>
			</div>
			<div class="form-group">
				<label for="lte_ant">LTE 안테나</label><br>
				<input type="text" id="etc"
					name="lte_ant" value="${read.lte_ant}" style="width: 98%;"/>
			</div>
			<div class="form-group">
				<label for="wifi_ant">WIFI 안테나</label><br>
				<input type="text" id="etc"
					name="wifi_ant" value="${read.wifi_ant}" style="width: 98%;"/>
			</div>
			<div class="form-group">
				<label for="print_bar">영수증 프린터 심지봉</label><br>
				<input type="text" id="etc"
					name="print_bar" value="${read.print_bar}" style="width: 98%;"/>
			</div>
			<div class="form-group">
				<label for="hexbolt">육각볼트</label><br>
				<input type="text" id="etc"
					name="hexbolt" value="${read.hexbolt}" style="width: 98%;"/>
			</div>
			<div class="form-group">
				<label for="baseplate">베이스플레이트</label><br>
				<input type="text" id="etc"
					name="baseplate" value="${read.baseplate}" style="width: 98%;"/>
			</div>
		</div>
			<div class="form-group">
				<label for="simple">단순민원 체크</label><br>
				<!--  <input type="text" id="etc"
					name="simple" value="${read.simple}" /> -->
					<select name="simpleid" id="simpleid" class="chk" title="처리  상태를 선택하세요." style="width: 98%;">
						<c:forEach var="simple" items="${simple}" varStatus="i">
							<option value="${simple.simpleid}"<c:if test="${read.simpleid eq simple.simpleid}">selected</c:if>>${simple.simple}</option>
						</c:forEach>
					</select>
			</div>			
			<div class="form-group">
				<c:forEach var="file" items="${file}">
						<a href="#" onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}KB)<br>
				</c:forEach>
			</div>
			
			<div >
			    <button type="button" class="update_btn btn btn-warning">수정하기</button>
					<button type="button" class="delete_btn btn btn-danger">삭제</button>
					<button type="button" class="list_btn btn btn-primary">목록</button>
			</div>
		</section>
		<hr />
	</div>
</body>
</html>