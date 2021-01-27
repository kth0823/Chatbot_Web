<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>에이텍 티앤</title>
</head>

<style type="text/css">
ul{
 	width:100%;	
	 overflow-x:auto;
     white-space: nowrap;
}
li {
	list-style: none;
	display: inline;
	padding: 6px;
}
</style>
<body>
	<div>
		<ul>			
			<button class="btn btn-info" onclick="location.href='/board/list'" type="button">목록 </button>
			<button class="btn btn-info" onclick="location.href='/board/writeView'" type="button"> 글작성 </button>
			<button class="btn btn-info" onclick="location.href='/board/selRe'" type="button">레포트 </button>
			<button class="btn btn-info" onclick="location.href='/board/manuallist'" type="button">메뉴얼 </button>
			<button class="btn btn-info" onclick="location.href='/board/FWlist'" type="button">F/W</button>
			<button class="btn btn-info" onclick="location.href='/board/selanal'" type="button"> 분석 </button>
			<button class="btn btn-info" onclick="location.href='https://www.kobus.co.kr/main.do'" type="button">배차 </button>
			<button class="btn btn-info" onclick="location.href='/board/ocr'" type="button">재설치</button>
			<button class="btn btn-info" onclick="location.href='/board/Carlist'" type="button">차량관리</button>			
		</ul>
	</div>
</body>
</html>