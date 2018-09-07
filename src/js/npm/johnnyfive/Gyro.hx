package js.npm.johnnyfive;
/**
 * Haxe externs for Johnny-Five v1.0
 * Project: https://github.com/rwaldron/johnny-five
 * Definitions by: Matthijs Kamstra aka [mck] <https://github.com/MatthijsKamstra>
 * Definitions: <https://github.com/DefinitelyTyped/DefinitelyTyped/blob/master/types/johnny-five>
 *    			<https://github.com/MatthijsKamstra/hxexterns>
 */
typedef GyroGeneralOption = {
	@:optional
	var controller : String;
};
typedef GyroAnalogOption = {
	>GyroGeneralOption,
	var pins : Array<String>;
	var sensitivity : Float;
	@:optional
	var resolution : Float;
};
typedef GyroMPU6050Option = {
	>GyroGeneralOption,
	var sensitivity : Float;
};
extern class Gyro {
	function new(option:haxe.extern.EitherType<GyroGeneralOption, haxe.extern.EitherType<GyroAnalogOption, GyroMPU6050Option>>):Void;
	var id : String;
	var pins : Array<String>;
	var readonly : Dynamic;
	var isCalibrated : Bool;
	var pitch : Dynamic;
	var roll : Dynamic;
	var yaw : Dynamic;
	var rate : Dynamic;
	var x : Float;
	var y : Float;
	var z : Float;
	@:overload(function(event:String, cb:Void -> Void):This { })
	@:overload(function(event:String, cb:Dynamic -> Void):This { })
	function on(event:String, cb:Void -> Void):This;
	function recalibrate():Void;
}