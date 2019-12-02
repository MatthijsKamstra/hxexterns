package js.test.tone.instrument;

@:native("Tone.Synth")
// extern class Synth extends Monophonic<SynthOptions> {
extern class Synth extends Monophonic<Dynamic> {
	public var detune:Array<Dynamic>;
	public var envelope:Dynamic;
	public var frequency:Array<Dynamic>;
	public var oscillator:Dynamic;
	// public var detune:Array<OmniOscillator>;
	// public var envelope:AmplitudeEnvelope;
	// public var frequency:Array<OmniOscillator>;
	// public var oscillator:OmniOscillator;
}
