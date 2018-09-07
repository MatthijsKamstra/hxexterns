package js.npm.johnnyfive;

typedef PinState = {
	var supportedModes : Array<Float>;
	var mode : Float;
	var value : Float;
	var report : Float;
	var analogChannel : Float;
};

typedef PinOption = {
	@:optional
	var id : haxe.extern.EitherType<Float, String>;
	var pin : haxe.extern.EitherType<Float, String>;
	@:optional
	var type : String;
};
/**
 * Haxe externs for Johnny-Five v1.0
 * Project: https://github.com/rwaldron/johnny-five
 * Definitions by: Matthijs Kamstra aka [mck] <https://github.com/MatthijsKamstra>
 * Definitions: <https://github.com/DefinitelyTyped/DefinitelyTyped/blob/master/types/johnny-five>
 *    			<https://github.com/MatthijsKamstra/hxexterns>
 */
extern class Pin {
	function new(option:haxe.extern.EitherType<Float, haxe.extern.EitherType<String, PinOption>>):Void;
	var id : haxe.extern.EitherType<Float, String>;
	var pin : haxe.extern.EitherType<Float, String>;
	var type : haxe.extern.EitherType<String, String>;
	var value : Float;
	var mode : Float;
	@:overload(function(value:Float):Void { })
	static function write(pin:Float, value:Float):Void;
	@:overload(function(cb:Error -> Float -> Void):Void { })
	static function read(pin:Float, cb:Error -> Float -> Void):Void;
	function query(cb:PinState -> Void):Void;
	function high():Void;
	function low():Void;
	@:overload(function(event:String, cb:Void -> Void):Pin { })
	@:overload(function(event:String, cb:Void -> Void):Pin { })
	@:overload(function(event:String, cb:Dynamic -> Void):Pin { })
	function on(event:String, cb:Void -> Void):Pin;
}