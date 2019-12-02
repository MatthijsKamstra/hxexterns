package js.test.tone.instrument;

import js.test.tone.core.AudioNode;
import js.test.tone.component.Volume;

@:native("Tone.Instrument")
extern class Instrument<O> extends AudioNode {
	public function new(?opts:O):Void;
	public var volume:Array<Volume>;
	public function sync():Instrument<O>;
	public function triggerAttackRelease(note:Dynamic, duration:Encoding.Time, ?time:Encoding.Time, ?velocity:Float):Instrument<O>;
	public function unsync():Instrument<O>;
}
