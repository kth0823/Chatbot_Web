(function(window){

	function message(msg){  
	    try {
            var parsedJson = JSON.parse(msg);
            if( parsedJson.cmd == "ttsUrl") {
                CLOG('ttsUrl');
				CLOG(parsedJson.url);
				LoadAudio(parsedJson.url);
				//if (synthesize)
				//	synthesize.LoadAudio(parsedJson.url);
            } else {
                CLOG(msg);
			}
         } catch(e) {
             CLOG('e.message:' + e.message);
         }
	}  

	var Synthesize = function(cfg){
		var config = cfg || {};
		CLOG(config);
		var bufferLen = config.bufferLen || 4096;
		//var WORKER_PATH = 'synthesizeWorker.js' + config.cachedate;
		var WORKER_PATH = '/resources/js/synthesizeWorker.js' 
		//var API_URL = 'https://demo-vox-proxy.i.kakao.com/v1/ttsURL'
			var API_URL = 'https://kakaoi-newtone-openapi.kakao.com/v1/synthesize'
        CLOG('bufferLen='+bufferLen);
		var worker = new Worker(config.workerPath || WORKER_PATH);
		worker.onmessage = function (e) {
			CLOG("worker.onmessage");
			switch (e.data.aType) {
				case 'text':
					CLOG("onmessage text");
					message(e.data.aBuf);
					//translation( e.data.aBuf );
					break;
				case 'blob':
					CLOG("onmessage blob");
					var blob = e.data.aBuf;
					currCallback(blob);
					break;
				case 'raw':
					CLOG("onmessage raw");
					var blob = e.data.aBuf;
					currCallback(blob);
					break;
				default:
					throw 'no aType on incoming message to ChromeWorker';
			}
		}

		this.configure = function(cfg){
			for (var prop in cfg){
				if (cfg.hasOwnProperty(prop)){
					config[prop] = cfg[prop];
				}
			}
		}

		this.newWorker = function(){
			worker = new Worker(config.workerPath || WORKER_PATH);
		}

		this.deleteWorker = function(){
			worker.terminate();
		}

		this.init = function(){
			worker.postMessage({
				command: 'init',
				config: {
					url: API_URL,
					wss: config.wss,
				}
			});
		}

		this.start = function(data){
			CLOG(data);
			worker.postMessage({
				command: 'start',
				config: {
					url: API_URL,
					options: data,
					
				}
			});
		}
		
		/*
        this.LoadAudio = function (url) {
            CLOG('LoadAudio');
            CLOG(url);
            var link = document.getElementById("audioPlayer");
            link.src = url;
            link.load();
			link.play();
			link.onended();
		};
		*/
	};

	window.Synthesize = Synthesize;
})(window);
