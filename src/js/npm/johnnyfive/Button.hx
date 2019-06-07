package js.npm.johnnyfive;

// http://johnny-five.io/api/button/#parameters
typedef ButtonOption = {
	var pin : haxe.extern.EitherType<Int, String>;
	@:optional
	var invert : Bool;
	@:optional
	var isPullup : Bool;
	@:optional
	var isPulldown : Bool;
	@:optional
	var holdtime : Int;
};

@:enum abstract ButtonEvents(String) {
	var HOLD = 'hold';
	var DOWN = 'down';
	var PRESS = 'press';
	var UP = 'up';
	var RELEASE = 'release';
}


/**
 * Haxe externs for Johnny-Five v1.0
 * Project: https://github.com/rwaldron/johnny-five
 * Definitions by: Matthijs Kamstra aka [mck] <https://github.com/MatthijsKamstra>
 * Definitions: <https://github.com/DefinitelyTyped/DefinitelyTyped/blob/master/types/johnny-five>
 *    			<https://github.com/MatthijsKamstra/hxexterns>
 */
@:jsRequire('johnny-five','Button')
@:native('Button')
extern class Button {

	function new(pin:haxe.extern.EitherType<Int, haxe.extern.EitherType<String, ButtonOption>>):Void;

	var id : String;
	var pin : haxe.extern.EitherType<Int, String>;
	var downValue : Int;
	var upValue : Int;
	var holdtime : Int;

	@:overload(function(event:String, cb:Int -> Void):Button { })
	@:overload(function(event:ButtonEvents, cb:Int -> Void):Button { })
	@:overload(function(event:ButtonEvents, cb:Void -> Void):Button { })
	function on(event:String, cb:Void -> Void):Button;
}