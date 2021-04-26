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
<script src="//cdnjs.cloudflare.com/ajax/libs/xlsx/0.16.1/xlsx.core.min.js" type="text/javascript"></script>
<script src="//cdn.tutorialjinni.com/FileSaver.js/1.3.8/FileSaver.js" type="text/javascript"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js" type="text/javascript"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/xlsx/0.16.1/xlsx.js" type="text/javascript"></script>
<script src="//unpkg.com/tableexport@5.2.0/dist/js/tableexport.min.js" type="text/javascript"></script>
<link rel="icon" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico" sizes="32x32">
<link rel="icon" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico" sizes="192x192">
<link rel="apple-touch-icon-precomposed" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico">
<meta name="msapplication-TileImage" content="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	
<title>에이텍티앤</title>
	 	<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
		</style>
		<script type="text/javascript"> 		

		google.charts.load('current', {'packages':['bar']});
	      google.charts.setOnLoadCallback(drawChart);

	      function drawChart() {
		    var tot = document.getElementById("total").value;  
	        var data = google.visualization.arrayToDataTable([ 
				['건수', '건' ],
	        	['기간내 총 발생양', tot]     
	        ]);
	          

	        var options = {
	          chart: {
	            title: '총량',
	            subtitle: '발생건수',
	          }
	        };

	        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

	        chart.draw(data, google.charts.Bar.convertOptions(options));
	      }		
</script>
</head>
<body>
	<div id="root">
		<header>
			<h1>장애분석결과</h1>
		</header>		
		<div>
			<%@include file="nav.jsp"%>
		</div>
		<br>
		<br>	
		<div>
			<p>조회한 기간 : <%= request.getParameter("keyword1") %> ~ <%= request.getParameter("keyword2") %></p> 				 		 
		</div>
		
		<div id="columnchart_material" align=center style="width: auto; height: 500px;"></div>
		<br>		
		<form role="form" method="get" >				
			<c:forEach items="${tot}" var="tot">
					<label for="tatal">발생건 :</label>					
					<input type="text" id="total"
					name="total"  value="${tot.NUM}" style="width: 98%;"/>
			</c:forEach>		
				<br><br>		
		<section id="table1">
		<table id="comp" border=1 width=auto cellpadding=0 cellspacing=0 class='table table-bordered' align=center style='border-collapse:collapse;' >
					<label>기간내 중복요청건</label>
					<div class="row">				
					<thead>
						<tr>
							<!--  <th>작성자</th>-->
							<th>No.</th>
							<th>차량번호</th>
							<th>고속사 </th>
							<th>처리 대분류</th>												
						</tr>
					</thead>
					</div>	
					<c:forEach items="${comp}" var="comp" varStatus="i">
					<tbody id= "elementId">
							<tr>
								<td>								
									<c:out value="${i.count}" />
								</td>
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
					</table>
					</section>
						
		<section id="container">		
			<form role="form" method="get" >
					<table id="TableToExcel" border=1 width=auto cellpadding=0 cellspacing=0 class='table table-bordered' align=center style='border-collapse:collapse;' >
					<label>기간내 장애발생 현황</label>
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
					<c:forEach items="${anal1}" var="anal1" varStatus="i">
					<tbody>
						<tr>
								<td>								
									<c:out value="${i.count}" />
								</td>
																			
								<td>								
									<c:forEach var="csr_req" items="${csr_req}" varStatus="i">
										<c:if test="${anal1.CSR_REQID eq csr_req.csr_reqid}">${csr_req.csr_req}</c:if></a>
									</c:forEach>												
								</td>								
								<td>								
									<c:out value="${anal1.NUM}" />	 							
								</td>
							</tr>
							</c:forEach>
					</tbody>					
					<iframe id="txtArea1" style="display:none"></iframe>
				</table>
				</section>
				<br>
		<section id="table3">
		<table id="coinfo" border=1 width=auto cellpadding=0 cellspacing=0 class='table table-bordered' align=center style='border-collapse:collapse;' >
					<label>기간내 고속사 요청건</label>
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
					<c:forEach items="${anal2}" var="anal2" varStatus="i">
					<tbody>
							<tr>		
								<td><c:out value="${i.count}"/></td>								
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
				</table>
				</section>
		<section id="table4">
		<table id="mon" border=1 width=auto cellpadding=0 cellspacing=0 class='table table-bordered' align=center style='border-collapse:collapse;' >
					<label>월별 데이터(금일 기준)</label>
					<div class="row">								
					<thead>
						<tr>
							<!--  <th>작성자</th>-->
							<th>NO.</th>
							<th>년-월 </th>							
							<th>발생건수</th>												
						</tr>
					</thead>
					</div>	
					<c:forEach items="${month}" var="month" varStatus="i">
					<tbody>
							<tr>		
								<td><c:out value="${i.count}"/></td>								
								<td>								
									<c:out value="${month.YM}" />												
								</td>								
								<td>								
									<c:out value="${month.NUM}" />	 							
								</td>
							</tr>
					</tbody>
					</c:forEach>
				</table>
				</section>				
		<hr />
		</form>
		</div>
	</div>
</body>
</html>