window.AudioContext = window.AudioContext || window.webkitAudioContext;
var audioContext = null;
var audioInput = null,
    realAudioInput = null,
    inputPoint = null,
    audioRecorder = null;
var isInit = false;
var isGotStream= false;
var mConsole = null;
var synthesize = null;

function CLOG(log){
    console.log(log);
}

function hashLoc(){
    /* 2018-12-20 추가 시작 */
    // 페이지 로드 시 해시값 따른 화면 이동
    if ('scrollRestoration' in history) { history.scrollRestoration = 'manual'}
    if( location.hash && location.hash.length ) {
        try{
            var hash = decodeURIComponent(location.hash.substr(1));
            var pos = $('.speech_comm[data-name="'+ hash +'"]');
            pos = pos.offset().top - $('#kakaoGnb').height();

            $(window).scrollTop(pos);
            $('#kakaoWrap').css({'opacity':1})

            if(hash){
                $('.list_api li').removeClass("on");
                $('.list_api a[data-name="'+ hash +'"]').parent().addClass("on")
            }

        }catch(e){
            CLOG(e);
            $('#kakaoWrap').css({'opacity':1})
            $('.list_api a[data-name="speechRecognition"]').parent().addClass("on")
        }
    }else{
        $('#kakaoWrap').css({'opacity':1})
        $('.list_api a[data-name="speechRecognition"]').parent().addClass("on")
    }
    /* // 2018-12-20 추가 끝 */
}

//var text_field = '국내 최초 딥러닝 엔진을 탑재한 음성을 개발하여 다양한 오디오 콘텐츠 및 음성안내 서비스에 고품질의 음성을 사용할 수 있습니다.';
var text_field = '테스트 음성입니다.'; 
//var ssml_field = '<speak>국내 최초 딥러닝 엔진을 탑재한 Voice 를 개발하여 다양한 오디오 콘텐츠 및 음성 안내 서비스에 고품질의 음성을 사용할 수 있습니다. 관련 문의사항은 <say-as interpret-as="telephone">82-010-1234-5678</say-as> 로 연락 부탁드립니다.</speak>'
var ssml_field = '<speak>테스트 음성입니다. 기술 문의는 <say-as interpret-as="telephone">82-010-2872-2132</say-as>로 연락 부탁드립니다.</speak>'; 

function init(){
    var body = $('#kakaoWrap');
    var gnb = $('#kakaoGnb');
    var gnbMenu = $('.link_tab');
    var headHeight = $('#kakaoHead').height();
    var kakaoGnbHeight = $('#kakaoGnb').height();
    var speechRecognitionHeight = $('#speechRecognition').height();
    var speechComposeHeight = headHeight + kakaoGnbHeight + speechRecognitionHeight;
    var clickTimeout = false;
//메뉴 스크롤
    function gotoNav(e){
        var goSection = $('div[data-name='+e+']').offset();
        $('html, body').animate({scrollTop : goSection.top-gnb.height()}, 200);/* 2018-12-21 수정 */
    }
    gnbMenu.click(function(){
        gotoNav(this.href.split("#")[1]);
        gnbMenu.parent().removeClass('on')
        $(this).parent().addClass('on')
    })

//스크롤 이벤트
    $(window).scroll(function() {
        var scrollCount = $(window).scrollTop();
        if (scrollCount >= headHeight) {
            body.addClass("gnb_fixed");
        } else {
            body.removeClass("gnb_fixed");
        };
        $('.list_api li').removeClass("on");
        if (scrollCount >= speechComposeHeight) {
            hash = 'speechCompose';
        } else {
            hash = 'speechRecognition';
        };
        $('.list_api a[data-name="' + hash + '"]').parent().addClass("on")
    });

//음성인식 데모 버튼
    var linkVoice = $('.link_voice');
    linkVoice.click(function(){
        if(clickTimeout){
            //CLOG('not yet');
            return;
        }
        clickTimeout = true;
        toggleVoice('click');
        setTimeout(function() {
            clickTimeout = false;
        }, 2000);
    });

//음성인식 기능 데모
    var demoThumb = ['thumb_command.jpg','thumb_dictation.jpg','thumb_search.jpg','thumb_local.jpg']
    var demoThumbBox = $('.demo_info img');
    var recognitionList = $('.speech_recognition .list_mode li')
    var recognitionItem = $('.speech_recognition .link_func')
    recognitionItem.click(function(){
        recognitionList.removeClass('on');
        //$(this).parents(recognitionList).addClass('on');
        $(this).parent().addClass('on');
        var itemIndex = $(this).parents(recognitionList).index();
        demoThumbBox.attr('src','static/images/'+demoThumb[itemIndex]);
    });

//음성합성 기능 데모
    var composeList = $('.speech_compose .list_mode li');
    var composeItem = $('.speech_compose .link_func')
    composeItem.click(function(){
        composeList.removeClass('on');
        //$(this).parents(composeList).addClass('on');
        $(this).parent().addClass('on');
    });
//
    // $('.inp_tf').on('focus', function (e){
    //     $(this).parent().addClass('write_on');
    //     $(this).parent().removeClass('warning_on');
    // }).on('blur', function (e){
    //     if ($(this).val().trim() === '') {
    //         $(this).parent().removeClass('write_on');
    //         $('.btn_compose').attr('disabled','')
    //     }
    //     else {
    //         $(this).parent().addClass('write_on');
    //     }
    // }).on('keyup.box_recognition .demo_info', function(e){
    //     if ($(this).val().trim() !== '') {
    //         $('.btn_compose').removeAttr('disabled')
    //     }
    // });

    // $('.btn_compose').on('click', function(e) {
    //     if(clickTimeout){
    //         console.log('not yet');
    //         return;
    //     }
    //     clickTimeout = true;
    //     initTTS();
    //     synthesizeStart();
    //     console.log($('.inp_tf').val());
    //     setTimeout(function() {
    //         clickTimeout = false;
    //     }, 2000);
    // });

    // 음성합성 초기 셋팅
    var textAraea = $('#txtDemo');
    $(function() {
        textAraea.val(text_field)
        textAraea.keyup(function (e){
            textCountchk();
        });
        textAraea.focus(function (e){
            textCountchk();
        });
        textAraea.blur(function (e){
            setTimeout(function () {
                $('.close_btn').addClass('off')
            }, 500);
            //alert('focus out');
        });
        //textCountchk();
    });

    // TEXT / SSML 버튼 기능
    var txtDemo_btn = $('.txtDemo_btn');
    txtDemo_btn.click(function (){
        if(this.id == 'txtDemo_text_btn'){
            textAraea.val(text_field);
        }else{
            textAraea.val(ssml_field); 
        }
        txtDemo_btn.removeClass('click_on');
        $(this).addClass('click_on');
        textCountchk();
            $('.close_btn').addClass('off')
    })

    // 글자수 체크
    function textCountchk(){
        var content = textAraea.val();
        
        $('#counter').html('글자수(공백포함) : '+ content.length + '자 / 총 200자');
        if(content.length > 200){
            $('#counter').css("color", "red");
            $('.btn_listen').attr('disabled','');
            $('.close_btn').removeClass('off');
        }
        else if(content.length == 0){
            $('.btn_listen').attr('disabled','');
            $('.close_btn').addClass('off');
            $('#counter').css("color", "black");
        }
        else {
            $('.btn_listen').removeAttr('disabled');
            $('.close_btn').removeClass('off');
            $('#counter').css("color", "black");
        }
    }

    // 'X' 버튼 초기화
    var initBtn = $('.close_btn');
    initBtn.click(function (){
        $('.btn_listen').attr('disabled','')
        $('.close_btn').addClass('off')
        $('#txtDemo').val('')
        $('#counter').html('글자수(공백포함) : '+ 0 + '자 / 총 200자');
        $('#counter').css("color", "black")
    });
    initBtn.click(function (){
        $('.btn_listen').attr('disabled','')
        $('.close_btn').addClass('off')
        $('#txtDemo').val('')
        $('#counter').html('글자수(공백포함) : '+ 0 + '자 / 총 200자');
        $('#counter').css("color", "black")
    });

    // 음성합성 듣기 버튼
    $('.btn_listen').off('click');
    $('.btn_listen').on('click', function(e) {
        StartTTS();
    });
}


var playSrc = "";

function StartTTS() {
    CLOG("StartTTS");
    initTTS();
    synthesizeStart();
    $('.btn_listen').off('click');
    $('.btn_listen').on('click', function (e) {
        StopTTS();
    });
    $('#playBtn').html("❚❚ 음성중지")
    var link = document.getElementById("audioPlayer");
    playAudio2(link);
}

function StopTTS() {
    CLOG("STOPTTS");
    var link = document.getElementById("audioPlayer");
    link.pause();
    $('.btn_listen').off('click');
    $('.btn_listen').on('click', function (e) {
        StartTTS();
    });
    $('#playBtn').html("▶ 음성합성")
}
isload = false;
function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

function playAudio2(link) {
    try{
        if (link != undefined)
        {
            CLOG("link.src");
            CLOG(link.src);
            CLOG('sleep play before');
            //link.play();
            CLOG('sleep play after');
            link.onended = function () {
                StopTTS();
            };
        }
        else
            setTimeout(playAudio2, 1000, link);
    } catch(err){
        console.log(err);
    }
}

async function LoadAudio(url){
    try{
        CLOG('LoadAudio');
        var link = document.getElementById("audioPlayer");
        var link2 =document.getElementById("download");
        link.src = url;
        link2.href = url;
        link.play();
    } catch(err){
        console.log(err);
    }
}

function synthesizeStart() {
    //CLOG('synthesizeStart');
    if (synthesize) {
        synthesize.init();
        // input data
        var inp_data = '';

        if (inp_tf == '') {
            if ($('#txtText').hasClass("text_off")) {
                inp_data = txtSSML;
            } else {
                inp_data = txtText;
            }
        } else {
            inp_data = inp_tf;
        }
        CLOG(inp_data);
        CLOG($('#txtDemo').val());
        CLOG($('#select_type').val());
        CLOG($('#select_voice').val());
        var data = {
            text: $('#txtDemo').val(),
            engine: $('#select_type').val(),
            voiceType: $('#select_voice').val(),
            toneType: 'default',
            outputType: 'https'
        };
        synthesize.start(data);
    } else {
        alert('tts 초기화가 필요합니다.')
    }
    return;
    if (synthesize) {
        if (synthesize.connection) {
            synthesize.clear();
            // =========== TEXT / SSML 기능추가로 수정 =========
            // synthesize.start('tts', 'aiid', 'kaccountid', $('.inp_tf').val());
            
            //selectbox data
            var select_type = $('#select_type').val();
            var select_voice = $('#select_voice').val();

            // textarea data
            var inp_tf = $('.inp_tf').val();
            var txtText = $('#txtText').text();
            var txtSSML = $('#txtSSML').text();

            // input data
            var inp_data = ''

            if (inp_tf == ''){
                if ($('#txtText').hasClass("text_off")){
                    inp_data = txtSSML
                }else{
                    inp_data = txtText
                }
            }else{
                inp_data = inp_tf
            }

            synthesize.start('tts', 'aiid', 'kaccountid', inp_data);
            
        } else {
            setTimeout( function(){
                synthesizeStart();
            }, 1000);
        }
    } else {
        alert('tts 초기화가 필요합니다.')
    }
}

function audioRecorderStart() {
    //CLOG('audioRecorderStart');
    var txt_result = document.getElementById("txt_result");
    txt_result.innerHTML = '인식 준비중 입니다.';

    if (audioRecorder && audioRecorder.connection ) {
        //CLOG('connected');
        var service = $('.speech_recognition .list_mode li.on a').data('name');
        //CLOG(service);
        audioRecorder.clear();
        audioRecorder.record('recog', 'aiid', 'kaccountid', service);
    } else {
        setTimeout( function() {
            audioRecorderStart();
        } , 1000 );
    }
}

function toggleVoice(msg){
    initAudio();
    var service = $('.speech_recognition .list_mode li.on a').data('name');
    CLOG(service);
    if( msg == 'onFinalResult' && service == 'LONG')
        return
    $( ".link_voice" ).toggleClass(function() {
        if ( $( this ).is( ".on" ) ) {
            //CLOG('do off');
            audioRecorder.stop('recogEnd', 'aiid', 'kaccountid', service);
            audioRecorder.close();
            audioRecorder.deleteWorker();
        } else {
            //CLOG('do on');
            if(audioRecorder){
                audioRecorder.newWorker();
                audioRecorder.init();
            }
            audioRecorderStart();
        }
        return "on";
    });
}

function gotStream(stream) {
    if(isGotStream) return;
    //CLOG('new audioRecorder');

    //CLOG('gotStream');
	inputPoint = audioContext.createGain();
    inputPoint.gain.setValueAtTime(2.0, audioContext.currentTime);

	// Create an AudioNode from the stream.
	realAudioInput = audioContext.createMediaStreamSource(stream);
	audioInput = realAudioInput;
	audioInput.connect(inputPoint);

	analyserNode = audioContext.createAnalyser();
	analyserNode.fftSize = 2048;
	inputPoint.connect( analyserNode );

	zeroGain = audioContext.createGain();
	//zeroGain.gain.value = 0.0;
    zeroGain.gain.setValueAtTime(0.0, audioContext.currentTime);
	inputPoint.connect( zeroGain );
	zeroGain.connect( audioContext.destination );
    isGotStream = true;

    if (!audioRecorder){
        var wss = $('.speech_comm.speech_recognition').data('wss');
        //CLOG(wss);
        var cachedate = $('.speech_comm.speech_recognition').data('cachedate');
        //CLOG(cachedate);
        var config = { "wss" : wss, "cachedate": cachedate};
        audioRecorder = new Recorder(inputPoint, config);
        audioRecorder.newWorker();
        audioRecorder.init();
    }
}

function initAudio() {
    if (isInit) return;
    //CLOG('initAudio');

    if(!audioContext)
        audioContext = new window.AudioContext;

    var constraints =
        {
            "audio": {
                "mandatory": {
                    "googEchoCancellation": "false",
                    "googAutoGainControl": "false",
                    "googNoiseSuppression": "false",
                    "googHighpassFilter": "false"
                },
                "optional": []
            }
        };
    function errorCallback(error) {
        CLOG("navigator.getUserMedia error: ", error);
    }

    navigator.mediaDevices.getUserMedia(constraints)
        .then(gotStream)
        .catch(errorCallback);

    isInit = true;
}

function initTTS() {
    if(synthesize) return;
    //CLOG('initTTS');
    var wss = $('.speech_comm.speech_compose').data('wss');
    //CLOG(wss);
    var cachedate = $('.speech_comm.speech_compose').data('cachedate');
    //CLOG(cachedate);
    var config = { "wss" : wss, "cachedate": cachedate};
    synthesize = new Synthesize(config);
}

window.addEventListener('load', init);
window.addEventListener('load', hashLoc);

function change_field(){

}