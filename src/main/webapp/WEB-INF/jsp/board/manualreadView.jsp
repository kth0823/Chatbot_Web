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
			formObj.attr("action", "/board/manupdateView");
			formObj.attr("method", "get");
			formObj.submit();
		})

		// 삭제
		$(".delete_btn").on("click", function() {
			var deleteYN = confirm("삭제하시겠습니까?");
			if (deleteYN == true) {

				formObj.attr("action", "/board/mandelete");
				formObj.attr("method", "post");
				formObj.submit();

			}
		})
		// 목록
		$(".list_btn").on("click", function(){
		
		location.href = "/board/manuallist?page=${scri.page}"
		+"&perPageNum=${scri.perPageNum}"
		+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
		})


		})
		
		
		
		function fn_fileDown(mfileNo){
			var formObj = $("form[name='readForm']");
			$("#mFILE_NO").attr("value", mfileNo);
			formObj.attr("action", "/board/mfileDown");
			formObj.submit();
		}

	
</script>
<body>

<div class="container" id="root">
		<header>
			<h1>메뉴얼 등록 내역</h1>
		</header>
		<hr />
		<div>
			<%@include file="nav.jsp"%>
		</div>
		<hr />

		<section id="container">
			<form name="readForm" role="form" method="post">
				  <input type="hidden" id="mno" name="mno" value="${manualread.mno}" />
				  <input type="hidden" id="page" name="page" value="${scri.page}"> 
				  <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
				  <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
				  <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				  <input type="hidden" id="mFILE_NO" name="mFILE_NO" value=""> 
			</form>

			<div class="form-group">
				<label for="date">등록날짜</label><br>
				<input type="text" id="date"
					name="date" value="${manualread.mregdate}" style="width: 98%;"/>
			</div>
			<div class="form-group">
				<label for="MFW">FW</label><br>
				  <input type="text" id="mfw" name="mfw" value="${manualread.mfw}" />										
			</div>
			<div class="form-group">
				 <label for="mcomment">메모</label><br>
				  <input type="text" id="mcomment" name="mcomment" value="${manualread.mcomment}" /> 
			</div>
			<div class="form-group">
				<c:forEach var="manualfile" items="${manualfile}">
						<a href="#" onclick="fn_fileDown('${manualfile.mFILE_NO}'); return false;">${manualfile.mORG_FILE_NAME}</a>(${manualfile.mFILE_SIZE}KB)<br>
				</c:forEach>
			</div>			
			<div>
			    <button type="button" class="update_btn btn btn-warning">수정하기</button>
					<button type="button" class="delete_btn btn btn-danger">삭제</button>
					<button type="button" class="list_btn btn btn-primary">목록</button>
			</div>
		</section>
		<hr />
	</div>
</body>
</html>