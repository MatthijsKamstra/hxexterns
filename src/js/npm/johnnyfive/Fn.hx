package js.npm.johnnyfive;
/**
 * Haxe externs for Johnny-Five v1.0
 * Project: https://github.com/rwaldron/johnny-five
 * Definitions by: Matthijs Kamstra aka [mck] <https://github.com/MatthijsKamstra>
 * Definitions: <https://github.com/DefinitelyTyped/DefinitelyTyped/blob/master/types/johnny-five>
 *    			<https://github.com/MatthijsKamstra/hxexterns>
 */
extern class Fn {
	static function constrain(value:Float, lower:Float, upper:Float):Float;
	static function inRange(value:Float, lower:Float, upper:Float):Bool;
	static function map(value:Float, fromLow:Float, fromHigh:Float, toLow:Float, toHigh:Float):Float;
	static function fmap(value:Float, fromLow:Float, fromHigh:Float, toLow:Float, toHigh:Float):Float;
	static function range(lower:Float, upper:Float, tick:Float):Array<Float>;
	static function scale(value:Float, fromLow:Float, fromHigh:Float, toLow:Float, toHigh:Float):Float;
	static function fscale(value:Float, fromLow:Float, fromHigh:Float, toLow:Float, toHigh:Float):Float;
	static function sum(values:Array<Float>):Float;
	static function toFixed(number:Float, digits:Float):Float;
	static function uid():String;
	static function bitSize(n:Float):Float;
	static function bitValue(bit:Float):Float;
	static function int16(msb:Float, lsb:Float):Float;
	static function uint16(msb:Float, lsb:Float):Float;
	static function int24(b16:Float, b8:Float, b0:Float):Float;
	static function uint24(b16:Float, b8:Float, b0:Float):Float;
	static function int32(b24:Float, b16:Float, b8:Float, b0:Float):Float;
	static function uint32(b24:Float, b16:Float, b8:Float, b0:Float):Float;
}

