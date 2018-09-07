extern class Array {
	function new(option:ArrayOption):Void;
	function enable():Void;
	function disable():Void;
	function calibrate():Void;
	function calibrateUntil(predicate:Void -> Void):Void;
	function loadCalibration(option:LoadCalibrationOption):Void;
	@:overload(function(event:String, cb:Dynamic -> Void):This { })
	@:overload(function(event:String, cb:Dynamic -> Void):This { })
	@:overload(function(event:String, cb:Dynamic -> Void):This { })
	function on(event:String, cb:Void -> Void):This;
}
