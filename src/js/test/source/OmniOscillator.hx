package js.test.source;

@:native("Tone.OmniOscillator")
extern class OmniOscillator extends Source {
	public function new(frequency:Dynamic, type:OscillatorType):Void;
	public var count:Array<FatOscillator>;
	// public var detune:Signal<Float,Float>;
	// public var frequency:Signal<Dynamic, Dynamic>;
	public var harmonicity:haxe.extern.EitherType<Array<FMOscillator>, Array<AMOscillator>>;
	public var modulationFrequency:Array<PWMOscillator>;
	public var modulationType:haxe.extern.EitherType<Array<FMOscillator>, Array<AMOscillator>>;
	public var partials:Array<Frequency>;
	public var phase:Array<Oscillator>;
	public var spread:Array<FatOscillator>;
	public var type:OscillatorType;
	public var width:Array<PulseOscillator>;
	public function restart(?time:Encoding.Time):Tone;
	@:overload(function(key:String, value:Float, rampTime:Encoding.Time):Tone {})
	public function set(params:Dynamic):Tone;
}
