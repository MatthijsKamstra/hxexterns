package js.npm.johnnyfive;

typedef ESCOption = {
	var pin : haxe.extern.EitherType<Float, String>;
	@:optional
	var range : Array<Float>;
	@:optional
	var startAt : Float;
	@:optional
	var controller : String;
	@:optional
	var device : String;
	@:optional
	var neutral : Float;
};

/**
 * Haxe externs for Johnny-Five v1.0
 * Project: https://github.com/rwaldron/johnny-five
 * Definitions by: Matthijs Kamstra aka [mck] <https://github.com/MatthijsKamstra>
 * Definitions: <https://github.com/DefinitelyTyped/DefinitelyTyped/blob/master/types/johnny-five>
 *    			<https://github.com/MatthijsKamstra/hxexterns>
 */
extern class ESC {
	function new(option:haxe.extern.EitherType<Float, haxe.extern.EitherType<String, ESCOption>>):Void;
	var id : String;
	var pin : haxe.extern.EitherType<Float, String>;
	var range : Array<Float>;
	var readonly : Dynamic;
	var value : Float;
	function speed(value:Float):Void;
	function min():Void;
	function max():Void;
	function stop():Void;
}