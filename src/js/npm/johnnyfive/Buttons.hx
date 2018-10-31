package js.npm.johnnyfive;

import haxe.extern.EitherType;
import js.npm.johnnyfive.Button;

// // http://johnny-five.io/api/button/#parameters
typedef ButtonOptions = {
	var pins : Array<haxe.extern.EitherType<Int, String>>;
	@:optional
	var invert : Bool;
	@:optional
	var isPullup : Bool;
	@:optional
	var isPulldown : Bool;
	@:optional
	var holdtime : Int;
};

// @:enum abstract ButtonEvents(String) {
// 	var HOLD = 'hold';
// 	var DOWN = 'down';
// 	var PRESS = 'press';
// 	var UP = 'up';
// 	var RELEASE = 'release';
// }


/**
 * Haxe externs for Johnny-Five v1.0
 * Project: https://github.com/rwaldron/johnny-five
 * Definitions by: Matthijs Kamstra aka [mck] <https://github.com/MatthijsKamstra>
 * Definitions: <https://github.com/DefinitelyTyped/DefinitelyTyped/blob/master/types/johnny-five>
 *    			<https://github.com/MatthijsKamstra/hxexterns>
 */
@:jsRequire('johnny-five','Buttons')
@:native('Buttons')
extern class Buttons {

	 @:overload(function(collection:Array<Int>):Void { })
	 @:overload(function(collection:Array<Button>):Void { })
	 @:overload(function(collection:Array<Dynamic>):Void { })
	function new(collection:ButtonOptions):Void;

	// var id : String;
	// var pin : haxe.extern.EitherType<Int, String>;
	// var downValue : Int;
	// var upValue : Int;
	// var holdtime : Int;

	@:overload(function(event:String, cb:Int -> Void):Buttons { })
	@:overload(function(event:ButtonEvents, cb:Button -> Void):Buttons { })
	function on(event:String, cb:Button -> Void):Buttons;
}