// Generated by Haxe 4.0.2
(function ($global) { "use strict";
var MainFaceRecognition = function() {
	this.init00();
	this.init01();
	this.init02();
	this.init03();
	this.init04();
};
MainFaceRecognition.main = function() {
	var app = new MainFaceRecognition();
};
MainFaceRecognition.prototype = {
	init00: function() {
		var image1 = fr.loadImage("path/to/image1.png");
	}
	,init01: function() {
		var image = fr.loadImage("path/to/image1.png");
		var win = new ImageWindow();
		win.setImage(image);
		var rectangle = new Rect(0,0,0,0);
		win.addOverlay(rectangle);
		fr.hitEnterToContinue();
	}
	,init02: function() {
		var image = fr.loadImage("path/to/image1.png");
		var detector = fr.FaceDetector();
		var faceRectangles = detector.locateFaces(image);
		var faceImages = detector.detectFaces(image);
		var targetSize = 200;
		var faceImages1 = detector.detectFaces(image,targetSize);
	}
	,init03: function() {
		var image = fr.loadImage("path/to/image1.png");
		var detector = fr.FaceDetector();
		var faceImages = detector.detectFaces(image);
		var recognizer = fr.FaceRecognizer();
		var sheldonFaces = faceImages;
		var rajFaces = faceImages;
		var howardFaces = faceImages;
		recognizer.addFaces(sheldonFaces,"sheldon");
		recognizer.addFaces(rajFaces,"raj");
		recognizer.addFaces(howardFaces,"howard");
		var numJitters = 15;
		recognizer.addFaces(sheldonFaces,"sheldon",numJitters);
		recognizer.addFaces(rajFaces,"raj",numJitters);
		recognizer.addFaces(howardFaces,"howard",numJitters);
		var sheldonFaceImage = fr.loadImage("path/to/image1.png");
		var predictions = recognizer.predict(sheldonFaceImage);
		window.console.log(predictions);
		var bestPrediction = recognizer.predictBest(sheldonFaceImage);
		window.console.log(bestPrediction);
		var modelState = recognizer.serialize();
		js_node_Fs.writeFileSync("model.json",JSON.stringify(modelState));
		var modelState1 = require("model.json");
		recognizer.load(modelState1);
	}
	,init04: function() {
		var detector = fr.AsyncFaceDetector();
		var lenna = fr.loadImage("./data/Lenna.png");
		var got = fr.loadImage("./data/got.jpg");
		window.console.log("detecting faces");
		var faceSize = 150;
		Promise.all([detector.detectFaces(lenna,faceSize),detector.detectFaces(got,faceSize)]).then(function(response) {
			var win1 = new ImageWindow();
			var win2 = new ImageWindow();
			var lennaFaces = response[0];
			var gotFaces = response[1];
			win1.setImage(fr.tileImages(lennaFaces));
			win2.setImage(fr.tileImages(gotFaces));
			fr.hitEnterToContinue();
			return;
		}).catch(function(err) {
			window.console.error(err);
			return;
		});
	}
};
var js_node_Fs = require("fs");
var fr = require("fr");
MainFaceRecognition.main();
})({});
