package js.npm.johnnyfive;
/**
 * Haxe externs for Johnny-Five v1.0
 * Project: https://github.com/rwaldron/johnny-five
 * Definitions by: Matthijs Kamstra aka [mck] <https://github.com/MatthijsKamstra>
 * Definitions: <https://github.com/DefinitelyTyped/DefinitelyTyped/blob/master/types/johnny-five>
 *    			<https://github.com/MatthijsKamstra/hxexterns>
 */

typedef IMUGeneralOption = {
	@:optional
	var controller : String;
	@:optional
	var freq : Float;
};
typedef IMUMPU6050Option = {
	>IMUGeneralOption,
	var address : Float;
};
extern class IMU {
	function new(option:haxe.extern.EitherType<IMUGeneralOption, IMUMPU6050Option>):Void;
	var readonly : Dynamic;
	var accelerometer : Accelerometer;
	var compass : Compass;
	var gyro : Gyro;
	var orientation : Orientiation;
	var thermometer : Thermometer;
	@:overload(function(event:String, cb:Void -> Void):This { })
	@:overload(function(event:String, cb:Dynamic -> Void):This { })
	@:overload(function(event:String, cb:Void -> Void):This { })
	function on(event:String, cb:Void -> Void):This;
}