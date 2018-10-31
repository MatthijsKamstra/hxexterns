package js.npm.johnnyfive;

import haxe.extern.EitherType;

/**
 * Haxe externs for Johnny-Five v1.0
 * Project: https://github.com/rwaldron/johnny-five
 * Definitions by: Matthijs Kamstra aka [mck] <https://github.com/MatthijsKamstra>
 * Definitions: <https://github.com/DefinitelyTyped/DefinitelyTyped/blob/master/types/johnny-five>
 *    			<https://github.com/MatthijsKamstra/hxexterns>
 */

typedef LedOption = {
	var pin : Float;
	@:optional
	var type : String;
	@:optional
	var controller : String;
	@:optional
	var address : Float;
	@:optional
	var isAnode : Bool;
};

@:jsRequire('johnny-five','Led')
@:native('Led')
extern class Led {

	var id : String;
	var pin : Float;

	function new(option:EitherType<String, EitherType<Float, LedOption>>):Void;

	function on():Void;
	function off():Void;
	function toggle():Void;
	function strobe(ms:Float):Void;

	@:overload(function(ms:Float):Void { })
	function blink():Void;

	function brightness(val:Float):Void;
	function fade(brightness:Float, ms:Float):Void;
	function fadeIn(ms:Float):Void;
	function fadeOut(ms:Float):Void;
	function pulse(ms:Float):Void;
	function stop(ms:Float):Void;
}
