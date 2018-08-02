import js.Promise;
import js.node.Fs;
import node.Fr;

import js.Browser.console;



class MainFaceRecognition {

	public function new() {
		// var fr = new Fr();
		init00();
		init01();
		init02();
		init03();
		init04();
	}

	// Loading images from disk
	function init00(){
		var image1 = Fr.loadImage('path/to/image1.png');
	}

	// Displaying Images
	function init01(){
		var image = Fr.loadImage('path/to/image1.png');

		var win = new ImageWindow();

		// display image
		win.setImage(image);


		var rectangle = new Rect(0,0,0,0);
		// drawing the rectangle into the displayed image
		win.addOverlay(rectangle);

		// pause program until key pressed
		Fr.hitEnterToContinue();
	}

	// Face Detection
	function init02(){

		var image = Fr.loadImage('path/to/image1.png');

		var detector = Fr.FaceDetector();

		// Detect all faces in the image and return the bounding rectangles:
		var faceRectangles = detector.locateFaces(image);

		// Detect all faces and return them as seperate images:
		var faceImages = detector.detectFaces(image);

		// You can also specify the output size of the face images (default is 150 e.g. 150x150):
		var targetSize = 200;
		var faceImages = detector.detectFaces(image, targetSize);

	}

		// Face Recognition
	function init03(){


		var image = Fr.loadImage('path/to/image1.png');

		var detector = Fr.FaceDetector();

		// Detect all faces and return them as seperate images:
		var faceImages = detector.detectFaces(image);

		// ____________________________________ getter/setter ____________________________________

		var recognizer = Fr.FaceRecognizer();
		// Train the recognizer with face images of atleast two different persons:

		// arrays of face images, (use FaceDetector to detect and extract faces)
		var sheldonFaces =  faceImages ;
		var rajFaces =  faceImages ;
		var howardFaces = faceImages ;

		recognizer.addFaces(sheldonFaces, 'sheldon');
		recognizer.addFaces(rajFaces, 'raj');
		recognizer.addFaces(howardFaces, 'howard');

		// You can also jitter the training data, which will apply transformations such as rotation, scaling and mirroring to create different versions of each input face. Increasing the number of jittered version may increase prediction accuracy but also increases training time:
		var numJitters = 15;
		recognizer.addFaces(sheldonFaces, 'sheldon', numJitters);
		recognizer.addFaces(rajFaces, 'raj', numJitters);
		recognizer.addFaces(howardFaces, 'howard', numJitters);

		// Get the distances to each class:
		var sheldonFaceImage = Fr.loadImage('path/to/image1.png');
		var predictions = recognizer.predict(sheldonFaceImage);
		console.log(predictions);

		// example output (the lower the distance, the higher the similarity):

		// [
		//   {
		//     className: 'sheldon',
		//     distance: 0.5
		//   },
		//   {
		//     className: 'raj',
		//     distance: 0.8
		//   },
		//   {
		//     className: 'howard',
		//     distance: 0.7
		//   }
		// ]

		// Or immediately get the best result:
		var bestPrediction = recognizer.predictBest(sheldonFaceImage);
		console.log(bestPrediction);
		// example output:

		// {
		//   className: 'sheldon',
		//   distance: 0.5
		// }

		// Save a trained model to json file:
		// var fs = require('fs');
		var modelState = recognizer.serialize();
		Fs.writeFileSync('model.json', haxe.Json.stringify(modelState));

		// Load a trained model from json file:
		var modelState = js.Lib.require('model.json');
		recognizer.load(modelState);
	}

	// Async API
	// Async Face Detection
	function init04() {

		var detector = Fr.AsyncFaceDetector();

		var lenna = Fr.loadImage('./data/Lenna.png');
		var got = Fr.loadImage('./data/got.jpg');

		console.log('detecting faces');
		var faceSize = 150;

		Promise.all([
		  detector.detectFaces(lenna, faceSize),
		  detector.detectFaces(got, faceSize)
		])
		  .then((response:Array<Dynamic>) -> {
		    var  win1 = new ImageWindow();
		    var  win2 = new ImageWindow();
			var lennaFaces = response[0];
			var gotFaces = response[1];
		    win1.setImage(Fr.tileImages(lennaFaces));
		    win2.setImage(Fr.tileImages(gotFaces));
		    Fr.hitEnterToContinue();
		  })
		  .catchError((err) -> {
		    console.error(err);
		  });

	}


	static public function main() {
		var app = new MainFaceRecognition();
	}
}