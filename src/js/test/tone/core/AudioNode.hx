package js.test.tone.core;

import js.test.tone.instrument.Instrument;

@:native("Tone.AudioNode")
extern class AudioNode extends Tone {
	public var channelCount:Float;
	public var channelCountMode:String;
	public var channelInterpretation:String;
	public var numberOfInputs:Float;
	public var numberOfOutputs:Float;
	public function chain(nodes:haxe.extern.Rest<ProcessingNode>):AudioNode;
	public function fan(nodes:haxe.extern.Rest<ProcessingNode>):AudioNode;
	public function connect(unit:ProcessingNode, ?outputNum:Float, ?inputNum:Float):AudioNode;
	public function disconnect(output:haxe.extern.EitherType<Float, ProcessingNode>):AudioNode;
	public function dispose():AudioNode;
	public function toMaster():Instrument<Dynamic>;
}

typedef ProcessingNode = haxe.extern.EitherType<Tone, AudioNode>;

// enum abstract ProcessingNode(Class<Dynamic>) {
// 	var Tone;
// 	var AudioNode;
// 	var AudioParam;
// }
