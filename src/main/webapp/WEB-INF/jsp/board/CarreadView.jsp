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
			formObj.attr("action", "/board/CarupdateView");
			formObj.attr("method", "get");
			formObj.submit();
		})

		// 삭제
		$(".delete_btn").on("click", function() {
			var deleteYN = confirm("삭제하시겠습니까?");
			if (deleteYN == true) {

				formObj.attr("action", "/board/Cardelete");
				formObj.attr("method", "post");
				formObj.submit();

			}
		})
		// 목록
		$(".list_btn").on("click", function(){
		
		location.href = "/board/Carlist?page=${scri.page}"
		+"&perPageNum=${scri.perPageNum}"
		+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
		})


		})
		
		
		
	function fn_fileDown(ffileNo){
			var formObj = $("form[name='readForm']");
			$("#fFILE_NO").attr("value", ffileNo);			
			formObj.attr("action", "/board/ffileDown");
			formObj.submit();
		}

	
</script>
<body>

<div class="container" id="root">
		<header>
			<h1>버스 등록 내역</h1>
		</header>
		<hr />
		<div>
			<%@include file="nav.jsp"%>
		</div>
		<hr />

		<section id="container">
			<form name="readForm" role="form" method="post">
				  <input type="hidden" id="cno" name="cno" value="${Carread.cno}" />
				  <input type="hidden" id="page" name="page" value="${scri.page}"> 
				  <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
				  <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
				  <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 				   
			</form>
			<div class="form-group">
				<label for="Co_id">고속사</label><br>
				  <select name="Co_id" id="Co_id" class="chk" title="고속사를 선택하세요." style="width: 98%;">
						<c:forEach var="co_info" items="${co_info}" varStatus="i">
							<option value="${co_info.co_id}" <c:if test="${Carread.co_id eq co_info.co_id}">selected</c:if>>${co_info.co_nm}</option>
						</c:forEach>
					</select>										
			</div>
			<div class="form-group">
				 <label for="car_no">차량번호</label><br>
				  <input type="text" id="car_no" name="car_no" value="${Carread.car_no}" style="width: 98%;" /> 
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