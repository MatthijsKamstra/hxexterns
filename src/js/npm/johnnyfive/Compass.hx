package js.npm.johnnyfive;
/**
 * Haxe externs for Johnny-Five v1.0
 * Project: https://github.com/rwaldron/johnny-five
 * Definitions by: Matthijs Kamstra aka [mck] <https://github.com/MatthijsKamstra>
 * Definitions: <https://github.com/DefinitelyTyped/DefinitelyTyped/blob/master/types/johnny-five>
 *    			<https://github.com/MatthijsKamstra/hxexterns>
 */

typedef CompassOption = {
	var controller : String;
	@:optional
	var gauss : Float;
};
extern class Compass {
	function new(option:CompassOption):Void;
	var readonly : Dynamic;
	var heading : Float;
	var bearing : { var name : String; var abbr : String; var low : Float; var high : Float; var heading : Float; };
	@:overload(function(event:String, cb:Void -> Void):This { })
	@:overload(function(event:String, cb:Dynamic -> Void):This { })
	function on(event:String, cb:Void -> Void):This;
}