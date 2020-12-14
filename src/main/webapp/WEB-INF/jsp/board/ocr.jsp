<!DOCTYPE html> 

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html lang="ko">
<head>
<title>카카오 비전 테스트</title>
<meta charset="UTF-8">
<!-- meta -->
<meta content="website"       property="og:type"  />
<meta content='Kakao Vision API'   property='og:site_name'/>
<meta content='//vision-api.kakao.com' property='og:url'/>
<meta content='ko_KR'           property='og:locale'/>
<meta content='en_US'           property='og:locale:alternate'/>
<meta content="Kakao API"            property='og:title'/>
<meta content='Kakao Vision API' property='og:description'/>    
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<!-- //meta -->

<link rel="shortcut icon" href="https://developers.kakao.com/vassets/img/favicon.ico" type="image/x-icon" />
<!--  <link type="text/css" rel="stylesheet" href="https://t1.daumcdn.net/alvolo/_vision/openapi/r2/css/styles.css" media="screen,projection"> -->
<script type="text/javascript" src="https://t1.daumcdn.net/alvolo/_vision/openapi/r2/js/jquery-3.2.1.min.js"></script>

<link rel="stylesheet" href="https://t1.daumcdn.net/alvolo/_vision/openapi/r2/css/github.min.css">
<script src="https://t1.daumcdn.net/alvolo/_vision/openapi/r2/js/highlight.min.js"></script>


<link type="text/css" rel="stylesheet" href="https://vision-api.kakao.com/static/css/common_20191226.css">
<!--  <link rel="stylesheet" type="text/css" href="/resources/css/ocr.css?ver1.2"> -->
<link type="text/css" rel="stylesheet" href="/resources/css/styles.css?ver1.2" media="screen,projection">

</head>
<body>
<div id="kakaoIndex">
     <a href="#kakaoBody">본문 바로가기</a>
     <a href="#kakaoGnb">메뉴 바로가기</a>
</div>
<div id="kakaoWrap">
	<div id="kakaoHead" class="k_head">
		<h1>
			<a href="javascript:;" id="kakaoLogo">Kakao Vision API</a>
		</h1>
	</div>
	<hr class="hide">
	<div id="kakaoContent" class="cont_api">
		<div id="mArticle">
		<h2 id="kakaoBody" class="screen_out">본문</h2>
			<div class="intro_api">
				<div class="detail_api">
					<strong class="tit_intro">Vision API</strong>
					<p class="desc_intro">이미지 내부의 콘텐츠를 분석해서 얼굴, 상품, 태그, 성인 <br>여부등을 판별하고 콘텐츠 중심의 썸네일을 생성할 수 있습니다.</p>
					<button type="button" class="btn_intro"><span class="txt_btn">API 가이드</span></button>
					<button type="button" class="btn_partner"><span class="txt_btn">제휴제안 신청</span></button>
				</div>
			</div>
			<div id="kakaoGnb" class="tab_api">
				<ul class="list_api">
					<li class="on">
						<a href="#face" class="link_tab">얼굴 검출</a>
					</li>
					<li>
						<a href="#product" class="link_tab">상품 검출</a>
					</li>
					<li>
						<a href="#thumbnail" class="link_tab">썸네일</a>
					</li>
					<li>
						<a href="#multitag" class="link_tab">멀티태그 생성 </a>
					</li>
					<li>
						<a href="#adult" class="link_tab">성인이미지 판별</a>
					</li>
					<li>
						<a href="#ocr" class="link_tab">OCR</a>
					</li>
				</ul>
			</div>

  			<div class="guide_api">
				<!-- 얼굴인식 -->
				<a name="face" id="section_face" class="section_link"></a>
				<div class="fst box_g">
					<div class="inner_api">
						<h3 class="tit_g">얼굴 검출<span class="txt_sub">Face Detection</span></h3>
						<p class="desc_g">얼굴 검출 API는 이미지로부터 얼굴의 위치와 각도를 검출하고,성별과 나이를 추정해서 반환합니다.<br>이미지내에서 검출 가능한모든 얼굴의 목록을 반환합니다.</p>
						<a href="https://developers.kakao.com/docs/latest/ko/vision/dev-guide#recog-face" class="link_guide">API 가이드</a>
						<strong class="tit_sub">기능 데모</strong>
						<!-- 데모 API 영역 -->
						<div class="demo_api">
							<div class="view_comm">
								<div class="photo_detail">
									<div id="face_sample_image_box" class="image_box" style="height:390px">
		         						<div id="face_sample_image" class="sample_image" style="background-image:url(https://t1.daumcdn.net/alvolo/_vision/openapi/r2/images/01.jpg)"></div>
										<canvas id="face_mask_canvas" width="544" height="277" class="mask_canvas"></canvas>
		    						</div>
								</div>
<div class="code_api">
<pre class="detail_code">
<code id="face_result" class="json hljs">
</code>
</pre>
</div>
							</div>
						</div>
						<!-- 데모 API 영역 -->
						<form class="option_api" id="face_form">
							<fieldset>
								<legend class="screen_out">데모 경로 입력 폼</legend>
								<div class="addr_api">
									<input type="text" id="face_url_input" class="inp_addr inp_empty" data-alt="이미지 URL을 입력하고 결과를 확인해보세요.">
									<div class="addr_option">
										<div class="btn_clip">
											<label for="photoUpload" class="lab_upload">
												<span class="screen_out">사진불러오기</span>
												<span class="ico_comm ico_clip"></span>
											</label>
											<input type="file" id="photoUpload" class="image_file_input inp_thumb" data-section="face">
										</div>
										<button class="image_url_detect btn_detect" data-section="face">DETECT</button>
									</div>
								</div>
							</fieldset>
						</form>

						<div class="photo_bit">
							<strong class="screen_out">사진목록</strong>
							<ul class="list_photo">
								<li class="on">
									<a href="javascript:;" class="link_thumb">
										<span class="thumb_g">
											<img src="https://t1.daumcdn.net/alvolo/_vision/openapi/r2/images/01.jpg" class="thumb_img" data-sample-index="0">
										</span>
									</a>
								</li>
								<li>
									<a href="javascript:;" class="link_thumb">
										<span class="thumb_g">
											<img src="https://t1.daumcdn.net/alvolo/_vision/openapi/r2/images/02.jpg" class="thumb_img" data-sample-index="1">
										</span>
									</a>
								</li>
								<li> <!-- 선택된 항목 : on 클래스 추가 -->
									<a href="javascript:;" class="link_thumb">
										<span class="thumb_g">
											<img src="https://t1.daumcdn.net/alvolo/_vision/openapi/r2/images/03.jpg" class="thumb_img" data-sample-index="2">
										</span>
									</a>
								</li>
								<li>
									<a href="javascript:;" class="link_thumb">
										<span class="thumb_g">
											<img src="https://t1.daumcdn.net/alvolo/_vision/openapi/r2/images/04.jpg" class="thumb_img" data-sample-index="3">
										</span>
									</a>
								</li>
								<li>
									<a href="javascript:;" class="link_thumb">
										<span class="thumb_g">
											<img src="https://t1.daumcdn.net/alvolo/_vision/openapi/r2/images/05.jpg" class="thumb_img" data-sample-index="4">
										</span>
									</a>
								</li>
							</ul>
							<!--
							<div class="add_photo">
								<label for="photoUpload" class="lab_upload">
									<span class="ico_comm"></span>
									<span class="txt_file">Image File</span>
								</label>
								<input type="file" id="photoUpload" class="inp_thumb">
							</div>
							-->
						</div>
					</div>
				</div>

				<!-- 제품인식 -->
				<a name="product" id="section_product" class="section_link"></a>
				<div class="box_g box_gray">
					<div class="inner_api">
						<h3 class="tit_g"> 상품 검출<span class="txt_sub">Product Detection</span></h3>
						<p class="desc_g">상품 검출 API는 이미지 콘텐츠를 분석해서 상품들의 위치와 종류를 검출합니다.</p>
						<a href="https://developers.kakao.com/docs/latest/ko/vision/dev-guide#recog-product" class="link_guide">API 가이드</a>
						<strong class="tit_sub">기능 데모</strong>
						<!-- 데모 API 영역 -->
						<div class="demo_api">
							<div id="product_sample_image_box" class="image_box">
					            <div id="product_sample_image" class="sample_image" style="background-image:url(https://t1.daumcdn.net/alvolo/_vision/openapi/r2/images/06.jpg);"></div>
								<canvas id="product_mask_canvas" width="544" height="277" class="mask_canvas"></canvas>
				        		<div class="product_box_wrapper result_box_wrapper"></div>
				        	</div>
<!-- 데모 코드 임시 입력 -->
<div class="code_api">
<pre class="detail_code">
<code id="product_result" class="json hljs">{
</code>
</pre>
</div>
<!--// 데모 코드 임시 입력 -->
						</div>
						<!-- 데모 API 영역 -->
						<form class="option_api">
							<fieldset>
								<legend class="screen_out">데모 경로 입력 폼</legend>
								<div class="addr_api">
									<input type="text" id="product_url_input" class="inp_addr inp_empty"  data-alt="이미지 URL을 입력하고 결과를 확인해보세요." data-section="product">
									<div class="addr_option">
										<div class="btn_clip">
											<label for="photoUpload" class="lab_upload">
												<span class="ico_comm ico_clip"></span>
											</label>
											<input type="file" id="photoUpload" class="image_file_input inp_thumb" data-section="product">
										</div>
										<button type="submit" class="image_url_detect btn_detect" data-section="product">DETECT</button>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>

				<!-- 썸네일 생성 -->
				<a  name="thumbnail" id="section_thumbnail" class="section_link"></a>
				<a  name="thumbnail_crop" class="section_link"></a>
				<div class="box_g">
					<div class="inner_api">
						<h3 class="tit_g">썸네일 생성<span class="txt_sub">Thumbnail</span></h3>
						<p class="desc_g">썸네일 생성 API는 이미지의 컨텐츠를 잘 표현할 수 있는 썸네일의 위치를 찾아내어, 요청한 크기의 썸네일이미지로 생성합니다. <br/>생성된 썸네일 이미지는 Kakao CDN 서버에 보관되어 사용자 서비스에 사용할 수 있습니다.</p>
						<a href="https://developers.kakao.com/docs/latest/ko/vision/dev-guide#create-thumbnail" class="link_guide">API 가이드</a>
						<strong class="tit_sub">기능 데모</strong>
						<!-- 데모 API 영역 -->
						<div class="demo_api">
							<div id="thumbnail_crop_sample_image_box" class="image_box">
					            <div id="thumbnail_crop_sample_image" class="sample_image" style="background-image:url(https://t1.daumcdn.net/alvolo/_vision/openapi/r2/images/07.jpg);"></div>
					            <canvas id="thumbnail_crop_mask_canvas" width="544" height="277" class="mask_canvas"></canvas>
					        </div>
<div class="code_api" style="position:relative;">
	<pre class="detail_code" style="margin:0px 0;">
		<code id="thumbnail_crop_result" class="json hljs" style="overflow:auto; ">
		</code>
	</pre>
	<div id="thumbnail_crop_preview_box"  style="display:none; margin:0px 0 0 0; padding:10px 0px; border-top:dashed 1px #ddd;">
		<div style=" text-align:center; ">
			생성된 썸네일 결과 이미지
		</div>
		<div id="thumbnail_crop_preview" style="margin:10px 0 0 0; text-align:center; ">
			<img id="thumbnail_crop_preview_image" src="http://k.kakaocdn.net/dn/txyQ2/btqFWclOw2s/WCikzo6I9lxm72C8Kq2Dw1/img.jpg"/>
		</div>
	</div>

</div>
						</div>
						<!-- 데모 API 영역 -->
						<form class="option_api">
							<fieldset>
								<legend class="screen_out">데모 경로 입력 폼</legend>
								<div class="addr_api">
									<input type="text" id="thumbnail_crop_url_input" class="inp_addr inp_empty"  data-section="thumbnail_crop" data-alt="이미지 URL을 입력하고 결과를 확인해보세요.">
									<div class="addr_option">
										<div class="btn_clip">
											<label for="photoUpload" class="lab_upload">
												<span class="ico_comm ico_clip"></span>
											</label>
											<input type="file" id="photoUpload" class="image_file_input inp_thumb" data-section="thumbnail_crop">
										</div>
										<button type="submit" class="image_url_detect btn_detect" data-section="thumbnail_crop">DETECT</button>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>

				<a  name="thumbnail_detect" class="section_link"></a>
				<div class="box_g">
					<div class="inner_api">
						<h3 class="tit_g">썸네일 검출<span class="txt_sub">Thumbnail</span></h3>
						<p class="desc_g">썸네일 검출 API는 이미지의 컨텐츠를 잘 표현할 수 있는 썸네일의 위치를 찾아냅니다. 사용자의 눈길을 사로잡을 수 있는 썸네일을 생성할 수 있도록 도움을 줍니다.</p>
						<a href="https://developers.kakao.com/docs/latest/ko/vision/dev-guide#extract-thumbnail" class="link_guide">API 가이드</a>
						<strong class="tit_sub">기능 데모</strong>
						<!-- 데모 API 영역 -->
						<div class="demo_api">
							<div id="thumbnail_sample_image_box" class="image_box">
					            <div id="thumbnail_sample_image" class="sample_image" style="background-image:url(https://t1.daumcdn.net/alvolo/_vision/openapi/r2/images/07.jpg);"></div>
					            <canvas id="thumbnail_mask_canvas" width="544" height="277" class="mask_canvas"></canvas>
					        </div>
<div class="code_api">
<pre class="detail_code">
<code id="thumbnail_result" class="json hljs">
</code>
</pre>
</div>
						</div>
						<!-- 데모 API 영역 -->
						<form class="option_api">
							<fieldset>
								<legend class="screen_out">데모 경로 입력 폼</legend>
								<div class="addr_api">
									<input type="text" id="thumbnail_url_input" class="inp_addr inp_empty"  data-section="thumbnail" data-alt="이미지 URL을 입력하고 결과를 확인해보세요.">
									<div class="addr_option">
										<div class="btn_clip">
											<label for="photoUpload" class="lab_upload">
												<span class="ico_comm ico_clip"></span>
											</label>
											<input type="file" id="photoUpload" class="image_file_input inp_thumb" data-section="thumbnail">
										</div>
										<button type="submit" class="image_url_detect btn_detect" data-section="thumbnail">DETECT</button>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>

				<!-- 멀티태그 생성 -->
				<a name="multitag" id="section_multitag" class="section_link"></a>
				<div class="box_g box_gray">
					<div class="inner_api">
						<h3 class="tit_g">멀티태그 생성<span class="txt_sub">Multitag</span></h3>
						<p class="desc_g">멀티태그 API는 이미지내의 컨텐츠에 대한 레이블을 생성하는 API입니다. 이미지의 카테고리를 분류할 수 있도록 도움을 줍니다.</p>
						<a href="https://developers.kakao.com/docs/latest/ko/vision/dev-guide#create-multi-tag" class="link_guide">API 가이드</a>
						<strong class="tit_sub">기능 데모</strong>
						<!-- 데모 API 영역 -->
						<div class="demo_api">
							<div id="multitag_sample_image_box" class="image_box">
					            <div id="multitag_sample_image" class="sample_image" style="background-image:url(https://t1.daumcdn.net/alvolo/_vision/openapi/r2/images/08.jpg);"></div>
					            <canvas id="multitag_mask_canvas"></canvas>
								<div class="demo_tag">
								</div>

					        </div>

<div class="code_api">
<pre>
<code id="multitag_result" class="json hljs">
</code>
</pre>
</div>
						</div>
						<!-- 데모 API 영역 -->
						<form class="option_api">
							<fieldset>
								<legend class="screen_out">데모 경로 입력 폼</legend>
								<div class="addr_api">
									<input type="text" id="multitag_url_input" class="inp_addr inp_empty"  data-section="multitag" data-alt="이미지 URL을 입력하고 결과를 확인해보세요.">
									<div class="addr_option">
										<div class="btn_clip">
											<label for="photoUpload" class="lab_upload">
												<span class="ico_comm ico_clip"></span>
											</label>
											<input type="file" id="photoUpload" class="image_file_input inp_thumb" data-section="multitag">
										</div>
										<button type="submit" class="image_url_detect btn_detect" data-section="multitag">GENERATE</button>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>

				<!-- 성인이미지 판별 -->
				<a name="adult" id="section_adult" class="section_link"></a>
				<div class="box_g">
					<div class="inner_api">
						<h3 class="tit_g">성인이미지 판별<span class="txt_sub">Adult detection</span></h3>
						<p class="desc_g">성인 검출 API는 이미지가 성인물에 해당하는지를 판별한 결과를 알려줍니다. 스팸이미지를 필터링하는데 사용할 수 있습니다.</p>
						<a href="https://developers.kakao.com/docs/latest/ko/vision/dev-guide#recog-adult-content" class="link_guide">API 가이드</a>
						<strong class="tit_sub">기능 데모</strong>
						<!-- 데모 API 영역 -->
						<div class="demo_api">
							<div id="adult_sample_image_box" class="image_box">
					            <div id="adult_sample_image" class="sample_image" style="background-image:url(https://t1.daumcdn.net/alvolo/_vision/openapi/r2/images/10.jpg);"></div>
					        </div>
<div class="code_api">
<pre>
<code id="adult_result" class="json hljs">
</code>
</pre>
</div>
						</div>
						<!-- 데모 API 영역 -->
						<form class="option_api">
							<fieldset>
								<legend class="screen_out">데모 경로 입력 폼</legend>
								<div class="addr_api">
									<input type="text" id="adult_url_input" class="inp_addr inp_empty" data-section="adult" data-alt="이미지 URL을 입력하고 결과를 확인해보세요.">
									<div class="addr_option">
										<div class="btn_clip">
											<label for="photoUpload" class="lab_upload">
												<span class="ico_comm ico_clip"></span>
											</label>
											<input type="file" id="photoUpload" class="image_file_input inp_thumb" data-section="adult">
										</div>
										<button type="submit" class="image_url_detect btn_detect" data-section="adult">DETECT</button>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div> 


				<!-- OCR -->
				<a name="ocr" id="section_ocr" class="section_link"></a>
				<div class="box_g">
					<div class="inner_api">
						<h3 class="tit_g">OCR<span class="txt_sub">Optical Character Reader</span></h3>
                        <p class="desc_g">이미지로부터 문자영역과 해당 문자영역의 문자를 추출해낼 수 있습니다.</p>

						<a href="https://developers.kakao.com/docs/latest/ko/vision/dev-guide#ocr" class="link_guide">API 가이드</a>

						<strong class="tit_sub">기능 데모</strong>
						<!-- 데모 API 영역 -->
						<div class="demo_api">
							<div id="ocr_sample_image_box" class="image_box">
					            <div id="ocr_sample_image" class="sample_image" org_width="720" org_height="960" style="background-image:url(https://t1.daumcdn.net/alvolo/_vision/openapi/r2/images/ocr.jpg)"></div>
								<canvas id="ocr_mask_canvas" width="544" height="277" class="mask_canvas"></canvas>
					        </div>
<div class="code_api">
<pre>
<code id="ocr_result" class="json hljs">
</code>
</pre>
</div>
						</div>
						<!-- 데모 API 영역 -->
						<form class="option_api">
							<fieldset>
								<legend class="screen_out">데모 경로 입력 폼</legend>
								<div class="addr_api">
									<input type="text" disabled id="ocr_url_input" class="inp_addr inp_empty" data-section="ocr" data-alt="OCR 기능은 이미지 URL 기능을 지원하지 않습니다. 우측 첨부버튼으로 이미지 파일을 첨부해서 결과를 확인해보세요.">
									<div class="addr_option_ocr">
										<div class="btn_clip">
											<label for="photoUpload" class="lab_upload">
												<span class="ico_comm ico_clip"></span>
											</label>
											<input type="file" id="photoUpload" class="image_file_input inp_thumb" data-section="ocr">
										</div>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>



			</div>
		</div>
	</div>
	<hr class="hide">
	<div id="kakaoFoot" class="k_foot">
		<small class="corp_info">Copyright <a href="http://www.kakaocorp.com" class="link_kakaocorp">&copy; Kakao Enterprise Corp. </a>All rights reserved.</small>
	</div>
	<div class="dimmed_layer"></div>
</div>

<script src="/resources/js/app_20200818r1.min.js?ver2.3"></script>
<script>
var FIX_HEIGHT = 450;

$(window).scroll(function() {
    var scroll = $(window).scrollTop();

    if (scroll >= FIX_HEIGHT) {
        $("#kakaoWrap").addClass("tab_fixed");
    } else {
        $("#kakaoWrap").removeClass("tab_fixed");
    }
});

$(document).ready(function(){
    App.init();
    $(".btn_intro").on("click", function() { goto_guide() });
    $(".btn_partner").on("click", function() { goto_partner() });    
});


function goto_guide() {
    window.location = "https://developers.kakao.com/docs/latest/ko/vision"
}

function goto_partner() {
    window.location = "https://with.kakao.com/kakaoi/proposition"
}


$( document ).ready( function() {
    $( 'code:contains("recognition_words")' ).css( 'color', 'pink' );
  } );

/*var name_by_class = $('.hljs-string').val();
document.write(name_by_class);
*/
</script>
<!-- 텝 고정 확인을 위한 임시스크립트 입니다. -->

</body>
</html>
