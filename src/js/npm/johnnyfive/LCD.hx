package js.npm.johnnyfive;
/**
 * Haxe externs for Johnny-Five v1.0
 * Project: https://github.com/rwaldron/johnny-five
 * Definitions by: Matthijs Kamstra aka [mck] <https://github.com/MatthijsKamstra>
 * Definitions: <https://github.com/DefinitelyTyped/DefinitelyTyped/blob/master/types/johnny-five>
 *    			<https://github.com/MatthijsKamstra/hxexterns>
 */

typedef LCDGeneralOption = {
	@:optional
	var rows : Float;
	@:optional
	var cols : Float;
};
typedef LCDI2COption = {
	>LCDGeneralOption,
	var controller : String;
	@:optional
	var backlight : Float;
};
typedef LCDParallelOption = {
	>LCDGeneralOption,
	var pins : Array<Dynamic>;
	@:optional
	var backlight : Float;
};
extern class LCD {
	function new(option:haxe.extern.EitherType<LCDGeneralOption, haxe.extern.EitherType<LCDI2COption, LCDParallelOption>>):Void;
	var id : String;
	var rows : Float;
	var cols : Float;
	function print(message:String):Void;
	function useChar(char:String):Void;
	function clear():Void;
	function cursor(row:Float, col:Float):Void;
	function home():Void;
	function on():Void;
	function off():Void;
	function display():Void;
	function noDisplay():Void;
	function blink():Void;
	function noBlink():Void;
	function autoscroll():Void;
	function noAutoscroll():Void;
	function bgColor(color:Dynamic):Void;
}