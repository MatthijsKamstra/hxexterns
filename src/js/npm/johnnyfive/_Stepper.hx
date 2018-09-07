extern class TYPE {
	static var DRIVER : Float;
	static var TWO_WIRE : Float;
	static var FOUR_WIRE : Float;
}
extern class Stepper {
	function new(option:haxe.extern.EitherType<Float, haxe.extern.EitherType<String, StepperOption>>):Void;
	function step(stepsOrOpts:Dynamic, cb:Void -> Void):Void;
	@:overload(function(value:Float):Stepper { })
	function rpm():Stepper;
	@:overload(function(value:Float):Stepper { })
	function speed():Stepper;
	@:overload(function(value:Float):Stepper { })
	function direction():Stepper;
	@:overload(function(value:Float):Stepper { })
	function accel():Stepper;
	@:overload(function(value:Float):Stepper { })
	function decel():Stepper;
	function cw():Stepper;
	function ccw():Stepper;
	@:overload(function(range:Array<Float>, unit:String, cb:Void -> Void):Void { })
	function within(range:Array<Float>, cb:Void -> Void):Void;
	@:overload(function(event:String, cb:Void -> Void):This { })
	@:overload(function(event:String, cb:Dynamic -> Void):This { })
	function on(event:String, cb:Void -> Void):This;
}
typedef SwitchOption = {
	var pin : haxe.extern.EitherType<Float, String>;
	@:optional
	var type : haxe.extern.EitherType<String, String>;
};
extern class Switch {
	function new(option:haxe.extern.EitherType<Float, haxe.extern.EitherType<String, SwitchOption>>):Void;
	var id : String;
	var pin : haxe.extern.EitherType<Float, String>;
	var readonly : Dynamic;
	var isClosed : Bool;
	var isOpen : Bool;
	@:overload(function(event:String, cb:Void -> Void):This { })
	function on(event:String, cb:Void -> Void):This;
}
typedef ThermometerOption = {
	@:optional
	var controller : String;
	var pin : haxe.extern.EitherType<String, Float>;
	@:optional
	var toCelsius : Float -> Float;
	@:optional
	var freq : Float;
};
extern class Thermometer {
	function new(option:ThermometerOption):Void;
	var id : String;
	var pin : haxe.extern.EitherType<Float, String>;
	var readonly : Dynamic;
	var celsius : Float;
	var fahrenheit : Float;
	var kelvin : Float;
	var C : Float;
	var F : Float;
	var K : Float;
	@:overload(function(event:String, cb:Dynamic -> Void):This { })
	@:overload(function(event:String, cb:Void -> Void):This { })
	function on(event:String, cb:Void -> Void):This;
}
