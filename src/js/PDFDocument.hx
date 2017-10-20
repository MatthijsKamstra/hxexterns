package;

import haxe.extern.EitherType;

typedef ImgOption = {
	?width: Float,
    ?height: Float,
    ?fit: Array<Int>,
    ?scale: Float,
	?align: String, // center, right
	?valign: String, // center, bottom
}
typedef PageOption = {
	?margin: EitherType<Int,Dynamic>,
}
typedef PDFMargin = {
	top: Int,
    left: Int,
    bottom: Int,
    right: Int
}

typedef PDFObject = {
	@:optional var size : PDFSize; // letter / a4
	@:optional var layout : PDFLayout; // portrait
	@:optional var margin : EitherType<Int, PDFMargin>;
}

// hmmm overenginering...
@:enum abstract PDFLayout(String) {
	var PORTRAIT = 'portrait';
	var LANDSCAPE = 'landscape';
}

// there are lots more.... but this will work for now
@:enum abstract PDFSize(String) {
	var A0 = 'a0';
	var A1 = 'a1';
	var A2 = 'a2';
	var A3 = 'a3';
	var A4 = 'a4';
	var A5 = 'a5';
	var LETTER = 'letter';
}

@:native("PDFPage")
extern class PDFPage {
	var size : String;
    var layout : String;
    var margins : Dynamic;
    var width : Float;
    var height : Float;
}

@:native("PDFImage")
extern class PDFImage {

}

@:native("PDFFont")
extern class PDFFont {
	var text : Dynamic;
}

// @:jsRequire("pdfkit")
@:native("PDFDocument")
extern class PDFDocument {
	var version : String;
	var options : Dynamic; // page dir and size

	var page : PDFPage;


	// var width: Float;
	// var height : Float;

//   @:selfCall
//   @:overload(function(element:js.html.Element):Void { })
//   @:overload(function(selection:js.jquery.JQuery):Void { })
//   @:overload(function(callback:haxe.Constraints.Function):Void { })
//   @:overload(function(selector:String, ?context:haxe.extern.EitherType<js.html.Element, js.jquery.JQuery>):Void { })
	public function new(?options:PDFObject):Void;

    // public static var Pass:Dynamic;
	// @:overload(function (object:Dynamic, event:String, callback_function:Dynamic):Void {})
	// static function on(event:String, callback_function:Dynamic):Void;
	// static function showHint(cm:CodeMirror, getHints:Dynamic, ?options:ShowHintOptions):Void;
	// static function attachContextInfo(cm:CodeMirror, data:Dynamic):Void;
    // static function innerMode(mode:Dynamic, state:Dynamic):Dynamic;


	public function pipe(dest:Dynamic, ?pipeOpts:Dynamic):Dynamic;
	public function fontSize(size:Int):PDFDocument;
	public function save():Void;
	public function circle(x:Int, y:Int, radius:Int):PDFDocument;
	public function rect(x:Int, y:Int, w:Float, h:Float):PDFDocument;
	public function lineWidth(w:Int):PDFDocument;
	public function fill(color:EitherType<Int,String>, ?rule:Dynamic):PDFDocument;
	public function fillAndStroke(fillColor:EitherType<Int,String>, strokeColor:EitherType<Int,String>, ?rule:Dynamic):PDFDocument;
	public function fillOpacity(opacity:Float):PDFDocument;
	public function strokeOpacity(opacity:Float):PDFDocument;
	public function scale():Void;
	/**
	 *  http://pdfkit.org/docs/images.html
	 *  Neither width or height provided - image is rendered at full size
width provided but not height - image is scaled proportionally to fit in the provided width
height provided but not width - image is scaled proportionally to fit in the provided height
Both width and height provided - image is stretched to the dimensions provided
scale factor provided - image is scaled proportionally by the provided scale factor
fit array provided - image is scaled proportionally to fit within the passed width and height
	 *  @param src -
	 *  @param x -
	 *  @param y -
	 *  @param options -
	 */

	 // ArrayBuffer, Buffer // data: <string>
	public function image(src:EitherType<String,Dynamic>, x:Int, y:Int, ?options:ImgOption):Void;

	@:overload(function (src:String, ?size:Int):PDFFont {})
	public function font(src:String, ?family:String, ?size:Int):PDFFont;

	public function text(text:String, x:Int, y:Int, options:Dynamic):Void;
	public function end():Void;
	public function addPage(?options:PageOption):Void;

}

