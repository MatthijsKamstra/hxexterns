// Generated by Haxe 3.4.7
if (process.version < "v4.0.0") console.warn("Module " + (typeof(module) == "undefined" ? "" : module.filename) + " requires node.js version 4.0.0 or higher");
(function () { "use strict";
var MainNodeCanvas = function() {
	this.init0();
	this.init1();
	this.init2();
};
MainNodeCanvas.main = function() {
	var app = new MainNodeCanvas();
};
MainNodeCanvas.prototype = {
	init0: function() {
		var canvas = new Canvas(400,200,"svg");
		var ctx = canvas.getContext("2d",null);
		var y = 80;
		var x = 50;
		ctx.font = "22px Helvetica";
		ctx.fillText("node-canvas SVG",x,y);
		ctx.font = "10px Arial";
		ctx.fillText("Just a quick example of SVGs with node-canvas",x,y += 20);
		ctx.globalAlpha = 0.5;
		ctx.fillRect(x,y += 20,10,10);
		ctx.fillRect(x += 20,y,10,10);
		ctx.fillRect(x += 20,y,10,10);
		js_node_Fs.writeFile("out.svg",canvas.toBuffer(),function(err) {
			if(err != null) {
				throw err;
			}
			console.log("created out.svg");
		});
	}
	,init1: function() {
		var canvas = new Canvas(500,500,"pdf");
		var ctx = canvas.getContext("2d",null);
		var x;
		var y;
		var reset = function() {
			x = 50;
			y = 80;
		};
		var h1 = function(str) {
			ctx.font = "22px Helvetica";
			ctx.fillText(str,x,y);
		};
		var p = function(str1) {
			ctx.font = "10px Arial";
			var p1 = y += 20;
			ctx.fillText(str1,x,p1);
		};
		reset();
		h1("PDF demo");
		p("Multi-page PDF demonstration");
		ctx.addPage();
		reset();
		h1("Page #2");
		p("This is the second page");
		ctx.addPage();
		reset();
		h1("Page #3");
		p("This is the third page");
		js_node_Fs.writeFile("out.pdf",canvas.toBuffer(),function(err) {
			if(err != null) {
				throw err;
			}
			console.log("created out.pdf");
		});
	}
	,init2: function() {
		console.log("created image");
		var canvas = new Canvas(200,200);
		var ctx = canvas.getContext("2d");
		ctx.fillRect(0,0,150,150);
		ctx.save();
		ctx.fillStyle = "#09F";
		ctx.fillRect(15,15,120,120);
		ctx.save();
		ctx.fillStyle = "#FFF";
		ctx.globalAlpha = 0.5;
		ctx.fillRect(30,30,90,90);
		ctx.restore();
		ctx.fillRect(45,45,60,60);
		ctx.restore();
		ctx.fillRect(60,60,30,30);
		var img = new Canvas.Image();
		img.src = canvas.toBuffer();
		ctx.drawImage(img,0,0,50,50);
		ctx.drawImage(img,50,0,50,50);
		ctx.drawImage(img,100,0,50,50);
		img = new Canvas.Image();
		img.src = js_node_Fs.readFileSync(js_node_Path.join(__dirname,"images","squid.png"));
		ctx.drawImage(img,30,50,Math.round(img.width / 4),Math.round(img.height / 4));
		canvas.createPNGStream().pipe(js_node_Fs.createWriteStream(js_node_Path.join(__dirname,"out.png")));
	}
};
var haxe_io_Bytes = function(data) {
	this.length = data.byteLength;
	this.b = new Uint8Array(data);
	this.b.bufferValue = data;
	data.hxBytes = this;
	data.bytes = this.b;
};
var js_node_Fs = require("fs");
var js_node_Path = require("path");
var js_node_buffer_Buffer = require("buffer").Buffer;
var Canvas = require("canvas");
MainNodeCanvas.main();
})();
