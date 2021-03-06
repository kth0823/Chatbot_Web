<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오페이 사내가베 테스트</title>

<link rel="stylesheet" href="/resources/css/main.css"><script src="/resources/js/jquery-3.4.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<div id="kakaoIndex">
<a href="#kakaoBody">본문 바로가기</a></div><div class="wrap_demo" id="kakaoWrap">
<header id="kakaoHead"><h1 class="tit_kakaopay">카카오페이</h1>
<hr class="hide">
<main id="kakaoContent">
<article id="mArticle">
<h2 class="tit_demo" id="kakaoBody">Payment Demo</h2>
<p class="txt_demo">API를 활용한 카카오페이 결제를 체험해보세요.<br>(실제 결제는 일어나지 않습니다)</p>
<div class="pay_btn">
<button class="btn_pay btn_pay_hover" type="button" onclick="payment('web')">PC 결제</button>
<button class="btn_pay btn_pay_hover" type="button" id="mobile" onclick="payment('mobile')">모바일 결제</button>
</div>
<p class="txt_append">모바일 결제는 모바일 기기로 접속시 가능합니다.</p>
</article>
</main>
</header>
</div>
<script>$(document).ready(function() {
    if(! /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
        $('#mobile').attr('disabled', 'disabled');
        $('#mobile').removeClass('btn_pay_hover');
        $('#mobile').css('cursor','no-drop');
    }
});
function payment(userAgent) {
    var url = '/board/prepare'
    var params = {
        agent: userAgent,
        itemCode: '1',
        quantity: '5',
    }
    location.href = url + '?' + $.param(params)
}</script>
</body>
</html>

