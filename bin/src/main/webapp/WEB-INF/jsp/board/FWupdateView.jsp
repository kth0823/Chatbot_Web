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
<link rel="icon" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico" sizes="32x32">
<link rel="icon" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico" sizes="192x192">
<link rel="apple-touch-icon-precomposed" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico">
<meta name="msapplication-TileImage" content="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico">
	
<title>에이텍티앤</title>
</head>
<script type="text/javascript">
	$(document).ready(
			function() {
				var formObj = $("form[name='updateForm']");

				$(document).on("click","#ffileDel", function(){
					$(this).parent().remove();
				})
				$(".cancel_btn").on(
						"click",
						function() {
							event.preventDefault();
							location.href = "/board/FWreadView?Fno=${FWupdate.fno}"
									+ "&page=${scri.page}"
									+ "&perPageNum=${scri.perPageNum}"
									+ "&searchType=${scri.searchType}"
									+ "&keyword=${scri.keyword}";
						})

				$(".update_btn").on("click", function() {
				/*	if (fn_valiChk()) {
						return false;
					} */
					formObj.attr("action", "/board/FWupdate");
					formObj.attr("method", "post");
					formObj.submit();
				})
				fn_addFile();
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
		$("#ffileNoDel").attr("value", fileNoArry);
		$("#ffileNameDel").attr("value", fileNameArry);
	}
			
</script>
<body>

	<div id="root">
		<header>
			<h1>메뉴얼 등록 수정 화면</h1>
		</header>
		<hr />

		<div>
			<%@include file="nav.jsp"%>
		</div>
		<hr />

		<section id="container">
			<form name="updateForm" role="form" method="post"
				action="/board/FWupdate" enctype="multipart/form-data">
				<input type="hidden" name="fno" value="${FWupdate.fno}"
					readonly="readonly" />
				<input type="hidden" id="ffileNoDel" name="ffileNoDel[]" value=""> 
				<input type="hidden" id="ffileNameDel" name="ffileNameDel[]" value=""> 
				<table id="writedata">
					<tbody>						
						<tr>
							<td><label for="fw">FW버전</label> <input type="text"
								id="fw" name="fw" value="${FWupdate.fw}" class="chk"
								title="FW 버전 입력하세요." style="width: 98%;"/></td>
						</tr>
						<tr>
							<td><label for="fcomment">메모</label> <input type="text"
								id="fcomment" name="fcomment" value="${FWupdate.fcomment}" class="chk"
								title="메모를 입력하세요." style="width: 98%;"/></td>
						</tr>
						<tr>
								<td id="fileIndex">
									<c:forEach var="FWfile" items="${FWfile}" varStatus="var">
									<div>
										<input type="hidden" id="fFILE_NO" name="fFILE_NO_${var.index}" value="${FWfile.fFILE_NO}">
										<input type="hidden" id="fFILE_NAME" name="fFILE_NAME" value="mFILE_NO_${var.index}">
										<a href="#" id="fileName" onclick="return false;">${FWfile.fORG_FILE_NAME}</a>(${FWfile.fFILE_SIZE}KB)<br>
										<button id="ffileDel" onclick="fn_del('${FWfile.fFILE_NO}','fFILE_NO_${var.index}');" type="button" class="btn btn-danger">삭제</button><br>
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