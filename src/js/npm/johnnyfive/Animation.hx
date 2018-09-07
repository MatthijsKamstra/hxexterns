package js.npm.johnnyfive;
/**
 * Haxe externs for Johnny-Five v1.0
 * Project: https://github.com/rwaldron/johnny-five
 * Definitions by: Matthijs Kamstra aka [mck] <https://github.com/MatthijsKamstra>
 * Definitions: <https://github.com/DefinitelyTyped/DefinitelyTyped/blob/master/types/johnny-five>
 *    			<https://github.com/MatthijsKamstra/hxexterns>
 */
extern class Animation {
	function new(option:haxe.extern.EitherType<Servo, Array<Servo>>):Void;
	var target : Float;
	var duration : Float;
	var cuePoints : Array<Float>;
	var keyFrames : Float;
	var easing : String;
	var loop : Bool;
	var loopback : Float;
	var metronomic : Bool;
	var progress : Float;
	var currentSpeed : Float;
	var fps : Float;
	function enqueue(segment:Dynamic):Void;
	function play():Void;
	function pause():Void;
	function stop():Void;
	function next():Void;
	function speed(speed:Array<Float>):Void;
}
