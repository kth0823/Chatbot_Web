<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>카카오 지도 API</title>
 <link rel="icon" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico" sizes="32x32">   
</head>
	<h1 class="tit_logo">
            <img src="http://gw.atectn.com/upload/img/logo/atec/2029/IMG_COMP_LOGO_2029.png"/>
	</h1>
<body>
<div id="map" style="width:100%;height:700px;"></div>

<em>클릭한 위치에 마커가 표시됩니다!</em>
    
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ed26e614a364dd10a6245b006ec8d87e"></script>
<script>

var posx = "37.5055194";
var posy = "127.0068185";
var searchlink = ""

var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        //center: new kakao.maps.LatLng(37.5055194, 127.0068185), // 지도의 중심좌표
        center: new kakao.maps.LatLng(posx, posy), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//실시간교통 타일 이미지 추가
map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);

// 지도를 클릭했을때 클릭한 위치에 마커를 추가하도록 지도에 클릭이벤트를 등록합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    // 클릭한 위치에 마커를 표시합니다 
    addMarker(mouseEvent.latLng);             
});

// 지도에 표시된 마커 객체를 가지고 있을 배열입니다
var markers = [];

// 마커 하나를 지도위에 표시합니다 
//addMarker(new kakao.maps.LatLng(37.5055194, 127.0068185));
addMarker(new kakao.maps.LatLng(posx, posy));

var i=1;
// 마커를 생성하고 지도위에 표시하는 함수입니다
function addMarker(position) {
	

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: position,
        content: '<div>마커표시</div>'       
    });
	i++;
    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);
    // 생성된 마커를 배열에 추가합니다
    markers.push(marker);

}

function addMark(){	
	var inputspox = document.getElementById('spox').value; 
	var inputspoy = document.getElementById('spoy').value;
	addMarker(new kakao.maps.LatLng(inputspox, inputspoy));	
}

// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
function setMarkers(map) {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(map);
    }            
}

// "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
function showMarkers() {
    setMarkers(map)    
}

// "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
function hideMarkers() {
    setMarkers(null);    
}


var iwContent = '<div style="padding:5px;">Hello World! <br><a href="http://localhost:8080/board/map,37.5055194,127.0068185" style="color:blue" target="_blank">큰지도보기</a> <a href="http://localhost:8080/board/map,37.5055194,127.0068185" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
iwPosition = new kakao.maps.LatLng(37.5055194, 127.0068185); //인포윈도우 표시 위치입니다

//인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
position : iwPosition, 
content : iwContent 
});

//마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 

</script>
<p>
    <button onclick="hideMarkers()">마커 감추기</button>
    <button onclick="showMarkers()">마커 보이기</button>
    <button onclick="location.href='https://map.kakao.com/link/map/'">길찾기</button>
    <br>
    <label>위도 :</label><input type="text" name="spox" id="spox" placeholder="위도를 입력하세요."/>
    <label>경도 :</label><input type="text" name="spoy" id="spoy" placeholder="경도를 입력하세요."/>
    <button id="searchBtn" type="button" onclick='addMark();'>마커찍기</button>
</p> 
</body>
</html>