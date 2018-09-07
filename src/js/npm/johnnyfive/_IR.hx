typedef ArrayOption = {
	var pins : haxe.extern.EitherType<Array<Float>, Array<String>>;
	var emitter : haxe.extern.EitherType<Float, String>;
	@:optional
	var freq : Float;
};
typedef LoadCalibrationOption = {
	var min : Array<Float>;
	var max : Array<Float>;
};
