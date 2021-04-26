<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <link rel="stylesheet" type="text/css" href="//t1.daumcdn.net/kakaopay/tesla/20200522/pg-web/css/common.min.css">
    <script src="//t1.daumcdn.net/kakaopay/tesla/20180108/pg_web/js/lib/jquery.min.js"></script>
    
    

<script>
        var userInfo = userInfo || {};
        userInfo.val = {};
        userInfo.val.hash = "441a3ff3787751218e4d3e6bf268acc795a719b1f380aea40d135fad9b84c414";
        userInfo.val.failUrl = "http://developers.kakao.com/demo/pay/fail";
        userInfo.val.remainingSec = 900;
        userInfo.val.cancelUrl = "http://developers.kakao.com/demo/pay/cancel";
        userInfo.val.isCancelPost = false;
        userInfo.val.isFailPost = false;
        userInfo.val.isApprovalPost = false;
        userInfo.val.qrUrl = "https://mockup-pg-web.kakao.com/v1/441a3ff3787751218e4d3e6bf268acc795a719b1f380aea40d135fad9b84c414/bridge";
		userInfo.val.isIssuedSubscriptionOrder = false;
	</script>

<script type="text/javascript" src="/resources/js/min_common_payment.js?v=64"></script>

<script type="text/javascript" src="//t1.daumcdn.net/kakaopay/tesla/20180702/jquery-qrcode-0.14.0.js"></script>

<script type="text/javascript" src="/resources/js/min_user_info.js?v=64"></script>

</head>
<body>

<div id="payPopupDiv" class="pay_popup hide">
    <div class="inner_terms_layer">
        <div class="layer_head">
            <strong class="tit_terms">제목</strong>
        </div>
        <div class="layer_body">
            <div class="desc_terms">
                내용
            </div>
        </div>
        <div class="layer_foot">
            <button type="button" class="btn_terms">확인</button>
        </div>
    </div>
</div>

<div id="payAlertDiv" class="hide">
    <div class="agree_layer">
        <div class="inner_agree_layer inner_agree_layer2">
            <div class="layer_body">
                <div class="desc_agree"></div>
            </div>
            <div class="layer_foot">
                <button id="alertOkButton" class="btn_layer">확인</button>
            </div>
        </div>
    </div>
</div>

<div id="payConfirmDiv" class="hide">
    <div class="agree_layer">
        <div class="inner_agree_layer inner_agree_layer2">
            <div class="layer_body">
                <strong class="desc_agree">카카오페이 결제를 중단하시겠습니까?</strong>
            </div>
            <div class="layer_foot">
                <button id="confirmCancelButton" class="btn_layer2">취소</button>
                <button id="confirmOkButton" class="btn_layer2">확인</button>
            </div>
        </div>
    </div>
</div>

<script>

    <!-- /* ---------------------------------- 곧 제거 될 것 임 ------------------------------------------ */ -->
    function closeTalkPgWebview() {
        
        window.location = "app://kakaopay/close";
    }

    function payPopup(title, msg) {
        var payPopupDiv = $("#payPopupDiv");
        payPopupDiv.removeClass("hide");
        $("body").addClass("layer_on");
        $(".tit_terms", payPopupDiv).html(title);
        $(".desc_terms", payPopupDiv).html(msg);

        $(".btn_terms", payPopupDiv).click(function() {
            $("body").removeClass("layer_on");
            payPopupDiv.addClass("hide");
        });
    }

    function payAlert(msg, onOk) {
        $("#payAlertDiv").removeClass("hide");
        $("body").addClass("layer_on");
        $(".desc_agree").html(msg);
        $("#alertOkButton").click(function() {
            $("body").removeClass("layer_on");
            $("#payAlertDiv").addClass("hide");
            if(onOk) {
                onOk();
            }
        });
    }

    function payConfirm(msg, onOk, onCancel) {
        $("#payConfirmDiv").removeClass("hide");
        $("body").addClass("layer_on");
        $(".desc_agree").html(msg);

        hide = function () {
            $("body").removeClass("layer_on");
            $("#payConfirmDiv").addClass("hide");
        };

        $("#confirmOkButton").click(function () {
            hide();
            onOk();
        });
        $("#confirmCancelButton").click(function () {
            hide();
            if (onCancel) {
                onCancel();
            }
        });
    }
    <!-- /* ---------------------------------- 곧 제거 될 것 임 ------------------------------------------ */ -->


    (function() {
        function closeTalkPgWebview() {
            
            window.location = "app://kakaopay/close";
        }

        function payPopup(title, msg) {
            var payPopupDiv = $("#payPopupDiv");
            payPopupDiv.removeClass("hide");
            $("body").addClass("layer_on");
            $(".tit_terms", payPopupDiv).html(title);
            $(".desc_terms", payPopupDiv).html(msg);

            $(".btn_terms", payPopupDiv).click(function() {
                $("body").removeClass("layer_on");
                payPopupDiv.addClass("hide");
            });
        }

        function payAlert(msg, onOk) {
            $("#payAlertDiv").removeClass("hide");
            $("body").addClass("layer_on");
            $(".desc_agree").html(msg);
            $("#alertOkButton").click(function() {
                $("body").removeClass("layer_on");
                $("#payAlertDiv").addClass("hide");
                if(onOk) {
                    onOk();
                }
            });
        }

        function payConfirm(msg, onOk, onCancel) {
            $("#payConfirmDiv").removeClass("hide");
            $("body").addClass("layer_on");
            $(".desc_agree").html(msg);

            hide = function () {
                $("body").removeClass("layer_on");
                $("#payConfirmDiv").addClass("hide");
            };

            //FIXME unbind를 안해주니, click 이벤트 셋팅할떄마다 이벤트가 add되서 add된 횟수만큼 반복 발생 되더라!!!! 이거 딴데는 문제 없었을까?? 체크 필요
            $("#confirmOkButton").unbind("click");
            $("#confirmCancelButton").unbind("click");

            $("#confirmOkButton").click(function () {
                hide();
                onOk();
            });
            $("#confirmCancelButton").click(function () {
                hide();
                if (onCancel) {
                    onCancel();
                }
            });
        }

        window.teslaBaseCommon = {
            closeTalkPgWebview: closeTalkPgWebview,
            payPopup: payPopup,
            payAlert: payAlert,
            payConfirm: payConfirm
        };

    })();

</script>

<div class="kakaopay_layer">
		<!-- 팝업 시작 -->
		<div class="kakao_popup">
			<div class="popup_payask_type">
				<div class="popup_head">
					<h1 class="screen_out">카카오페이 결제요청</h1>
				</div>
				<div class="popup_body">
					<strong class="screen_out">결제수단 선택 탭 목록</strong>

					<ul class="list_gnb">
						<li class="on _tab_qr"><a href="#none" class="link_gnb">QR코드로 결제</a></li>
						<li class="off _tab_talk"><a href="#none" class="link_gnb">카톡 메시지로 결제</a></li>
					</ul>

					<div class="area_view _qr_area">
						<h2 class="screen_out">QR코드로 결제</h2>
						<strong class="logo_pay"><img src="//t1.daumcdn.net/kakaopay/tesla/20181010/pg_web/images/logo_pay.png" class="img_g" alt="카카오페이"></strong>
						<p class="desc_payask">QR코드를 스캔하면<br>결제 페이지로 이동합니다.</p>
						<div class="area_qr">
							<div id="img_qr" style="text-align: center" class="img_g" alt="QR코드" ></div>
						</div>
					</div>
					<div class="area_view _talk_area hide">
						<h2 class="screen_out">카톡 메시지로 결제</h2>
						<strong class="logo_pay"><img src="//t1.daumcdn.net/kakaopay/tesla/20181010/pg_web/images/logo_pay.png" class="img_g" alt="카카오페이"></strong>
						<p class="desc_payask">결제요청 메시지 전송을 위해<br>아래 정보를 입력해주세요.</p>
						<form id="userPost" method="post" action="/v1/441a3ff3787751218e4d3e6bf268acc795a719b1f380aea40d135fad9b84c414/uinfo" >
							<fieldset class="fld_payask">
								<legend class="screen_out">결제정보입력</legend>
								<ul class="list_payask">
									<li>
                                    <span class="txt_payask">
                                        <label for="userPhone" class="lab_payask">휴대폰 번호</label>
										 		<em class="emph_error hide">특수문자 없이 숫자만 입력해주세요.</em>
                                                                            </span>
										<input type="text" id="userPhone" class="inp_payask" placeholder="예) 01012345678" value="" autocomplete="off">
									</li>
									<li>
                                    <span class="txt_payask">
                                        <label for="userBirth" class="lab_payask">생년월일</label>
										 		<em class="emph_error hide">특수문자 없이 숫자만 입력해주세요.</em>
                                                                            </span>
										<input type="text" id="userBirth" class="inp_payask" placeholder="예) 840301" value="" autocomplete="off">
									</li>
								</ul>

								<button type="submit" class="btn_payask">결제요청</button>

							</fieldset>
						</form>
					</div>
					<a href="#none" class="btn_close"><img src="//t1.daumcdn.net/kakaopay/tesla/20181010/pg_web/images/ico_close.png" class="img_g" alt="닫기"></a>
				</div>
			</div>
		</div>
		<!-- 팝업 끝 -->

		<form id="actionPost" action="approval" method="post">
		</form>
	</div>
</html>