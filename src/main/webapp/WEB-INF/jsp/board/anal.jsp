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
<link rel="icon" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico" sizes="32x32">
<link rel="icon" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico" sizes="192x192">
<link rel="apple-touch-icon-precomposed" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico">
<meta name="msapplication-TileImage" content="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico">

	
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
			<h1>장애분석</h1>
		</header>		
		<div>
			<%@include file="nav.jsp"%>
		</div>
		<br>
		<br>		
		<c:forEach items="${tot}" var="tot">
				<label for="tatal">한달 발생건 :</label> 
				<c:out value="${tot.NUM}" />
		</c:forEach>		
		<br><br>		
		
		<table id="comp" border=1 width=auto cellpadding=0 cellspacing=0 class='table table-bordered' align=center style='border-collapse:collapse;' >
					<label>1달내 중복요청건</label>
					<div class="row">				
					<thead>
						<tr>
							<!--  <th>작성자</th>-->
							<th>차량번호</th>
							<th>고속사 </th>
							<th>처리 대분류</th>												
						</tr>
					</thead>
					</div>	
					<c:forEach items="${comp}" var="comp">
					<tbody>
							<tr>
								<td><c:out value="${comp.car_no}" /></td>								
								<td>									
									<c:forEach var="co_info" items="${co_info}" varStatus="i">
										<c:if test="${comp.co_id eq co_info.co_id}">${co_info.co_nm}</c:if> 
									</c:forEach>
								</td>
								<td>																					
									<c:forEach var="csr_req" items="${csr_req}" varStatus="i">
										<c:if test="${comp.csr_reqid eq csr_req.csr_reqid}">${csr_req.csr_req}</c:if> 
									</c:forEach>												
								</td>
							</tr>
					</tbody>
					</c:forEach>
						
		<section id="container">		
			<form role="form" method="get" >
					<table id="TableToExcel" border=1 width=auto cellpadding=0 cellspacing=0 class='table table-bordered' align=center style='border-collapse:collapse;' >
					<label>1달간 장애발생 현황</label>
					<div class="row">
					<thead>
						<tr>
							<!--  <th>작성자</th>-->
							<th>순위</th>						
							<th>처리 대분류</th>
							<th>발생건수</th>												
						</tr>
					</thead>
					</div>	
					<c:forEach items="${anal1}" var="anal1">
					<tbody>
							<tr>
	
		
								<td><c:out value="I" /></td>								
								<td>								
									<c:forEach var="csr_req" items="${csr_req}" varStatus="i">
										<c:if test="${anal1.CSR_REQID eq csr_req.csr_reqid}">${csr_req.csr_req}</c:if></a>
									</c:forEach>												
								</td>								
								<td>								
									<c:out value="${anal1.NUM}" />	 							
								</td>
							</tr>
					</tbody>
					</c:forEach>
					<iframe id="txtArea1" style="display:none"></iframe>
				</table>
				</section>
				<br>
		
		<table id="coinfo" border=1 width=auto cellpadding=0 cellspacing=0 class='table table-bordered' align=center style='border-collapse:collapse;' >
					<label>1달간 고속사 요청건</label>
					<div class="row">								
					<thead>
						<tr>
							<!--  <th>작성자</th>-->
							<th>순위</th>
							<th>고속사 </th>							
							<th>발생건수</th>												
						</tr>
					</thead>
					</div>	
					<c:forEach items="${anal2}" var="anal2">
					<tbody>
							<tr>
	
		
								<td><c:out value="I" /></td>								
								<td>								
									<c:forEach var="co_info" items="${co_info}" varStatus="i">
										<c:if test="${anal2.CO_ID eq co_info.co_id}">${co_info.co_nm}</c:if></a>
									</c:forEach>												
								</td>								
								<td>								
									<c:out value="${anal2.NUM}" />	 							
								</td>
							</tr>
					</tbody>
					</c:forEach>
				
		<hr />
	</div>
</body>
</html>