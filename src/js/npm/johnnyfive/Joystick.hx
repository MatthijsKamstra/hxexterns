package js.npm.johnnyfive;
/**
 * Haxe externs for Johnny-Five v1.0
 * Project: https://github.com/rwaldron/johnny-five
 * Definitions by: Matthijs Kamstra aka [mck] <https://github.com/MatthijsKamstra>
 * Definitions: <https://github.com/DefinitelyTyped/DefinitelyTyped/blob/master/types/johnny-five>
 *    			<https://github.com/MatthijsKamstra/hxexterns>
 */

typedef JoystickOption = {
	var pins : Array<String>;
	@:optional
	var invert : Bool;
	@:optional
	var invertX : Bool;
	@:optional
	var invertY : Bool;
};
extern class Joystick {
	function new(option:JoystickOption):Void;
	var id : String;
	var readonly : Dynamic;
	var x : Float;
	var y : Float;
	var axis : Array<Float>;
	var raw : Array<Float>;
	@:overload(function(event:String, cb:Dynamic -> Void):This { })
	@:overload(function(event:String, cb:Void -> Void):This { })
	@:overload(function(event:String, cb:Error -> Date -> Void):This { })
	function on(event:String, cb:Void -> Void):This;
}