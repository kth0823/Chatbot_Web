var userInfo=userInfo||{};
!function(t,e){
	"use strict";
	userInfo.tabManager=function(){
		var e={
				tabClass:".link_gnb",
				tabClickEventHandler:null,
				init:function(e){
					var n=this;
					t(n.tabClass).on("click",t.proxy(n.handleTablClick,this)),n.tabClickEventHandler=e,n.tabClickEventHandler.qrTabClickEventHandler()},
					handleTablClick:function(n){
						var a=this,
						s=t(n.target).parent("li");
						t(a.tabClass).parent("li").removeClass("off on"),s.addClass("on"),s.hasClass("_tab_talk")?(t("._qr_area").hide(),t("._talk_area").show(),e.tabClickEventHandler.talkTabClickEventHandler&&e.tabClickEventHandler.talkTabClickEventHandler()):(t("._talk_area").hide(),t("._qr_area").show(),e.tabClickEventHandler.qrTabClickEventHandler&&e.tabClickEventHandler.qrTabClickEventHandler())}};
		return{init:t.proxy(e.init,e),setQrTabClickEventHandler:t.proxy(e.setQrTabClickEventHandler,e),setTalkTabClickEventHandler:t.proxy(e.setTalkTabClickEventHandler,e)}}(),
		userInfo.userInput=function(){function e(t){
			return!!/^0\d{9,10}$/.test(t)
			}function n(t){return!!/^\d{6}$/.test(t)}
			function a(){t("#userPost").attr("disabled","disabled"),t(".btn_close").click(function(t){t.preventDefault()})}
			var s={isValidPhoneNumber:null,
					isValidBirth:null,
					_isProcessing:!1,handleInFocus:function(e){t(".fld_payask").find("em").hide(),t(e.target).parent().find("em").show()},
					handleOutFocus:function(e){t(".fld_payask").find("em").hide()},
					handleCheckPhoneFormat:function(n){
						var a=t(this).val();
						s.isValidPhoneNumber=e(a),
						s._buttonStatusChange()},
						handleCheckBirthFormat:function(e){
							var a=t(this).val();
						s.isValidBirth=n(a),s._buttonStatusChange()},init:function(){var e=this;t("#userPhone").on("focus",t.proxy(e.handleInFocus,this)),t("#userPhone").on("blur",t.proxy(e.handleOutFocus,this)),t("#userBirth").on("focus",t.proxy(e.handleInFocus,this)),t("#userBirth").on("blur",t.proxy(e.handleOutFocus,this)),t("#userPhone").on("change keyup paste input cut",e.handleCheckPhoneFormat),t("#userBirth").on("change keyup paste input cut",e.handleCheckBirthFormat);
						var n=userInfo.val.isIssuedSubscriptionOrder?"결제수단 등록을 중단하시겠습니까?":"카카오페이 결제를 중단하시겠습니까?";t(".btn_close").on("click",function(){teslaBaseCommon.payConfirm(n,function(){return teslaCommonPayment.paymentStop(userInfo.val.hash,userInfo.val.isCancelPost,a,"#actionPost")})}),t("#userPost").submit(function(e){var n=t("#userPhone").val(),a=t("#userBirth").val();e.preventDefault(),s._sendUserInfo(n,a)})},_buttonStatusChange:function(){this.isValidPhoneNumber&&this.isValidBirth?(t(".btn_payask").removeAttr("disabled"),t(".btn_payask").addClass("on")):(t(".btn_payask").attr("disabled","disabled"),t(".btn_payask").removeClass("on"))},_sendUserInfo:function(e,n){var a=this,s={tel:e,birthDate:n};
						a._isProcessing||(a._isProcessing=!0,t.ajax({
							type:"POST",
							url:"https://mockup-pg-web.kakao.com/v1/"+userInfo.val.hash+"/uinfo",data:s}).done(function(t,e){location.reload(!0)}).fail(function(t,e){
							var n=t.responseJSON;
							500==t.status&&teslaBaseCommon.payAlert(n.client_message,function(){
								return teslaCommonPayment.redirectToUrlWithMethod(userInfo.val.isFailPost,userInfo.val.failUrl,"#actionPost")}),teslaBaseCommon.payAlert(n.client_message)}).always(function(){a._isProcessing=!1}))}};
			return{init:t.proxy(s.init,s)}}(),userInfo.qr={_config:{},_status:{isLoaded:!1},_option:{render:"image",ecLevel:"H",minVersion:1,fill:"#000",background:null,text:userInfo.val.qrUrl,size:250,radius:0,quiet:4,mode:0,mSize:.11,mPosX:.5,mPosY:.5,label:"kakaopay",fontcolor:"#ffe340",image:null},init:function(){this._status.isLoaded||t("#img_qr").empty().qrcode(this._option),this._status.isLoaded=!0}},userInfo.statusCheck=function(){
				var e={_isProcessing:!1,_isSuccess:!1,setTime:null,config:{checkPaymentInterval:3e3},init:function(){},startCheckStatus:function(){this.setTime=setInterval(this._checkStatus,this.config.checkPaymentInterval)},stopCheckStatus:function(){clearInterval(this.setTime)},_checkStatus:function(){var e=this;t.ajax({url:"https://mockup-pg-web.kakao.com/v1/"+userInfo.val.hash+"/qr/check",timeout:3e3,type:"GET",cache:!1,
							error:function(t,e,n){},
							complete:function(){},
							success:function(t){t.expired?clearInterval(e.setTime):"openTalk"===t.status_result&&location.reload()}})}};
						return{init:t.proxy(e.init,e),
							startCheckStatus:t.proxy(e.startCheckStatus,e),
							stopCheckStatus:t.proxy(e.stopCheckStatus,e)}}(),
							t(function(){userInfo.statusCheck.init(),
								userInfo.statusCheck.startCheckStatus(),
								userInfo.tabManager.init({qrTabClickEventHandler:function(){userInfo.qr.init()}}),userInfo.userInput.init()})}(jQuery,window);