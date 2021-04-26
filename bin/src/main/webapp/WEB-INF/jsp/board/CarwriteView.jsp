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
<link rel="icon" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico" sizes="32x32">
<link rel="icon" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico" sizes="192x192">
<link rel="apple-touch-icon-precomposed" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico">
<meta name="msapplication-TileImage" content="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico">



<title>에이텍티앤</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='writeForm']");
		$(".write_btn").on("click", function() {
			if (fn_valiChk()) {
				return false;
			}
			formObj.attr("action", "/board/Carwrite");
			formObj.attr("method", "post");
 			formObj.submit();
		});
		fn_addFile();
	})
/*	 function fn_valiChk() {
		var regForm = $("form[name='writeForm'] .chk").length;
		for (var i = 0; i < regForm; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	} 
*/		
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

</script>
<body>

	<div id="root">
		<header>
			<h1>차량 등록/삭제 화면</h1>
		</header>
		<hr />

		<div>
			<%@include file="nav.jsp"%>
		</div>
		<hr />

		<section id="container">
			<form name="writeForm" method="post" action="/board/Carwrite" enctype="multipart/form-data">
				<table id="writedata">
					<tbody>						
						<tr>
							<td><label for="">고속사</label><br>								
								<select name="Co_id" id="Co_id" class="chk" title="고속사를 선택하세요."  style="width: 98%;" >										
								<c:forEach var="co_info" items="${co_info}" varStatus="i">
										<option value="${co_info.co_id}">${co_info.co_nm}</option>
								</c:forEach>
								</select>
								</td>
						</tr>
						<tr>
							<td><label for="">차량번호</label><br>								
								 <input type="text" id="Car_no" name="Car_no" class="chk" placeholder="차량번호 8자리를 입력하세요. 예)경기70아 5029" style="width: 98%;" />
								</td>
						</tr>
						<!--  
						<tr>
							<td><label for="">비고</label><br>								
								 <input type="text" id="Comment" name="Comment" class="chk" placeholder="설명을 하세요." style="width: 98%;" />
								</td>
						</tr> -->
						<tr>
							<td>					
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
