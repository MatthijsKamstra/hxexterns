package js.npm.johnnyfive;


typedef DigitsOption = {
	var pins : Dynamic;
	@:optional
	var devices : Float;
	@:optional
	var controller : String;
};
extern class Digits {
	function new(option:DigitsOption):Void;
	var readonly : Dynamic;
	var isMatrix : Bool;
	var devices : Float;
	var digitOrder : Float;
	@:overload(function(index:Float):Void { })
	function on():Void;
	@:overload(function(index:Float):Void { })
	function off():Void;
	@:overload(function(index:Float):Void { })
	function clear():Void;
	@:overload(function(index:Float, value:Float):Void { })
	function brightness(value:Float):Void;
	@:overload(function(index:Float, position:Float, character:Float):Void { })
	function draw(position:Float, character:Float):Void;
}
typedef MatrixOption = {
	var pins : Dynamic;
	@:optional
	var devices : Float;
};
typedef MatrixIC2Option = {
	var controller : String;
	@:optional
	var addresses : Array<Dynamic>;
	@:optional
	var isBicolor : Bool;
	@:optional
	var dims : Dynamic;
	@:optional
	var rotation : Float;
};
extern class Matrix {
	function new(option:haxe.extern.EitherType<MatrixOption, MatrixIC2Option>):Void;
	var readonly : Dynamic;
	var isMatrix : Bool;
	var devices : Float;
	@:overload(function(index:Float):Void { })
	function on():Void;
	@:overload(function(index:Float):Void { })
	function off():Void;
	@:overload(function(index:Float):Void { })
	function clear():Void;
	@:overload(function(index:Float, value:Float):Void { })
	function brightness(value:Float):Void;
	@:overload(function(index:Float, row:Float, col:Float, state:Dynamic):Void { })
	function led(row:Float, col:Float, state:Dynamic):Void;
	@:overload(function(index:Float, row:Float, val:Float):Void { })
	function row(row:Float, val:Float):Void;
	@:overload(function(index:Float, row:Float, val:Float):Void { })
	function column(row:Float, val:Float):Void;
	@:overload(function(index:Float, position:Float, character:Float):Void { })
	function draw(position:Float, character:Float):Void;
}
typedef RGBOption = {
	var pins : Array<Float>;
	@:optional
	var isAnode : Bool;
	@:optional
	var controller : String;
};
extern class RGB {
	function new(option:RGBOption):Void;
	var red : Led;
	var green : Led;
	var blue : Led;
	var readonly : Dynamic;
	var isAnode : Bool;
	function on():Void;
	function off():Void;
	function color(value:String):Void;
	function toggle():Void;
	function strobe(ms:Float):Void;
	function intensity(value:Float):Void;
	function fadeIn(ms:Float):Void;
	function fadeOut(ms:Float):Void;
	function pulse(ms:Float):Void;
	function stop(ms:Float):Void;
}
typedef MotionOption = {
	var pin : haxe.extern.EitherType<Float, String>;
};
extern class Motion {
	function new(option:haxe.extern.EitherType<Float, MotionOption>):Void;
	@:overload(function(event:String, cb:Dynamic -> Void):This { })
	@:overload(function(event:String, cb:Void -> Void):This { })
	@:overload(function(event:String, cb:Void -> Void):This { })
	@:overload(function(event:String, cb:Void -> Void):This { })
	function on(event:String, cb:Void -> Void):This;
}
typedef MotorOption = {
	var pins : Dynamic;
	@:optional
	var current : Dynamic;
	@:optional
	var invertPWM : Bool;
	@:optional
	var address : Float;
	@:optional
	var controller : String;
	@:optional
	var register : Dynamic;
	@:optional
	var bits : Dynamic;
};
extern class Motor {
	function new(option:haxe.extern.EitherType<Array<Float>, MotorOption>):Void;
	var readonly : Dynamic;
	var isOn : Bool;
	function forward(speed:Float):Void;
	function fwd(speed:Float):Void;
	function reverse(speed:Float):Void;
	function rev(speed:Float):Void;
	@:overload(function(speed:Float):Void { })
	function start():Void;
	function stop():Void;
	function brake():Void;
	function release():Void;
}
typedef OrientiationOption = {
	@:optional
	var controller : String;
	@:optional
	var freq : Float;
};
extern class Orientiation {
	function new(option:OrientiationOption):Void;
	var readonly : Dynamic;
	var euler : Dynamic;
	var quarternion : Dynamic;
	@:overload(function(event:String, cb:Void -> Void):This { })
	@:overload(function(event:String, cb:Dynamic -> Void):This { })
	@:overload(function(event:String, cb:Void -> Void):This { })
	function on(event:String, cb:Void -> Void):This;
}
typedef PiezoOption = {
	var pin : Float;
};
extern class Piezo {
	function new(option:haxe.extern.EitherType<Float, PiezoOption>):Void;
	var id : String;
	var pin : Float;
	var readonly : Dynamic;
	var mode : Float;
	var isPlaying : Bool;
	function frequency(frequency:Float, duration:Float):Void;
	function play(tune:Dynamic, ?cb:Void -> Void):Void;
	function tone(frequency:Float, duration:Float):Void;
	function noTone():Void;
	function off():Void;
}


typedef PingOption = {
	var pin : haxe.extern.EitherType<Float, String>;
	@:optional
	var freq : Float;
	@:optional
	var pulse : Float;
};
extern class Ping {
	function new(option:haxe.extern.EitherType<Float, PingOption>):Void;
}
typedef ProximityOption = {
	var pin : haxe.extern.EitherType<Float, String>;
	var controller : String;
};
typedef ProximityData = {
	var cm : Float;
	var in : Float;
};
extern class Proximity {
	function new(option:haxe.extern.EitherType<Float, ProximityOption>):Void;
	@:overload(function(event:String, cb:ProximityData -> Void):This { })
	@:overload(function(event:String, cb:Void -> Void):This { })
	function on(event:String, cb:Void -> Void):This;
}
typedef RelayOption = {
	var pin : haxe.extern.EitherType<Float, String>;
	@:optional
	var type : String;
};
extern class Relay {
	function new(option:haxe.extern.EitherType<Float, RelayOption>):Void;
	var id : String;
	var pin : haxe.extern.EitherType<Float, String>;
	var readonly : Dynamic;
	var isOn : Bool;
	var type : String;
	function open():Void;
	function close():Void;
	function toggle():Void;
}


typedef SensorOption = {
	var pin : haxe.extern.EitherType<Float, String>;
	@:optional
	var freq : Bool;
	@:optional
	var threshold : Float;
};
extern class Sensor {
	function new(option:haxe.extern.EitherType<Float, haxe.extern.EitherType<String, SensorOption>>):Void;
	var id : String;
	var pin : haxe.extern.EitherType<Float, String>;
	var threshold : Float;
	var readonly : Dynamic;
	var boolean : Bool;
	var raw : Float;
	var analog : Float;
	var constrained : Float;
	var value : Float;
	@:overload(function(range:Array<Float>):Float { })
	function scaleTo(low:Float, high:Float):Float;
	@:overload(function(range:Array<Float>):Float { })
	function fscaleTo(low:Float, high:Float):Float;
	function booleanAt(barrier:Float):Bool;
	function within(range:Array<Float>, cb:Void -> Void):Void;
	@:overload(function(event:String, cb:Void -> Void):This { })
	@:overload(function(event:String, cb:Dynamic -> Void):This { })
	function on(event:String, cb:Void -> Void):This;
}
typedef ServoGeneralOption = {
	var pin : haxe.extern.EitherType<Float, String>;
	@:optional
	var range : Array<Float>;
	@:optional
	var type : String;
	@:optional
	var startAt : Float;
	@:optional
	var isInverted : Bool;
	@:optional
	var center : Bool;
	@:optional
	var controller : String;
};
typedef ServoPCA9685Option = {
	>ServoGeneralOption,
	@:optional
	var address : Float;
};
typedef ServoSweepOpts = {
	var range : Array<Float>;
	@:optional
	var interval : Float;
	@:optional
	var step : Float;
};
extern class Servo {
	function new(option:haxe.extern.EitherType<Float, haxe.extern.EitherType<String, ServoGeneralOption>>):Void;
	var id : String;
	var pin : haxe.extern.EitherType<Float, String>;
	var range : Array<Float>;
	var invert : Bool;
	var history : Array<Dynamic>;
	var interval : Float;
	var isMoving : Bool;
	var readonly : Dynamic;
	var last : Dynamic;
	var position : Float;
	var value : Float;
	var startAt : Float;
	function to(degrees:Float, ?ms:Float, ?rage:Float):Void;
	function min():Void;
	function max():Void;
	function center():Void;
	function home():Void;
	@:overload(function(range:Array<Float>):Void { })
	@:overload(function(opt:ServoSweepOpts):Void { })
	function sweep():Void;
	function stop():Void;
	function cw(speed:Float):Void;
	function ccw(speed:Float):Void;
	@:overload(function(event:String, cb:Void -> Void):This { })
	function on(event:String, cb:Void -> Void):This;
}
typedef ShiftRegisterOption = {
	var pins : Dynamic;
	@:optional
	var isAnode : Bool;
};
extern class ShiftRegister {
	function new(option:ShiftRegisterOption):Void;
	var id : String;
	var pins : Dynamic;
	var readonly : Dynamic;
	var value : Dynamic;
	var isAnode : Bool;
	function clear():Void;
	function display(number:haxe.extern.EitherType<Float, String>):Void;
	function reset():Void;
	function send(value:haxe.extern.Rest<Float>):Void;
}
typedef SonarOption = {
	var pin : haxe.extern.EitherType<Float, String>;
	var device : String;
	@:optional
	var freq : Float;
	@:optional
	var threshold : Float;
};
extern class Sonar {
	function new(option:haxe.extern.EitherType<Float, haxe.extern.EitherType<String, SonarOption>>):Void;
	@:overload(function(range:Array<Float>, unit:String, cb:Void -> Void):Void { })
	function within(range:Array<Float>, cb:Void -> Void):Void;
	@:overload(function(event:String, cb:Void -> Void):This { })
	@:overload(function(event:String, cb:Dynamic -> Void):This { })
	function on(event:String, cb:Void -> Void):This;
}
typedef StepperOption = {
	var pins : Dynamic;
	var stepsPerRev : Float;
	var type : Float;
	@:optional
	var rpm : Float;
	@:optional
	var direction : Float;
};
