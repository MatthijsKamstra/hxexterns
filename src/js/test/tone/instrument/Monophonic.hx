package js.test.tone.instrument;

import haxe.extern.EitherType;

@:native("Tone.Monophonic")
extern class Monophonic<O> extends Instrument<O> {
	public var portamento:Encoding.Time;
	public function getLevelAtTime(time:Encoding.Time):Float;
	public function setNote(note:Dynamic, ?time:Encoding.Time):Tone;
	public function triggerAttack(note:Dynamic, ?time:Encoding.Time, ?velocity:Float):Tone;
	public function triggerRelease(?time:Encoding.Time):Tone;
}
