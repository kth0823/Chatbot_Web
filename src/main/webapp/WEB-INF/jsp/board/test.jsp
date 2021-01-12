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
<script type="text/javascript" src="/resources/js/dummy.js" charset="utf-8"></script>

<style>
img {
    margin: 1em 0;
    display: block;
    background: rgb(240, 240, 240);
    border: 1px solid rgb(0,0,0);
}
</style>
 <script
    type="text/javascript"
    src="/js/lib/dummy.js"
    
  ></script>

    <link rel="stylesheet" type="text/css" href="/css/result-light.css">


  <style id="compiled-css" type="text/css">
      img {
    margin: 1em 0;
    display: block;
    background: rgb(240, 240, 240);
    border: 1px solid rgb(0,0,0);
}
    /* EOS */
  </style>

  <script id="insert"></script>


</head>
<body>
    <h3>로컬에 있는 이미지를 바로 브라우저에 표시</h3>
<img id="preview" src="" width="700" alt="로컬에 있는 이미지가 보여지는 영역">
<a id="download" download="thumbnail.jpg" target="_blank">
    <img id="thumbnail" src="" width="100" alt="썸네일영역 (클릭하면 다운로드 가능)">
</a>
<input type="file" id="getfile" accept="image/*">

    <script type="text/javascript">


var file = document.querySelector('#getfile');


function dataURLtoBlob(dataurl) {
    var arr = dataurl.split(','), mime = arr[0].match(/:(.*?);/)[1],
        bstr = atob(arr[1]), n = bstr.length, u8arr = new Uint8Array(n);
    while(n--){
        u8arr[n] = bstr.charCodeAt(n);
    }
    return new Blob([u8arr], {type:mime});
}

file.onchange = function () { 
    var fileList = file.files ;
    
    // 읽기
    var reader = new FileReader();
    reader.readAsDataURL(fileList [0]);

    //로드 한 후
    reader.onload = function  () {
        document.querySelector('#preview').src = reader.result ;
        //썸네일 이미지 생성
        var tempImage = new Image(); //drawImage 메서드에 넣기 위해 이미지 객체화
        tempImage.src = reader.result; //data-uri를 이미지 객체에 주입
        tempImage.onload = function() {
            //리사이즈를 위해 캔버스 객체 생성
            var canvas = document.createElement('canvas');
            var canvasContext = canvas.getContext("2d");
            
            //캔버스 크기 설정
            canvas.width = 800; //가로 800px
            canvas.height = 800; //세로 800px
            
            //이미지를 캔버스에 그리기
            canvasContext.drawImage(this, 0, 0, 800, 800);
            //캔버스에 그린 이미지를 다시 data-uri 형태로 변환
            var dataURI = canvas.toDataURL("image/jpeg");
            
            //썸네일 이미지 보여주기
            document.querySelector('#thumbnail').src = dataURI;
            
            //썸네일 이미지를 다운로드할 수 있도록 링크 설정
            document.querySelector('#download').href = dataURI;
            var dataurl = canvas.toDataURL('image/jpeg',0.8);
            var blob = dataURLtoBlob(dataurl);
            var fd = new FormData();
            fd.append("myFile", blob, "thumb.jpg");
        };
    }; 
}; 


  </script>

</html>