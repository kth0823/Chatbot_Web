<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link href="<c:url value="/resources/css/list.css?ver1.4" />" rel="stylesheet">
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="//cdn.rawgit.com/rainabba/jquery-table2excel/1.1.0/dist/jquery.table2excel.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/locale/ko.js"></script>
<!--  <script src="//cdnjs.cloudflare.com/ajax/libs/TableExport/5.2.0/js/tableexport.min.js" type="text/javascript"></script> --> 
<script src="//cdnjs.cloudflare.com/ajax/libs/xlsx/0.16.1/xlsx.core.min.js" type="text/javascript"></script>
<script src="//cdn.tutorialjinni.com/FileSaver.js/1.3.8/FileSaver.js" type="text/javascript"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js" type="text/javascript"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/xlsx/0.16.1/xlsx.js" type="text/javascript"></script>
<script src="//unpkg.com/tableexport@5.2.0/dist/js/tableexport.min.js" type="text/javascript"></script>
	
<title>에이텍티앤</title>
	 	<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
		</style>
		<script type="text/javascript"> 
		function ReportToExcelConverter() { 
			$("#TableToExcel").tableExport({
				filename: "report_"+moment().format('lll')
				,headers : true
				,formats : ["xlsx"]
			,trimWhitespace: true
				,bootstrap : true
				,sheetname : "report" 
			}); 	
		};
</script>
</head>
<body>
	<div id="root">
		<header>
			<h1>CSR 전체내역</h1>
		</header>
		<div>
			<%@include file="nav.jsp"%>
		</div>
		<section id="container">
			<form role="form" method="get" >
					<table id="TableToExcel" border=1 width=auto cellpadding=0 cellspacing=0 class='table table-bordered' align=center style='border-collapse:collapse;' >
					<div class="row">
					<thead>
						<tr>
							<!--  <th>작성자</th>-->
							<th>접수일자</th>
							<th>처리 상태</th>
							<th>처리 대분류</th>												
						</tr>
					</thead>
					</div>	
					<c:forEach items="${list}" var="list">
					<tbody>
							<tr>
	
							<!--  	<td><!-- <c:out value="${list.userid}" /> -->
							<!--  	<c:forEach var="user" items="${user}" varStatus="i">
										<c:if test="${list.userid eq user.userid}">${user.user}</c:if> 
								</c:forEach>
								</td>-->
								<td><c:out value="${list.date}" /></td>								
								<td>
									<!--<c:out value="${list.statusid}" /> -->
									<c:forEach var="status" items="${status}" varStatus="i">
										<c:if test="${list.statusid eq status.statusid}">${status.status}</c:if> 
									</c:forEach>
								</td>
								<td>								
								<!--  <a href="/board/readView?bno=${list.bno}"><c:out value="${list.csr_reqid}" /></a> -->													
									<c:forEach var="csr_req" items="${csr_req}" varStatus="i">
										<a href="/board/readView?bno=${list.bno}"><c:if test="${list.csr_reqid eq csr_req.csr_reqid}">${csr_req.csr_req}</c:if></a>
									</c:forEach>												
								</td>
							</tr>
					</tbody>
					</c:forEach>
					<iframe id="txtArea1" style="display:none"></iframe>
				</table>
				<div class="search row">
					<div class="col-xs-2 col-sm-2">
				  	<select name="searchType" class="form-control">
				      <option value="al"<c:out value="${scri.searchType eq 'al' ? 'selected' : ''}"/>>전체</option>
				      <option value="u"<c:out value="${scri.searchType eq 'u' ? 'selected' : ''}"/>>담당자</option>
				      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>고속사</option>
				      <option value="s"<c:out value="${scri.searchType eq 's' ? 'selected' : ''}"/>>차량번호</option>
				      <option value="d"<c:out value="${scri.searchType eq 'd' ? 'selected' : ''}"/>>처리날짜</option>
				      <option value="r"<c:out value="${scri.searchType eq 'r' ? 'selected' : ''}"/>>처리대분류</option>
				      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>시리얼</option>				
				    </select>
				  </div>
					<div class="col-xs-10 col-sm-10">
						<div class="input-group">
							<input type="text" name="keyword" id="keywordInput"
								value="${scri.keyword}"class="form-control"/>
							<span class="input-group-btn">
								<button id="searchBtn" type="button"class="btn btn-default">검색</button>
							</span>
						</div>
					</div>
					<script>
				    
				      $(function(){
				        $('#searchBtn').click(function() {
				          self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
				        });
				      });   
				    </script>
				  </div>
				<div class="col-md-offset-3">
						<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li><a
								href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
						</c:if>

							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
								<a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
						</c:if>
					</ul>
				</div>
				<input type="button" class="btn btn-info" value="excel 다운" style="width:100px;height:36px;font-weight:bold;" onclick='ReportToExcelConverter();' />				
			</form>
		</section>
		<hr />
	</div>
</body>
</html>