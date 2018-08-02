package node;

import js.Promise;


// extern class Array {
// 	function new(data:Array<Float>):Void;
// 	function getData():Array<Float>;
// 	var readonly : Dynamic;
// 	var length : Float;
// }
//
//
typedef ImageGray = {
	var readonly : Dynamic;
	var cols : Float;
	var rows : Float;
};
typedef ImageRGB = {
	var readonly : Dynamic;
	var cols : Float;
	var rows : Float;
	function toGray():ImageGray;
};
@:native('CvImage')
extern class CvImage {
	var readonly : Dynamic;
	var cols : Float;
	var rows : Float;
	function new(cvMat:Dynamic):Void;
}
@:native('Rect')
extern class Rect {
	function new(left:Float, top:Float, right:Float, bottom:Float):Void;
	var readonly : Dynamic;
	var left : Float;
	var top : Float;
	var right : Float;
	var bottom : Float;
	var area : Float;
}
typedef Point = {
	var readonly : Dynamic;
	var z : Float;
	var y : Float;
	var x : Float;
};
typedef MmodRect = {
	var readonly : Dynamic;
	var confidence : Float;
	var rect : Rect;
};
typedef FaceDescriptorState = {
	var className : String;
	var numFaces : Float;
};
typedef FaceDescriptor = {
	var className : String;
	var faceDescriptors : Array<Array<Float>>;
};
typedef FacePrediction = {
	var className : String;
	var distance : Float;
};
typedef ChipDetails = {
	var readonly : Dynamic;
	var rect : Rect;
	var size : Float;
	var angle : Float;
	var cols : Float;
	var rows : Float;
};
typedef FaceDetector = {
	function detectFaces(img:ImageRGB, ?faceSize:Float):Array<ImageRGB>;
	function locateFaces(img:ImageRGB):Array<MmodRect>;
	function getFacesFromLocations(img:ImageRGB, rects:Array<Rect>, ?faceSize:Float):Array<ImageRGB>;
};
typedef AsyncFaceDetector = {
	function detectFaces(img:ImageRGB, ?faceSize:Float):Promise<Array<ImageRGB>>;
	function locateFaces(img:ImageRGB):Promise<Array<MmodRect>>;
	function getFacesFromLocations(img:ImageRGB, rects:Array<Rect>, ?faceSize:Float):Promise<Array<ImageRGB>>;
};
typedef FaceRecognizer = {
	function predict(image:ImageRGB):Array<FacePrediction>;
	function predictBest(image:ImageRGB, ?unknownThreshold:Float):FacePrediction;
	function load(descriptors:Array<FaceDescriptor>):Void;
	function getDescriptorState():Array<FaceDescriptorState>;
	function serialize():Array<FaceDescriptor>;
	function addFaces(faces:Array<ImageRGB>, className:String, ?numJitters:Float):Void;
	function clear():Void;
	function getFaceDescriptors(face:haxe.extern.EitherType<ImageRGB, CvImage>):Array<Int>;
};
typedef AsyncFaceRecognizer = {
	function predict(image:ImageRGB):Promise<Array<FacePrediction>>;
	function predictBest(image:ImageRGB, ?unknownThreshold:Float):Promise<FacePrediction>;
	function load(rawDescriptors:Dynamic):Void;
	function getDescriptorState():Array<FaceDescriptorState>;
	function serialize():Array<FaceDescriptor>;
	function addFaces(faces:Array<ImageRGB>, className:String, ?numJitters:Float):Promise<Void>;
	function clear():Void;
};
typedef FullObjectDetection = {
	var readonly : Dynamic;
	var numParts : Float;
	var rect : Rect;
	function getParts():Array<Point>;
};
typedef FaceLandmarkPredictor = {
	function predict(img:ImageRGB, rect:Rect):FullObjectDetection;
	function predictAsync(img:ImageRGB, rect:Rect):Promise<FullObjectDetection>;
};
extern class FrontalFaceDetector {
	function new():Void;
	function detect(img:ImageRGB, ?adjustThreshold:Float):Array<Rect>;
}
// @:jsRequire("fr")
@:native('ImageWindow')
extern class ImageWindow {
	function new():Void;
	function close():Void;
	function setImage(image:haxe.extern.EitherType<ImageRGB, ImageGray>):Void;
	function addOverlay(rect:Rect, ?label:String):Void;
	function clearOverlay():Void;
	function setSize(width:Float, height:Float):Void;
	function renderFaceDetections(shapes:Array<FullObjectDetection>):Void;
}
extern class ShapePredictor {
	function new(faceLandmarksModelFilePath:String):Void;
	function predict(image:ImageRGB, rect:Rect):FullObjectDetection;
	function predictAsync(image:ImageRGB, rect:Rect):Promise<FullObjectDetection>;
}
extern class FaceDetectorNet {
	function new(faceDetectionModelFilePath:String):Void;
	function detect(image:ImageRGB):MmodRect;
	function detectAsync(image:ImageRGB):Promise<MmodRect>;
}
extern class FaceRecognizerNet {
	function new(faceRecognitionModelFilePath:String):Void;
	function computeFaceDescriptor(faceImage:ImageRGB):Array<Dynamic>;
	function computeFaceDescriptorAsync(faceImage:ImageRGB):Promise<Array<Dynamic>>;
}

/**
// https://github.com/justadudewhohacks/face-recognition.js
 *
  "name": "face-recognition",
  "version": "0.9.3",
  "description": "Simple Node.js API for robust face detection and face recognition.",
 */
@:jsRequire("fr")
@:native('fr')
extern class Fr {
	static function winKillProcessOnExit():Void;
	static function hitEnterToContinue():Void;
	static function loadImage(path:String):ImageRGB;
	static function saveImage(path:String, image:haxe.extern.EitherType<ImageRGB, ImageGray>, ?isJpeg:Bool):Void;
	static function tileImages(images:Array<ImageRGB>):ImageRGB;
	static function pyramidUp(image:ImageRGB):ImageRGB;
	static function resizeImage(image:ImageRGB, scale:Float):ImageRGB;
	static function cvImageToImageRGB(image:CvImage):ImageRGB;
	static function jitterImage(image:ImageRGB, numJitters:Float):Array<ImageRGB>;
	static function getFaceChipDetails(detections:Array<FullObjectDetection>, ?faceSize:Float, ?padding:Float):Array<ChipDetails>;
	static function extractImageChips(image:ImageRGB, chipDetails:Array<ChipDetails>):Array<ImageRGB>;
	static function mean(input:Array<String>):Array<Dynamic>;
	static function distance(input1:Array<Dynamic>, input2:Array<Dynamic>):Float;
	static function FaceDetector(?useFaceLandmarks68Model:Bool):FaceDetector;
	static function FaceRecognizer():FaceRecognizer;
	static function FaceLandmark5Predictor():FaceLandmarkPredictor;
	static function FaceLandmark68Predictor():FaceLandmarkPredictor;
	static function AsyncFaceDetector(?useFaceLandmarks68Model:Bool):AsyncFaceDetector;
	static function AsyncFaceRecognizer():AsyncFaceRecognizer;
	static var models : { var faceLandmarks5Model : String; var faceLandmarks68Model : String; var faceDetectionModel : String; var faceRecognitionModel : String; };
	static function withCv(cv:Dynamic):Void;
	static function toCvRect(dlibRect:Rect):Dynamic;
	static function fromCvRect(cvRect:Dynamic):Rect;
}
