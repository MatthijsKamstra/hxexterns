package js.npm.johnnyfive;
/**
 * Haxe externs for Johnny-Five v1.0
 * Project: https://github.com/rwaldron/johnny-five
 * Definitions by: Matthijs Kamstra aka [mck] <https://github.com/MatthijsKamstra>
 * Definitions: <https://github.com/DefinitelyTyped/DefinitelyTyped/blob/master/types/johnny-five>
 *    			<https://github.com/MatthijsKamstra/hxexterns>
 */
typedef AltimeterOption = {
	var controller : String;
	@:optional
	var address : Float;
	@:optional
	var freq : Float;
	@:optional
	var elevation : Float;
};
extern class Altimeter {
	function new(option:AltimeterOption):Void;
	var id : String;
	var readonly : Dynamic;
	var feet : Float;
	var meters : Float;
	@:overload(function(event:String, cb:Void -> Void):This { })
	@:overload(function(event:String, cb:Dynamic -> Void):This { })
	function on(event:String, cb:Void -> Void):This;
}