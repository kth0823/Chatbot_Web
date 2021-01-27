<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="<c:url value="/resources/css/list.css?ver1.4" />"
	rel="stylesheet">
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script
	src="//cdn.rawgit.com/rainabba/jquery-table2excel/1.1.0/dist/jquery.table2excel.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/locale/ko.js"></script>
<!--  <script src="//cdnjs.cloudflare.com/ajax/libs/TableExport/5.2.0/js/tableexport.min.js" type="text/javascript"></script> -->
<script
	src="//cdnjs.cloudflare.com/ajax/libs/xlsx/0.16.1/xlsx.core.min.js"
	type="text/javascript"></script>
<script src="//cdn.tutorialjinni.com/FileSaver.js/1.3.8/FileSaver.js"
	type="text/javascript"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"
	type="text/javascript"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/xlsx/0.16.1/xlsx.js"
	type="text/javascript"></script>
<script src="//unpkg.com/tableexport@5.2.0/dist/js/tableexport.min.js"
	type="text/javascript"></script>

<title>에이텍티앤</title>
<style type="text/css">
li {
	list-style: none;
	float: left;
	padding: 6px;
}
</style>
<script type="text/javascript">
	// 	function ReportToExcelConverter() {
	// 		$("#TableToExcel").tableExport({
	// 			filename : "report_" + moment().format('lll'),
	// 			headers : true,
	// 			formats : [ "xlsx" ],
	// 			trimWhitespace : true,
	// 			bootstrap : true,
	// 			sheetname : "report"
	// 		});
	// 	};
</script>
</head>
<body>
	<div id="root">
		<header>
<!-- 			<h1>챗봇 조회결과</h1> -->
		</header>
		<section id="container">
			<form role="form" method="get">
				<table id="TableToExcel" border=1 width=auto cellpadding=0
					cellspacing=0 class='table table-bordered' align=center
					style='border-collapse: collapse;'>
	
					<thead>
						<tr>
							<!--  <th>작성자</th>-->
							<td>고속사</td>
							<td>차량번호</td>
							<td>처리 대분류</td>
						</tr>
					</thead>
		
					<c:forEach items="${list2}" var="list2">
						<tbody>
							<tr>

								<td><c:forEach var="co_info" items="${co_info}">
										<c:if test="${list2.co_id eq co_info.co_id}">${co_info.co_nm}</c:if>
									</c:forEach></td>
								<td><c:out value="${list2.car_no}" /></td>
								<td>
									<!--  <a href="/board/readView?bno=${list.bno}"><c:out value="${list.csr_reqid}" /></a> -->
									<c:forEach var="csr_req" items="${csr_req}" varStatus="i">
										<a href="/board/readView?bno=${list2.bno}" target="_blank"><c:if
												test="${list2.csr_reqid eq csr_req.csr_reqid}">${csr_req.csr_req}</c:if></a>
									</c:forEach>
								</td>
							</tr>
						</tbody>
					</c:forEach>

				</table>
			
				<script>
					$(function() {
						$('#searchBtn').click(
								function() {
									self.location = "list2"
											+ '${pageMaker.makeQuery(1)}'
											+ "&searchType1="
											+ $("select option:selected").val()
											+ "&keyword1="
											+ encodeURIComponent($(
													'#keywordInput1').val())
											+ "&searchType2="
											+ $("#search2 option:selected")
													.val()
											+ "&keyword2="
											+ encodeURIComponent($(
													'#keywordInput2').val());
								});
					});
				</script>

				<div class="col-md-offset-3 pt-10">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li><a
								href="list2${pageMaker.makeSearch(pageMaker.startPage - 1)}">◀</a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="idx">
							<li
								<c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
								<a href="list2${pageMaker.makeSearch2(idx)}">${idx}</a>
							</li>
						</c:forEach>
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="list2${pageMaker.makeSearch2(pageMaker.endPage + 1)}">▶</a></li>
						</c:if>
					</ul>
				</div>
				<!-- 				<input type="button" class="btn btn-info" value="excel 다운" -->
				<!-- 					style="width: 100px; height: 36px; font-weight: bold;" -->
				<!-- 					onclick='ReportToExcelConverter();' /> -->
			</form>
		</section>
		<hr />
	</div>
</body>
</html>