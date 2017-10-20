package node;

import js.html.CanvasElement;
import haxe.extern.EitherType;
import js.node.buffer.Buffer;



// "canvas": "1.6.7",

@:jsRequire("canvas")
@:native('Canvas')
extern class Canvas extends js.html.CanvasElement {

	// @:selfCall
	/**
	 *  create new canvas in version 1.6.7
	 *  @param width - in pixels
	 *  @param height -
	 *  @param type - 'svg' / 'pdf'
	 */
	function new (width:Int, height:Int, ?type:String) : Void;

	function toBuffer() : Dynamic;


	function createPNGStream() : PNGStream;
	// function createPNGStream() : Dynamic;


	// /**
	//  *  [Description]
	//  *  @param width -
	//  *  @param height -
	//  *  @param type - 'svg' / 'pdf'
	//  *  @return Dynamic
	//  */
	// static function createCanvas (width:Int, height:Int, type:String):CanvasElement;
	// // static function createCanvas (width:Int, height:Int, type:String):Dynamic;

	// function createImageData (array:Array<Dynamic>, width:Int, height:Int): Dynamic;

	// function loadImage (src:String) : Dynamic;// Promise;

	// /**
	//  * Resolve paths for registerFont. Must be called *before* creating a Canvas
	//  * instance.
	//  * @param src {string} Path to font file.
	//  * @param fontFace {{family: string, weight?: string, style?: string}} Object
	//  * specifying font information. `weight` and `style` default to `"normal"`.
	//  */
	// function registerFont (src:String, fontFace:Dynamic) : Dynamic;
}

// @:jsRequire("canvas")
@:native('Canvas.Image')
extern class Image {

	function new () : Void;

	var src : EitherType<String, Buffer>;
	var width : Int;
	var height : Int;
}

// @:jsRequire("stream")
extern class PNGStream extends js.node.stream.Readable<PNGStream>{

}