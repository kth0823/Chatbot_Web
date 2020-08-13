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

				$(document).on("click","#mfileDel", function(){
					$(this).parent().remove();
				})
				$(".cancel_btn").on(
						"click",
						function() {
							event.preventDefault();
							location.href = "/board/manualreadView?mno=${manupdate.mno}"
									+ "&page=${scri.page}"
									+ "&perPageNum=${scri.perPageNum}"
									+ "&searchType=${scri.searchType}"
									+ "&keyword=${scri.keyword}";
						})

				$(".update_btn").on("click", function() {
				/*	if (fn_valiChk()) {
						return false;
					} */
					formObj.attr("action", "/board/manupdate");
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
		$("#mfileNoDel").attr("value", fileNoArry);
		$("#mfileNameDel").attr("value", fileNameArry);
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
				action="/board/manupdate" enctype="multipart/form-data">
				<input type="hidden" name="mno" value="${manupdate.mno}"
					readonly="readonly" />
				<input type="hidden" id="mfileNoDel" name="mfileNoDel[]" value=""> 
				<input type="hidden" id="mfileNameDel" name="mfileNameDel[]" value=""> 
				<table id="writedata">
					<tbody>						
						<tr>
							<td><label for="mfw">FW버전</label> <input type="text"
								id="mfw" name="mfw" value="${manupdate.mfw}" class="chk"
								title="조치대분류를 입력하세요." style="width: 98%;"/></td>
						</tr>
						<tr>
							<td><label for="mcomment">메모</label> <input type="text"
								id="mcomment" name="mcomment" value="${manupdate.mcomment}" class="chk"
								title="조치대분류를 입력하세요." style="width: 98%;"/></td>
						</tr>
						<tr>
								<td id="fileIndex">
									<c:forEach var="manualfile" items="${manualfile}" varStatus="var">
									<div>
										<input type="hidden" id="mFILE_NO" name="mFILE_NO_${var.index}" value="${manualfile.mFILE_NO}">
										<input type="hidden" id="mFILE_NAME" name="mFILE_NAME" value="mFILE_NO_${var.index}">
										<a href="#" id="fileName" onclick="return false;">${manualfile.mORG_FILE_NAME}</a>(${manualfile.mFILE_SIZE}KB)<br>
										<button id="mfileDel" onclick="fn_del('${manualfile.mFILE_NO}','mFILE_NO_${var.index}');" type="button" class="btn btn-danger">삭제</button><br>
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