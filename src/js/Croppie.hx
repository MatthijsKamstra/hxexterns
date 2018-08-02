package js;

import haxe.Constraints.Function;
import haxe.extern.EitherType;
import js.html.svg.SVGElement;

// http://foliotek.github.io/Croppie/

typedef CroppyObject = {
	@:optional var boundary : EitherType<Dynamic, CroppySize>;
	@:optional var customClass : String;
	@:optional var enableExif : Bool;
	@:optional var enableOrientation : Bool;
	@:optional var enableResize : Bool;
	@:optional var enableZoom : Bool;
	@:optional var enforceBoundary : Bool;
	@:optional var mouseWheelZoom : EitherType<Bool, String>;
	@:optional var showZoomer : Bool;
	@:optional var viewport : EitherType<Dynamic, CroppySize>;
}

typedef CroppySize = {
	@:optional var width:Int;
	@:optional var height:Int;
	@:optional var type:String; // square' 'circle'
}

typedef CroppyResult = {
	@:optional var type : String; // defaults to 'canvas'
		// 'base64' returns a the cropped image encoded in base64
		// 'html' returns html of the image positioned within an div of hidden overflow
		// 'blob' returns a blob of the cropped image
		// 'rawcanvas' returns the canvas element allowing you to manipulate prior to getting the resulted image
	@:optional var size : String; // defaults to 'viewport'
		// 'viewport' the size of the resulting image will be the same width and height as the viewport
		// 'original' the size of the resulting image will be at the original scale of the image
		// {width, height} an object defining the width and height. If only one dimension is specified, the other will be calculated using the viewport aspect ratio.

	@:optional var format : String; // Indicating the image format.
		// Default:'png'
		// Valid values:'jpeg'|'png'|'webp'
	@:optional var quality : Float;  //  Default:1// umber between 0 and 1 indicating image quality.
	@:optional var circle : Bool; //  force the result to be cropped into a circle
	//	Valid Values:truefalse
}


@:jsRequire("Croppie")
@:native("Croppie")
extern class Croppie {

	public function new(el:js.html.Element,obj:CroppyObject):Void;

	public function get():Dynamic;
	public function bind(obj:Dynamic):Void;
	public function destroy():Void;

	@:overload(function(str:String):js.Promise<Dynamic> { })
	public function result(obj:CroppyResult):js.Promise<Dynamic>;

	public function rotate(degrees:Int):Void;
	public function setZoom(value:Int):Void;

}