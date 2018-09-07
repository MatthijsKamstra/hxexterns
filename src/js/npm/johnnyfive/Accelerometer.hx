package js.npm.johnnyfive;
/**
 * Haxe externs for Johnny-Five v1.0
 * Project: https://github.com/rwaldron/johnny-five
 * Definitions by: Matthijs Kamstra aka [mck] <https://github.com/MatthijsKamstra>
 * Definitions: <https://github.com/DefinitelyTyped/DefinitelyTyped/blob/master/types/johnny-five>
 *    			<https://github.com/MatthijsKamstra/hxexterns>
 */

typedef AccelerometerOption = {
	var controller : String;
};
typedef AccelerometerGeneralOption = {
	@:optional
	var controller : String;
};
typedef AccelerometerAnalogOption = {
	>AccelerometerGeneralOption,
	var pins : Array<String>;
	@:optional
	var sensitivity : Float;
	@:optional
	var aref : Float;
	@:optional
	var zeroV : haxe.extern.EitherType<Float, Array<Float>>;
	@:optional
	var autoCalibrate : Bool;
};
typedef AccelerometerMPU6050Option = {
	>AccelerometerGeneralOption,
	@:optional
	var sensitivity : Float;
};
typedef AccelerometerMMA7361Option = {
	>AccelerometerGeneralOption,
	@:optional
	var sleepPin : haxe.extern.EitherType<Float, String>;
};
extern class Accelerometer {
	function new(option:haxe.extern.EitherType<AccelerometerGeneralOption, haxe.extern.EitherType<AccelerometerAnalogOption, haxe.extern.EitherType<AccelerometerMPU6050Option, AccelerometerMMA7361Option>>>):Void;
	var id : String;
	var zeroV : Float;
	var pins : Array<String>;
	var readonly : Dynamic;
	var pitch : Float;
	var roll : Float;
	var x : Float;
	var y : Float;
	var z : Float;
	var acceleration : Float;
	var inclination : Float;
	var orientation : Float;
	@:overload(function(event:String, cb:Void -> Void):This { })
	@:overload(function(event:String, cb:Dynamic -> Void):This { })
	function on(event:String, cb:Void -> Void):This;
	function hasAxis(name:String):Void;
	function enable():Void;
	function disable():Void;
}