package js.johnnyfive;

import js.johnnyfive.Pin;
import js.johnnyfive.Repl;

typedef BoardOption = {
	@:optional
	var id : haxe.extern.EitherType<Float, String>;
	@:optional
	var port : haxe.extern.EitherType<String, Dynamic>;
	@:optional
	var repl : Bool;
	@:optional
	var debug : Bool;
	@:optional
	var timeout : Float;
	@:optional
	var io : Dynamic;
};


/**
 * Haxe externs for Johnny-Five v1.0
 * Project: https://github.com/rwaldron/johnny-five
 * Definitions by: Matthijs Kamstra aka [mck] <https://github.com/MatthijsKamstra>
 * Definitions: <https://github.com/DefinitelyTyped/DefinitelyTyped/blob/master/types/johnny-five>
 *    			<https://github.com/MatthijsKamstra/hxexterns>
 */
@:native('five.Board')
extern class Board {
	function new(?option:BoardOption):Void;
	var io : Dynamic;
	var id : String;
	var repl : Dynamic;
	var isReady : Bool;
	var pins : Array<Pin>;
	var port : String;
	var inject : Repl;
	@:overload(function(event:String, cb:Void -> Void):Board { })
	@:overload(function(event:String, cb:Void -> Void):Board { })
	function on(event:String, cb:Void -> Void):Board;
	function pinMode(pin:Float, mode:Float):Void;
	function analogWrite(pin:Float, value:Float):Void;
	function analogRead(pin:Float, cb:Float -> Void):Void;
	function digitalWrite(pin:Float, value:Float):Void;
	function digitalRead(pin:Float, cb:Float -> Void):Void;
	function servoWrite(pin:Float, angle:Float):Void;
	function shiftOut(dataPin:Pin, clockPin:Pin, isBigEndian:Bool, value:Float):Void;
	function wait(ms:Float, cb:Void -> Void):Void;
	function loop(ms:Float, cb:Void -> Void):Void;
	function samplingInterval(ms:Float):Void;
}