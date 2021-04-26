<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="utf-8">
<head>
<meta charset="utf-8">
<title>ATECT& TTS TEST</title>    
    <script type="text/javascript" src="/resources/js/jquery.min.js"  charset="utf-8"></script>
    <script type="text/javascript" src="/resources/js/demo.js"  charset="utf-8"></script>
    <script type="text/javascript" src="/resources/js/recode.js"  charset="utf-8"></script>    
    <link rel="icon" href="http://www.atectn.com/wp-content/uploads/2019/04/favicon.ico" sizes="32x32">
    <script type="text/javascript" src="/resources/js/synthesizePost.js?ver1.3"  charset="utf-8"></script>
    <script type="text/javascript" src="/resources/js/synthesizeWorker.js?ver1.2" charset="utf-8"></script>
</head>
<body>
<div id="kakaoWrap">
    <!--header영역 스크롤시 gnb_fixed 클래스 추가-->
    <div id="kakaoHead" class="k_head">
        <h1 class="tit_logo">
            <img src="http://gw.atectn.com/upload/img/logo/atec/2029/IMG_COMP_LOGO_2029.png"/>
        </h1>
        <div class="api_head">
            <h2 class="img_speech tit_speech">TEXT TO SPEECH</h2>
           <!--   <p class="txt_speech"> 모바일 기기에 장착되어 있는 마이크와 스피커를 이용해<br>사람의 음성 언어를 인식하거나 합성할 수 있습니다. -->
            </p>
            <!--2018-03-27-v2 img_speech 클래스 삭제 및 텍스트 수정-->
           <!--   <a href="//developers.kakao.com/features/platform#%EC%9D%8C%EC%84%B1" class="link_guide">API 가이드</a> -->
            <!--  <a href="https://with.kakao.com/kakaoi/proposition" class="link_affiliate">제휴제안 신청</a> --> 
        </div>
    </div>
    <hr class="hide">
    <div id="kakaoContent" class="k_cont">
      <!--  <h2 class="screen_out">본문</h2>
        <div id="kakaoGnb" class="tab_api">
            <ul class="list_api">
                 <li class="on">
                      <a href="#speechRecognition" class="link_tab" data-name="speechRecognition">음성인식</a> 
                </li>
                <li>
                    <a href="#speechCompose" class="link_tab" data-name="speechCompose">음성합성</a>
                </li>
            </ul>
        </div> -->
       <!--   <div id="speechRecognition" data-name="speechRecognition" class="speech_comm speech_recognition" data-wss="wss://speech-api.kakao.com:9443/stt" data-cachedate="2019122602">
            <div class="inner_speech">
                <h3 class="tit_subject">
                    음성 인식<span class="txt_sub">Speech-to-Text system</span>
                </h3>
                <p class="txt_para">
                    사람이 말하는 음성 언어를 컴퓨터가 해석해<br>그 내용을 문자 데이터로 변환하는 음성-문자 변환 시스템입니다.
                </p>
                <a href="//developers.kakao.com/features/platform#%EC%9D%8C%EC%84%B1" class="link_guide">API 가이드</a>
                <div class="cont_demo">
                    <h4 class="tit_strapline">기능데모</h4>
                    <div class="box_recognition">
                        <div class="demo_info">
                            <img src="/static/images/thumb_local.jpg" class="thumb_voice" alt="">
                        </div>
                        <div class="demo_voice">
                            <a href="#none" class="link_voice" id="link_voice" data-name="SEARCH"> -->
                                <!--클릭시 on 클래스 추가(애니메이션효과)-->
                           <!--       <span class="effect_comm"></span>
                                <span class="effect_comm"></span>
                                <span class="core_voice">
                                    <span class="img_speech ico_voice">음성 검색</span>
                                </span>
                            </a>
                            <p class="txt_result" id="txt_result">마이크를 클릭하세요.</p>
                        </div>
                    </div>
                    <ul class="list_mode">
                        <li class="on">
                            <a href="#none" class="link_func" data-name="DICTATION">
                                <span class="img_speech ico_dictation"></span> 딕테이션모드 </a>
                            <p class="txt_func">
                                <em>딕테이션모드</em>받아쓰기 모드이며 일반적인 문장, 대화체 인식에 사용합니다.
                            </p>
                        </li>
                        <li>
                            <a href="#none" class="link_func" data-name="DICTATION">
                                <span class="img_speech ico_command"></span> 이어말하기모드 </a>
                            <p class="txt_func">
                                <em>이어말하기모드</em>긴 문장을 말할때 사용합니다.
                            </p>
                        </li>
                        <li>
                            <a href="#none" class="link_func" data-name="DICTATION">
                                <span class="img_speech ico_search"></span> 검색모드 </a>
                            <p class="txt_func">
                                <em>검색모드</em>웹 검색에 사용합니다.  (예 : 다음 앱 음성 인식)
                            </p>
                        </li>
                        <li>
                            <a href="#none" class="link_func" data-name="DICTATION">
                                <span class="img_speech ico_local"></span> 로컬모드 </a>
                            <p class="txt_func">
                                <em>로컬모드</em>주소, 지역명 인식에 사용합니다. (예 : 카카오맵 앱 음성 인식)
                            </p>
                        </li>
                    </ul>
                </div>
            </div>
        </div> -->
       <!--   <div id="speechCompose" data-name="speechCompose" class="speech_comm speech_compose" data-wss="wss://speech-api.kakao.com:9443/tts" data-cachedate="2019122602">-->
       		<div id="speechCompose" data-name="speechCompose" class="speech_comm speech_compose" data-wss="" data-cachedate="">
            <div class="inner_speech">
             <!--   <h3 class="tit_subject">음성&nbsp;&nbsp;합성<span class="txt_sub"> : Text-To-Speech System</span>
                </h3>
                <p class="txt_para">텍스트를 음성으로 변환하는 기술입니다.<br/>음성 안내, 책 읽기 서비스 등 다양한 분야에서 활용할 수 있습니다.</p>
                  <a href="//developers.kakao.com/features/platform#%EC%9D%8C%EC%84%B1" class="link_guide">API 가이드</a> 
                  <p class="txt_cont">
                    <em>국내 최초 딥러닝 기반의 음성, Deep Voice</em><br/>머신 러닝을 통한 지속적인 성능 향상으로, 더 자연스럽고 다양한 음성을 제공합니다.
                </p> -->
                <p class="txt_cont">
                    <em>SSML 지원</em><br/>SSML 태그로 발음, 속도, 볼륨, 목소리 등을 조절하여 원하는 음성을 맞춤 설정할 수 있습니다.  <font style="color:#919191;">  (</font><a href="https://developers.kakao.com/assets/guide/kakao_ssml_guide.pdf" target="_blank" style="color:#919191;text-decoration: underline;" download>SSML 가이드</a><font style="color:#919191;">) </font>
                </p>
                <div class="cont_demo">
                    <h4 class="tit_strapline">원하시는 문장을 입력해주세요.</h4>
                    <div class="box_demo">
                        <!--입력창 입력시 클래스 'write_on' 추가-->
                        <!-- <label for="txtDemo" class="lab_tf" id="txtText">국내 최초 딥러닝 엔진을 탑재한 음성을 개발하여 다양한 오디오 콘텐츠 및 음성안내 서비스에 고품질의 음성을 사용할 수 있습니다.</label>
                        <label for="txtDemo" class="lab_tf" id="txtSSML">&lt;speak&gt;국내 최초 딥러닝 엔진을 탑재한 Voice 를 개발하여 다양한 오디오 콘텐츠 및 음성 안내 서비스에 고품질의 음성을 사용할 수 있습니다. 관련 문의사항은 &lt;say-as interpret-as=<font style="color: #6b84b3">"telephone"</font> &gt; <font style="color: #1a834f">82-010-1234-5678</font> &lt; /say-as &gt; 로 연락 부탁드립니다.&lt;/speak&gt;</label> -->
                        <textarea id="txtDemo" class="inp_tf" rows="4" style="font-size: 1.4em; min-width: 50%;"></textarea>
                        <!-- <button type="button" class="btn_compose" disabled="disabled">
                            <span class="none_active">합성하기</span>
                        </button> -->
                        <!--disabled 속성 추가/제거-->
                        <button class="close_btn off"><img src="https://speech-api.kakao.com/static/images/btn_clear.png"></button>
                        <div class="t_area">
                            <label class="txtDemo_btn click_on" id="txtDemo_text_btn">TEXT</label>
                            <label class="txtDemo_btn" id="txtDemo_ssml_btn">SSML</label>
                            <p class="p_counter" id="counter">글자수(공백포함) : 10자 / 총 200자</p>
                        </div>
                    </div>
                    <ul class="select_list">                        
                            <label>유형 : </label>                         
                                <select id="select_type">
                                    <option value="plain" >Plain Voice</option>
                                    <option value="deep" selected>Deep Voice</option>
                                </select><br>                                         
                            <label>목소리 : </label>                        
                                <select id="select_voice">
                                    <option value="Spring">Spring</option>
                                    <option value="Ryan">Ryan</option>
                                    <option value="Naomi" selected >Naomi</option>
                                    <option value="Nick">Nick</option>
                                </select>
                            
                        
                        <li class="select_list_a">
                        	<label>결과 : </label> 
                            <button type="button" class="btn_listen">
                                <span id="playBtn">▶ 음성듣기</span>
                            </button>
                            <audio controls hidden id="audioPlayer" src="https://demo-vox-proxy.i.kakao.com/v1/ttsURL/fc2ad700d3684549a8a20fe6b046cae1.mp3"></audio>
                            <a href="https://demo-vox-proxy.i.kakao.com/v1/ttsURL/fc2ad700d3684549a8a20fe6b046cae1.mp3" id="download" download>
                           		<button>▼ 파일 다운로드</button>
                            </a>
                        </li>
                    </ul>
                    <!--audio controls id="audioPlayer" class="box_controller" -->
                    <!-- <audio controls controlsList="nodownload" id="audioPlayer" style="width:100%">
                    </audio>
                    <ul class="list_mode">
                        <li>
                            <a href="#none" class="link_func">
                                <span class="img_speech ico_unit"></span> Unit Selection </a>
                            <p class="txt_func">
                                <em>Unit Selection</em>대규모 음성 데이터 기반 편집 합성 방식입니다.
                            </p>
                        </li>
                        <li>
                            <a href="#none" class="link_func">
                                <span class="img_speech ico_deep"></span> 딥러닝기반 </a>
                            <p class="txt_func">
                                <em>딥러닝기반</em>딥러닝 기반 음성 합성방식입니다.
                            </p>
                        </li>
                    </ul> -->
                </div>
            </div>
        </div>
    <!--      <div class="speech_comm speech_reference">
            <div class="inner_speech">
                <strong class="tit_etc">래퍼런스</strong>
                <ul class="list_reference">
                    <li>
                        <img src="/static/images/reference/icon_daum.jpg" class="thumb_reference" alt="Daum">
                        <strong class="tit_reference">Daum</strong>
                    </li>
                    <li>
                        <img src="/static/images/reference/icon_navi.jpg" class="thumb_reference" alt="카카오내비">
                        <strong class="tit_reference">카카오내비</strong>
                    </li>
                    <li>
                        <img src="/static/images/reference/icon_map.jpg" class="thumb_reference" alt="카카오맵">
                        <strong class="tit_reference">카카오맵</strong>
                    </li>
                    <li>
                        <img src="/static/images/reference/icon_t.jpg" class="thumb_reference" alt="카카오 T">
                        <strong class="tit_reference">카카오 T</strong>
                    </li>
                    <li>
                        <img src="/static/images/reference/icon_melon.jpg" class="thumb_reference" alt="멜론">
                        <strong class="tit_reference">멜론</strong>
                    </li>
                    <li>
                        <img src="/static/images/reference/icon_mini.jpg" class="thumb_reference" alt="카카오미니">
                        <strong class="tit_reference">카카오미니</strong>
                    </li>
                    <li>
                        <img src="/static/images/reference/icon_api.jpg" class="thumb_reference" alt="Open API">
                        <strong class="tit_reference">Open API</strong>
                    </li>
                    <li>
                        <img src="/static/images/reference/icon_brunch.jpg" class="thumb_reference" alt="브런치">
                        <strong class="tit_reference">브런치</strong>
                    </li>
                    <li>
                        <img src="/static/images/reference/icon_cheez.jpg" class="thumb_reference" alt="카카오치즈">
                        <strong class="tit_reference">카카오치즈</strong>
                    </li>
                    <li>
                        <img src="/static/images/reference/icon_bus.jpg" class="thumb_reference" alt="카카오버스">
                        <strong class="tit_reference">카카오버스</strong>
                    </li>
                    <li>
                        <img src="/static/images/reference/icon_stock.jpg" class="thumb_reference" alt="카카오스탁">
                        <strong class="tit_reference">카카오스탁</strong>
                    </li>
                    <li>
                        <img src="/static/images/reference/icon_hyundai.jpg" class="thumb_reference" alt="현대자동차">
                        <strong class="tit_reference">현대자동차</strong>
                    </li>
                </ul>
            </div>
        </div> -->
    </div>
    <hr class="hide">
    <div id="kakaoFoot" class="k_foot">
    	<img src="/resources/images/KAKAO.png"/>
        <small class="corp_info">Copyright <a href="#none" class="link_kakaocorp">© ATECT& & Kakao Corp.</a></small>
    </div>
    <div id="ocr_sample_image" class="sample_image" org_width="720" org_height="960" style="background-image:url(https://t1.daumcdn.net/alvolo/_vision/openapi/r2/images/ocr.jpg);"></div>
</div>
<!--script type="text/javascript" src="/static/js/mconsole.js"></script-->
<script type="text/javascript" src="/static/js/select_custom.js"></script>
</body>
</html>



