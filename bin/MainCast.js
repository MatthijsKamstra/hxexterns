// Generated by Haxe 3.4.4
(function () { "use strict";
var MainCast = function() {
	var _gthis = this;
	var mdns = js_npm_castv2client_Mdns();
	this.browser = mdns.createBrowser(mdns.tcp("googlecast"));
	this.browser.on("serviceUp",function(service) {
		window.console.log("found device \"%s\" at %s:%d",service.name,service.addresses[0],service.port);
		_gthis.ondeviceup(service.addresses[0]);
		_gthis.browser.stop();
	});
	this.browser.start();
};
MainCast.main = function() {
	var app = new MainCast();
};
MainCast.prototype = {
	ondeviceup: function(host) {
		var DefaultMediaReceiver = require("castv2-client").DefaultMediaReceiver;
		var client = new js_npm_castv2client_Client();
		client.connect(host,function() {
			window.console.log("connected, launching app ...");
			client.launch(DefaultMediaReceiver,function(err,player) {
				var media = { contentId : "http://commondatastorage.googleapis.com/gtv-videos-bucket/big_buck_bunny_1080p.mp4", contentType : "video/mp4", streamType : "BUFFERED", metadata : { type : 0, metadataType : 0, title : "Big Buck Bunny", images : [{ url : "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg"}]}};
				player.on("status",function(status) {
					window.console.log("status broadcast playerState=%s",status.playerState);
				});
				window.console.log("app \"%s\" launched, loading media %s ...",player.session.displayName,media.contentId);
				player.load(media,{ autoplay : true},function(err1,status1) {
					window.console.log("media loaded playerState=%s",status1.playerState);
					setTimeout(function() {
						player.seek(120,function(err2,status2) {
						});
					},15000);
				});
			});
		});
		client.on("error",function(err3) {
			window.console.log("Error: %s",err3.message);
			client.close();
		});
	}
};
var js_npm_castv2client_Client = require("castv2-client").Client;
var js_npm_castv2client_Mdns = require("mdns");
MainCast.main();
})();
