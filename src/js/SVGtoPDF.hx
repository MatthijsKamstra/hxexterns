package;

import haxe.Constraints.Function;
import haxe.extern.EitherType;
import js.html.svg.SVGElement;


//https://github.com/alafr/SVG-to-PDFKit

/**

doc [PDFDocument] = the PDF document created with PDFKit
svg [SVGElement or string] = the SVG object or XML code
x, y [number] = the position where the SVG will be added
options [Object] = >
  - width, height [number] = initial viewport, by default it's the page dimensions
  - preserveAspectRatio [string] = override alignment of the SVG content inside its viewport
  - useCSS [boolean] = use the CSS styles computed by the browser (for SVGElement only)
  - fontCallback [function] = function called to get the fonts, see source code
  - imageCallback [function] = same as above for the images (for Node.js)
  - warningCallback [function] = function called when there is a warning
  - assumePt [boolean] = assume that units are PDF points instead of SVG pixels
  - precision [number] = precision factor for approximative calculations (default = 3)

*/

typedef Options = {
	@:optional var width : Int;
	@:optional var height : Int; // [number] = initial viewport, by default it's the page dimensions
	@:optional var preserveAspectRatio : String; // [string] = override alignment of the SVG content inside its viewport
	@:optional var useCSS : Bool; // [boolean] = use the CSS styles computed by the browser (for SVGElement only)
	@:optional var fontCallback : Function; // [function] = function called to get the fonts, see source code
	@:optional var imageCallback : Function; //  [function] = same as above for the images (for Node.js)
	@:optional var warningCallback : Function; //  [function] = function called when there is a warning
	@:optional var assumePt : Bool; // [boolean] = assume that units are PDF points instead of SVG pixels
	@:optional var precision : Int; // [number] = precision factor for approximative calculations (default = 3)
};

// temp = aspectRatio.match(/^(none)$|^x(Min|Mid|Max)Y(Min|Mid|Max)(?:\s+(meet|slice))?$/) || [],

@:native("SVGtoPDF")
extern class SVGtoPDF
{

	@:selfCall
//   @:overload(function(element:js.html.Element):Void { })
//   @:overload(function(selection:js.jquery.JQuery):Void { })
//   @:overload(function(callback:haxe.Constraints.Function):Void { })
//   @:overload(function(selector:String, ?context:haxe.extern.EitherType<js.html.Element, js.jquery.JQuery>):Void { })
	public function new(doc:PDFDocument, svg:EitherType<String,SVGElement>, x:Int, y:Int, ?options:Options):Void;

    // public static var Pass:Dynamic;
	// @:overload(function (object:Dynamic, event:String, callback_function:Dynamic):Void {})
	// static function on(event:String, callback_function:Dynamic):Void;
	// static function showHint(cm:CodeMirror, getHints:Dynamic, ?options:ShowHintOptions):Void;
	// static function attachContextInfo(cm:CodeMirror, data:Dynamic):Void;
    // static function innerMode(mode:Dynamic, state:Dynamic):Dynamic;


	// public function pipe(obj:Dynamic):Dynamic;
	// public function fontSize(size:Int):PDFDocument;
	// public function save():Void;
	// public function circle():Void;
	// public function scale():Void;
	// public function text(text:String, x:Int, y:Int, options:Dynamic):Void;
	// public function end():Void;

}

