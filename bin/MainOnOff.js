// Generated by Haxe 3.4.4
(function () { "use strict";
var MainOnOff = function() {
	this.init4();
};
MainOnOff.main = function() {
	var app = new MainOnOff();
};
MainOnOff.prototype = {
	init1: function() {
		var led = new Gpio(17,"out");
		var button = new Gpio(4,"in","both");
		button.watch(function(err,value) {
			if(err != null) {
				throw err;
			}
			led.writeSync(value);
		});
		process.on("SIGINT",function() {
			led.unexport();
			button.unexport();
		});
	}
	,init2: function() {
		var led = new Gpio(17,"out");
		var iv = new haxe_Timer(200);
		iv.run = function() {
			var tmp = led.readSync() ^ 1;
			led.writeSync(tmp);
		};
		haxe_Timer.delay(function() {
			iv.stop();
			led.writeSync(0);
			led.unexport();
		},5000);
	}
	,init2a: function() {
		var led = new Gpio(17,"out");
		var iv = window.setInterval(function() {
			var iv1 = led.readSync() ^ 1;
			led.writeSync(iv1);
		},200);
		window.setTimeout(function() {
			window.clearInterval(iv);
			led.writeSync(0);
			led.unexport();
		},5000);
	}
	,init3: function() {
		var led = new Gpio(17,"out");
	}
	,init4: function() {
		this.led = new Gpio(4,"out");
		this.blinkInterval = window.setInterval($bind(this,this.blinkLED),250);
		window.setTimeout($bind(this,this.endBlink),5000);
	}
	,blinkLED: function() {
		if(this.led.readSync() == 0) {
			this.led.writeSync(1);
		} else {
			this.led.writeSync(0);
		}
	}
	,endBlink: function() {
		window.clearInterval(this.blinkInterval);
		this.led.writeSync(0);
		this.led.unexport();
	}
};
var haxe_Timer = function(time_ms) {
	var me = this;
	this.id = setInterval(function() {
		me.run();
	},time_ms);
};
haxe_Timer.delay = function(f,time_ms) {
	var t = new haxe_Timer(time_ms);
	t.run = function() {
		t.stop();
		f();
	};
	return t;
};
haxe_Timer.prototype = {
	stop: function() {
		if(this.id == null) {
			return;
		}
		clearInterval(this.id);
		this.id = null;
	}
	,run: function() {
	}
};
var Gpio = require("onoff").Gpio;
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; }
MainOnOff.main();
})();
