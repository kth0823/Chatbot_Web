
function CLOG(log){
    console.log(log);
}

this.onmessage = function(e){
	switch(e.data.command){
		case 'init':
			init(e.data.config);
			break;
		case 'start':
			start(e.data.config);
            break;
        default :
            this.CLOG(e);
	}
};

function init() {
    CLOG("init");
    postMessage({ aType: 'text', aBuf: '{\"cmd\": \"init\"}'});
}

function start(config) {
    CLOG("start");
    CLOG(config);
    //http://stage-vox.i.kakao.com/v1/ttsURL 
    //-d '{"text":"안녕하세요. 테스트 페이지 입니다.", "engine":"deep", "voiceType":"spring", "toneType":"default", "outputType":"http"}'
    var xhr = new XMLHttpRequest();
    xhr.onload = function () {
        if (xhr.status === 200 || xhr.status === 201) {
        	CLOG("여기");
        	CLOG(xhr.response);
            retVal = xhr.response;
            file = open("out.mp3", "w")
            file.write(xhr.response)
            file.close()
        	//retVal = xhr.responseJSON;
        	//retVal = xhr.responseXML;
            CLOG(retVal);
//            var parsedJson = JSON.parse(retVal);
//            CLOG(parsedJson.ttsURL);
            postMessage({ aType: 'text', aBuf: '{\"cmd\": \"ttsUrl\", \"url\" : \"'+ parsedJson.ttsURL+'\" }' });
        } else {
            CLOG(xhr.responseText);
        }
    };
    //xhr.open('POST', 'http://stage-vox.i.kakao.com/v1/ttsURL');
    xhr.open('POST', config.url);
    //xhr.setRequestHeader('Content-Type', 'application/json'); // 컨텐츠타입을 json으로
    xhr.setRequestHeader('Content-Type', 'application/xml');
    xhr.setRequestHeader('Authorization',  'KakaoAK'+' 369dd298742c946f09cf5d8ad25f907c' );// 컨텐츠타입을 json으로
    //xhr.send(JSON.stringify(config.options)); // 데이터를 stringify해서 보냄
    xhr.send('<speak> 그는 그렇게 말했습니다.</speak>');
    CLOG("start send");
}