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
	<link href="<c:url value="/resources/css/other.css?ver1.4" />" rel="stylesheet">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
<title>게시판</title>
</head>
<script type="text/javascript">
	$(document).ready(
			function() {
				var formObj = $("form[name='updateForm']");

				$(document).on("click","#fileDel", function(){
					$(this).parent().remove();
				})
				
				fn_addFile();

				$(".cancel_btn").on(
						"click",
						function() {
							event.preventDefault();
							location.href = "/board/readView?bno=${update.bno}"
									+ "&page=${scri.page}"
									+ "&perPageNum=${scri.perPageNum}"
									+ "&searchType=${scri.searchType}"
									+ "&keyword=${scri.keyword}";
						})

				$(".update_btn").on("click", function() {
				/*	if (fn_valiChk()) {
						return false;
					} */
					formObj.attr("action", "/board/update");
					formObj.attr("method", "post");
					formObj.submit();
				})
			})

	/* function fn_valiChk() {
		var updateForm = $("form[name='updateForm'] .chk").length;
		for (var i = 0; i < updateForm; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}*/

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
	var fileNoArry = new Array();
	var fileNameArry = new Array();
	function fn_del(value, name){
			
		fileNoArry.push(value);
		fileNameArry.push(name);
		$("#fileNoDel").attr("value", fileNoArry);
		$("#fileNameDel").attr("value", fileNameArry);
	}
			
</script>
<body>

	<div id="root">
		<header>
			<h1>CSR 수정 화면</h1>
		</header>
		<hr />

		<div>
			<%@include file="nav.jsp"%>
		</div>
		<hr />

		<section id="container">
			<form name="updateForm" role="form" method="post"
				action="/board/update" enctype="multipart/form-data">
				<input type="hidden" name="bno" value="${update.bno}"
					readonly="readonly" />
				<input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
				<input type="hidden" id="fileNameDel" name="fileNameDel[]" value=""> 
				<table id="writedata">
					<tbody>

						<tr>
							<td><label for="date">접수일자</label><input type="text"
								id="date" name="date" value="${update.date}" class="chk"
								title="접수일자를 선택하세요."  style="width: 98%;"/></td>
						</tr>
						<tr>
							<td><label for="csr_typeid">접수구분</label><!-- <input type="text"
								id="csr_typeid" name="csr_typeid" value="${update.csr_typeid}" class="chk"
								title="접수일자를 선택하세요." />  -->
								<select name="csr_typeid" id="csr_typeid" class="chk" title="접수구분을 선택하세요." style="width: 98%;">
									<c:forEach var="csr_type" items="${csr_type}" varStatus="i">
									<option value="${csr_type.csr_typeid}" <c:if test="${update.csr_typeid eq csr_type.csr_typeid}">selected</c:if>>${csr_type.csr_type}</option>
									</c:forEach>
								</select>
								</td>
						</tr>						
						<tr>
							<td><label for="co_id">고속사</label><!--  <input type="text"
								id="co_id" name="co_id" value="${update.co_id}" class="chk"
								title="고속사를 선택하세요." /> -->
								<select name="Co_id" id="Co_id" style="width: 98%;"
									class="chk" title="고속사를 선택하세요.">
									<c:forEach var="co_info" items="${co_info}" varStatus="i">
									<option value="${co_info.co_id}" <c:if test="${update.co_id eq co_info.co_id}">selected</c:if>>${co_info.co_nm}</option>
									</c:forEach>
								</select>	
							</td>
						</tr>
						<tr>
							<td><label for="car_no">차량번호</label><input type="text"
								id="car_no" name="car_no" value="${update.car_no}" class="chk"
								title="차량번호를 입력하세요." style="width: 98%;"/></td>
						</tr>
						<tr>
							<td><label for="pro_date">처리날짜</label><input type="text"
								id="pro_date" name="pro_date" value="${update.pro_date}" class="chk"
								title="처리날짜를 선택하세요." style="width: 98%;" /></td>
						</tr>

						<tr>
							<td><label for="csr_reqid">접수대분류</label><!--  <input type="text"
								id="csr_reqid" name="csr_reqid" value="${update.csr_reqid}"
								class="chk" title="대분류를 선택하세요." /> -->
								<%@include file="csr_req.jsp"%>
								<select name="Csr_reqid" id="Csr_reqid" class="chk" title="접수대분류를 선택하세요." style="width: 98%;">
									<c:forEach var="csr_req" items="${csr_req}" varStatus="i">
										<option value="${csr_req.csr_reqid}"<c:if test="${update.csr_reqid eq csr_req.csr_reqid}">selected</c:if>>${csr_req.csr_req}</option>
									</c:forEach>
								</select>
								</td>
						</tr>

						<tr>
							<td><label for="csr_cont">접수내용</label> <textarea
									id="csr_cont" name="csr_cont" class="chk" title="내용을 입력하세요." style="width: 98%;"><c:out
										value="${update.csr_cont}" /></textarea></td>
						</tr>

						<tr>
							<td><label for="fix_areaid">처리거점</label><!-- <input type="text"
								id="fix_areaid" name="fix_areaid" value="${update.fix_areaid}"
								class="chk" title="접수지역을 선택하세요." />  -->
								<%@include file="fix_area.jsp"%>
									<select name="Fix_areaid" id="Fix_areaid" class="chk" title="처리지역을 선택하세요." style="width: 98%;">
									<c:forEach var="fix_area" items="${fix_area}" varStatus="i">							
										<option value="${fix_area.fix_areaid}"<c:if test="${update.fix_areaid eq fix_area.fix_areaid}">selected</c:if>>${fix_area.fix_area}</option>
									</c:forEach>
									</select>
								
								</td>
						</tr>
						<tr>
							<td><label for="zoneid">접수지역</label>
							<!--  <input type="text"
								id="zoneid" name="zoneid" value="${update.zoneid}" class="chk"
								title="처리지역을 선택하세요." /> -->
								<%@include file="zone.jsp"%>
								<select name="zoneid" id="zoneid" class="chk" title="접수지역을 선택하세요." style="width: 98%;">
									<c:forEach var="zone" items="${zone}" varStatus="i">										
											<option value="${zone.zoneid}"<c:if test="${update.zoneid eq zone.zoneid}">selected</c:if>>${zone.zone}</option>
									</c:forEach>
								</select> 
								</td>
						</tr>
						</tbody>
						<tr>
							<td>
								<a href="#" id="viewhidden2" onclick="return false;" class="button">▼처리내역 펼치기</a>
							</td>
						</tr>
						<tbody id="hidden2" style = "display:none;">  						
						<tr>
							<td><label for="deviceid">단말기종류</label><!--  <input type="text"
								id="deviceid" name="deviceid" value="${update.deviceid}"
								class="chk" title="단말기종류를 선택하세요." /> -->
								<select name="deviceid" id="deviceid" class="chk" title="요청지역을 선택하세요." style="width: 98%;">
									<c:forEach var="device" items="${device}" varStatus="i">
										<option value="${device.deviceid}"<c:if test="${update.deviceid eq device.deviceid}">selected</c:if>>${device.device}</option>
									</c:forEach>
								</select>
								</td>
						</tr>
						<tr>
							<td><label for="fix_ctgid">처리대분류</label><!--  <input type="text"
								id="fix_ctgid" name="fix_ctgid" value="${update.fix_ctgid}" class="chk"
								title="조치대분류를 입력하세요." /> -->
								<select name="fix_ctgid" id="fix_ctgid" class="chk" title="요청지역을 선택하세요." style="width: 98%;">
									<c:forEach var="fix_ctg" items="${fix_ctg}" varStatus="i">
										<option value="${fix_ctg.fix_ctgid}"<c:if test="${update.fix_ctgid eq fix_ctg.fix_ctgid}">selected</c:if>>${fix_ctg.fix_ctg}</option>
									</c:forEach>
								</select>
								
								</td>
						</tr>
						<tr>
							<td><label for="fix_cont">조치내용</label> <textarea
									id="fix_cont" name="fix_cont" class="chk" title="조치내용을 입력하세요." style="width: 98%;"><c:out
										value="${update.fix_cont}" /></textarea></td>
						</tr>
						<tr>
							<td><label for="be_ih">교체전</label><input type="text"
								id="be_ih" name="be_ih" value="${update.be_ih}" class="chk"
								title="교체 전 단말기시리얼넘버를 입력하세요."  style="width: 98%;"/></td>
						</tr>
						<tr>
							<td><label for="af_ih">교체후</label><input type="text"
								id="af_ih" name="af_ih" value="${update.af_ih}" class="chk"
								title="교체 후 단말기시리얼넘버를 입력하세요." style="width: 98%;"/></td>
						</tr>
						<tr>
							<td><label for="etc">기타</label><br>
							<input type="text"
								id="etc" name="etc" value="${update.etc}" class="chk"
								title="메모내역을 입력하세요." style="width: 98%;" /></td>
						</tr>
						</tbody>
						<tr>
							<td><label for="userid">처리담당자</label><!--  <input type="text"
								id="userid" name="userid" value="${update.userid}" class="chk"
								title="담당자를 선택하세요." /> -->
								<select name="userid" id="userid" class="chk" title="작성자를 선택하세요." style="width: 98%;">
									<c:forEach var="user" items="${user}" varStatus="i">
										<option value="${user.userid}"<c:if test="${update.userid eq user.userid}">selected</c:if>>${user.user}</option> 
									</c:forEach>
								</select>
								</td>
						</tr>
						<tr>
							<td><label for="statusid">접수상태</label>
							<!-- <input type="text"
								id="statusid" name="statusid" value="${update.statusid}"
								class="chk" title="접수상태를 선택하세요." />   -->
								<select name="statusid" id="statusid" class="chk" title="처리상태을 선택하세요." style="width: 98%;">
									<c:forEach var="status" items="${status}" varStatus="i">
										<option value="${status.statusid}"<c:if test="${update.statusid eq status.statusid}">selected</c:if>>${status.status}</option>
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
							<td><label for="gps_ant">GPS 안테나</label> <input type="text"
								id="gps_ant" name="gps_ant" value="${update.gps_ant}" class="chk"
								title="조치대분류를 입력하세요." style="width: 98%;" /></td>
						</tr>
						<tr>
							<td><label for="audio_cab">오디오 케이블</label> <input type="text"
								id="audio_cab" name="audio_cab" value="${update.audio_cab}" class="chk"
								title="조치대분류를 입력하세요." style="width: 98%;"/></td>
						</tr>
						<tr>
							<td><label for="video_cab">비디오 케이블</label> <input type="text"
								id="video_cab" name="video_cab" value="${update.video_cab}" class="chk"
								title="조치대분류를 입력하세요." style="width: 98%;" /></td>
						</tr>
						<tr>
							<td><label for="led_cab">LED 케이블</label> <input type="text"
								id="led_cab" name="led_cab" value="${update.led_cab}" class="chk"
								title="조치대분류를 입력하세요." style="width: 98%;"/></td>
						</tr>
						<tr>
							<td><label for="y_cab">Y 케이블</label> <input type="text"
								id="y_cab" name="y_cab" value="${update.y_cab}" class="chk"
								title="조치대분류를 입력하세요." style="width: 98%;"/></td>
						</tr>
						<tr>
							<td><label for="afc_cab">AFC 케이블</label> <input type="text"
								id="afc_cab" name="afc_cab" value="${update.afc_cab}" class="chk"
								title="조치대분류를 입력하세요." style="width: 98%;"/></td>
						</tr>
						<tr>
							<td><label for="bms_cab">BMS 케이블</label> <input type="text"
								id="bms_cab" name="bms_cab" value="${update.bms_cab}" class="chk"
								title="조치대분류를 입력하세요." style="width: 98%;"/></td>
						</tr>
						<tr>
							<td><label for="audio_gender">오디오 젠더</label> <input type="text"
								id="audio_gender" name="audio_gender" value="${update.audio_gender}" class="chk"
								title="조치대분류를 입력하세요." style="width: 98%;"/></td>
						</tr>
						<tr>
							<td><label for="cushion">쿠션</label> <input type="text"
								id="cushion" name="cushion" value="${update.cushion}" class="chk"
								title="조치대분류를 입력하세요." style="width: 98%;"/></td>
						</tr>
						<tr>
							<td><label for="lte_ant">LTE 안테나</label> <input type="text"
								id="lte_ant" name="lte_ant" value="${update.lte_ant}" class="chk"
								title="조치대분류를 입력하세요." style="width: 98%;"/></td>
						</tr>
						<tr>
							<td><label for="wifi_ant">WIFI 안테나</label> <input type="text"
								id="wifi_ant" name="wifi_ant" value="${update.wifi_ant}" class="chk"
								title="조치대분류를 입력하세요." style="width: 98%;"/></td>
						</tr>
						<tr>
							<td><label for="print_bar">영수증 프린트 심지봉</label> <input type="text"
								id="print_bar" name="print_bar" value="${update.print_bar}" class="chk"
								title="조치대분류를 입력하세요." style="width: 98%;"/></td>
						</tr>
						<tr>
							<td><label for="hexbolt">육각볼트</label> <input type="text"
								id="hexbolt" name="hexbolt" value="${update.hexbolt}" class="chk"
								title="조치대분류를 입력하세요." style="width: 98%;"/></td>
						</tr>
						<tr>
							<td><label for="baseplate">베이스플레이트</label> <input type="text"
								id="baseplate" name="baseplate" value="${update.baseplate}" class="chk"
								title="조치대분류를 입력하세요." style="width: 98%;"/></td>
						</tr>
						<tr>
							<td><label for="simple">단순민원 여부</label> <!--  <input type="text"
								id="simple" name="simple" value="${update.simple}" class="chk"
								title="조치대분류를 입력하세요." />  -->
								<select name="simpleid" id="simpleid" class="chk" title="처리상태을 선택하세요." style="width: 98%;">
									<c:forEach var="simple" items="${simple}" varStatus="i">
										<option value="${simple.simpleid}"<c:if test="${update.simpleid eq simple.simpleid}">selected</c:if>>${simple.simple}</option>
									</c:forEach>
								</select>
								
								</td>
						</tr>
						<tr>
								<td id="fileIndex">
									<c:forEach var="file" items="${file}" varStatus="var">
									<div>
										<input type="hidden" id="FILE_NO" name="FILE_NO_${var.index}" value="${file.FILE_NO }">
										<input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FILE_NO_${var.index}">
										<a href="#" id="fileName" onclick="return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)
										<button id="fileDel" onclick="fn_del('${file.FILE_NO}','FILE_NO_${var.index}');" type="button" class="btn btn-danger">삭제</button><br>
									</div>
									</c:forEach>
								</td>
							</tr>
					</tbody>
				</table>
				<div>
					<button type="button" class="update_btn btn btn-warning">수정완료</button>
					<button type="submit" class="cancel_btn btn btn-danger">취소</button>
					<button type="button" class="fileAdd_btn btn btn-info">파일추가</button>					
				</div>
			</form>
		</section>
		<hr />
	</div>
</body>
</html>