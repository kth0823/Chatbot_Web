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
<link href="<c:url value="/resources/css/list.css?ver1.5" />" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="<c:url value="/resources/css/other.css?ver1.5" />" rel="stylesheet">
<link rel="icon" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico" sizes="32x32">
<link rel="icon" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico" sizes="192x192">
<link rel="apple-touch-icon-precomposed" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico">
<meta name="msapplication-TileImage" content="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>


<title>차량등록 화면</title>
</head>
<script type="text/javascript">
$(document).ready(function() {
	var formObj = $("form[name='writeForm']");
	$(".write_btn").on("click", function() {		
		formObj.attr("action", "/board/Carwrite");
		formObj.attr("method", "post");
			formObj.submit();
	});	
})

var i=0;
var Co_id="Co_id["+i+"]";
var Car_no="Car_no["+i+"]";
var co_id;
var car_no;

function excelExport(event){
	excelExportCommon(event, handleExcelDataAll);
}
function excelExportCommon(event, callback){
    var input = event.target;
    var reader = new FileReader();
    reader.onload = function(){
        var fileData = reader.result;
        var wb = XLSX.read(fileData, {type : 'binary'});
        var sheetNameList = wb.SheetNames; // 시트 이름 목록 가져오기 
        var firstSheetName = sheetNameList[0]; // 첫번째 시트명
        var firstSheet = wb.Sheets[firstSheetName]; // 첫번째 시트 
        callback(firstSheet);      
    };
    reader.readAsBinaryString(input.files[0]);
}
function handleExcelDataAll(sheet){
	handleExcelDataHeader(sheet); // header 정보 
	handleExcelDataJson(sheet); // json 형태
	handleExcelDataCsv(sheet); // csv 형태
	handleExcelDataHtml(sheet); // html 형태
}
function handleExcelDataHeader(sheet){
    var headers = get_header_row(sheet);
    $("#displayHeaders").html(JSON.stringify(headers));
}
function handleExcelDataJson(sheet){
	var data=JSON.stringify(XLSX.utils.sheet_to_json (sheet));
	var text=JSON.parse(data);
	var len=text.length;
	var idx;
	for(idx=0;idx<len;idx++){
		co_id=text[idx].CO_ID;
		car_no=text[idx].CAR_NO;
		exceltableCreate();
	}
    //$("#displayExcelJson").html(JSON.stringify(XLSX.utils.sheet_to_json (sheet)));
}
function handleExcelDataCsv(sheet){
    $("#displayExcelCsv").html(XLSX.utils.sheet_to_csv (sheet));
}
function handleExcelDataHtml(sheet){
	var data2=XLSX.utils.sheet_to_html (sheet);
    $("#displayExcelHtml").html(XLSX.utils.sheet_to_html (sheet));
}
function get_header_row(sheet) {
    var headers = [];
    var range = XLSX.utils.decode_range(sheet['!ref']);
    var C, R = range.s.r; /* start in the first row */
    /* walk every column in the range */
    for(C = range.s.c; C <= range.e.c; ++C) {
        var cell = sheet[XLSX.utils.encode_cell({c:C, r:R})] /* find the cell in the first row */

        var hdr = "UNKNOWN " + C; // <-- replace with your desired default 
        if(cell && cell.t) hdr = XLSX.utils.format_cell(cell);

        headers.push(hdr);
    }
    return headers;
}


function tableCreate(){
	var tc = new Array();
	var ent = '';
				
	var co_id = $("#inCo_id").val();
	var car_no = $("#inCar_no").val();
	i+=1;				
	ent += '<tr>';
	ent += '<td>'+i+'</td>';
	//ent += '<td><input type="text" placeholder="고속사코드" name="Co_id"></td>';
	ent += '<td><select name="Co_id"><c:forEach var="co_info" items="${co_info}" varStatus="i"><option value="${co_info.co_id}">${co_info.co_nm}</option></c:forEach></td>';
	ent += '<td><input type="text" placeholder="차량번호" name="Car_no"></td>';
	ent += '</tr>';
	i-=1;
					
	$("#dynamicTable").append(ent);	
				
	$("#inCo_id").val('');
	$("#inCar_no").val('');
	document.getElementsByName("Co_id")[i].value=co_id;
	document.getElementsByName("Car_no")[i].value=car_no;
	//$("#Co_id :tdeq(i)").val(co_id);	
	//$("#Car_no :tdeq(i)").val(car_no);
	
	i++;
}

function exceltableCreate(){
	var tc = new Array();
	var ent = '';
				
	//var co_id = $("#inCo_id").val();
	//var car_no = $("#inCar_no").val();
	i+=1;				
	ent += '<tr>';
	ent += '<td>'+i+'</td>';
	//ent += '<td><input type="text" placeholder="고속사코드" name="Co_id"></td>';
	ent += '<td><select name="Co_id"style="width:300px;"><c:forEach var="co_info" items="${co_info}" varStatus="i"><option value="${co_info.co_id}">${co_info.co_nm}</option></c:forEach></td>';
	ent += '<td><input type="text" placeholder="차량번호" name="Car_no"></td>';
	ent += '</tr>';
	i-=1;
					
	$("#dynamicTable").append(ent);	
				
	$("#inCo_id").val('');
	$("#inCar_no").val('');
	document.getElementsByName("Co_id")[i].value=co_id;	
	//$('#'+co_id).prop("selected", true);
	document.getElementsByName("Car_no")[i].value=car_no;
	//$("#Co_id :tdeq(i)").val(co_id);	
	//$("#Car_no :tdeq(i)").val(car_no);
	
	i++;
}

function tableDelete(){
	$('#dynamicTable tbody tr:last').remove();
	i--;
}
</script>
<body>
	<header>
			<h1>차량 등록화면</h1>
	</header>
	
	<div>
			<%@include file="nav.jsp"%>
	</div>
			
<div>
<form name="writeForm" method="post" action="/board/Carwrite" enctype="multipart/form-data">
<table style="border: 1px; font-size: 2.0em;" id="dynamicTable" border=1 width=auto cellpadding=0 cellspacing=0 class='table table-bordered' align=center style='border-collapse:collapse;'>
<thead>
<tr>
<th>작업번호</th>
<th>고속사</th>
<th>차량번호</th>
</tr>
</thead>
<tbody id="dynamicTbody">

	
</tbody>
</table>
</form>
</div>
<div>

<!--<input type="text" placeholder="고속사" id="inCo_id"> -->
<select name="Co_id" id="inCo_id" class="chk" title="고속사를 선택하세요."  style="width: 45%; font-size: 2.0em;" >										
		<c:forEach var="co_info" items="${co_info}" varStatus="i">
					<option value="${co_info.co_id}">${co_info.co_nm}</option>
		</c:forEach>
</select>
<input type="text" placeholder="차량번호" id="inCar_no" style="width: 45%; font-size: 2.0em;"> 


<button onclick="tableCreate()">입력추가</button>
<button onclick="tableDelete()">입력삭제</button>
<tr>
							<td>					
					    		<button class="write_btn btn btn-success" type="submit"> 등록 </button>					
							</td>
</tr>
<!-- <button class="write_btn btn btn-success" type="file" id="excelFile" onchange="excelExport(event)">엑셀가져오기</button>  --> 
<br><label>엑셀파일 가져오기</label>
<input type="file" id="excelFile" onchange="excelExport(event)" />  

</div>
	</body>
</html>