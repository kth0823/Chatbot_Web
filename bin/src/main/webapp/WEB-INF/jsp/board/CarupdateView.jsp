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
							location.href = "/board/CarreadView?cno=${Carupdate.cno}"
									+ "&page=${scri.page}"
									+ "&perPageNum=${scri.perPageNum}"
									+ "&searchType=${scri.searchType}"
									+ "&keyword=${scri.keyword}";
						})

				$(".update_btn").on("click", function() {
				/*	if (fn_valiChk()) {
						return false;
					} */
					formObj.attr("action", "/board/Carupdate");
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
			<h1>버스 등록 내역 수정 화면</h1>
		</header>
		<hr />

		<div>
			<%@include file="nav.jsp"%>
		</div>
		<hr />

		<section id="container">
			<form name="updateForm" role="form" method="post"
				action="/board/Carupdate" enctype="multipart/form-data">
				<input type="hidden" name="cno" value="${Carupdate.cno}"
					readonly="readonly" />				
				<table id="writedata">
					<tbody>						
						<tr>
							<td><label for="co_id">고속사</label>
								<select name="Co_id" id="Co_id" style="width: 98%;"
									class="chk" title="고속사를 선택하세요.">
									<c:forEach var="co_info" items="${co_info}" varStatus="i">
									<option value="${co_info.co_id}" <c:if test="${Carupdate.co_id eq co_info.co_id}">selected</c:if>>${co_info.co_nm}</option>
									</c:forEach>
								</select> 
							</td>
						</tr>
						<tr>
							<td><label for="Car_no">차량번호</label> <input type="text"
								id="Car_no" name="Car_no" value="${Carupdate.car_no}" class="chk"
								title="메모를 입력하세요." style="width: 98%;"/></td>
						</tr>						
					</tbody>
					</table>
				<div>
					<button type="button" class="update_btn btn btn-warning">수정완료</button>
					<button type="submit" class="cancel_btn btn btn-danger">취소</button>
					<!--  <button type="button" class="fileAdd_btn btn btn-info">파일추가</button> -->					
				</div>				
			</form>
		</section>
		<hr />
	</div>
</body>
</html>