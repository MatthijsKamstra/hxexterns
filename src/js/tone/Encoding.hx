package js.tone;

import haxe.io.Float32Array;
import haxe.iterators.DynamicAccessIterator;
import js.lib.Promise;
import js.html.audio.AudioParam;
import js.html.audio.*;
import js.html.*;

@:native("Encoding.Master") interface Master {
	public var mute:Bool;
	public var volume:Array<Volume>;
	// public function chain(nodes:haxe.extern.Rest<ProcessingNode>):Tone;
}

@:native("Encoding.PrimitiveTypeConstructor") interface PrimitiveTypeConstructor<E, T> {
	// public function new(value:E, ?units:Float):T;
}

typedef ProcessingNode = {}
typedef WaveShaperMappingFn = {}
typedef OversamplingType = {}
typedef Callback = {}
typedef Frequency2 = {}
typedef BasicOscillatorType = {}
typedef NoiseType = {}
typedef ControlPattern = {}
typedef SequenceCallback = {}
typedef ModulationOptions = {}
typedef DistanceModel = {}
typedef PanningModel = {}
typedef EnvelopeCurve = {}
typedef FilterType = {}
typedef FilterRolloff = {}
typedef AnalysisType = {}
typedef BufferArray = {}

@:enum abstract TypeUnits(Int) {
	var Default = 0;
	var number = 1;
	var Time = 2;
	var time = 3;
	var Frequency = 4;
	var frequency = 5;
	var TransportTime = 6;
	var transportTime = 7;
	var Ticks = 8;
	var ticks = 9;
	var NormalRange = 10;
	var normalRange = 11;
	var AudioRange = 12;
	var audioRange = 13;
	var Decibels = 14;
	var db = 15;
	var Interval = 16;
	var interval = 17;
	var BPM = 18;
	var bpm = 19;
	var Positive = 20;
	var positive = 21;
	var Gain = 22;
	var gain = 23;
	var Cents = 24;
	var cents = 25;
	var Degrees = 26;
	var degrees = 27;
	var MIDI = 28;
	var midi = 29;
	var BarsBeatsSixteenths = 30;
	var barsBeatsSixteenths = 31;
	var Samples = 32;
	var samples = 33;
	var Hertz = 34;
	var hertz = 35;
	var Note = 36;
	var note = 37;
	var Milliseconds = 38;
	var milliseconds = 39;
	var Seconds = 40;
	var seconds = 41;
	var Notation = 42;
	var notation = 43;
}

@:native("Dynamic") interface Frequency extends TimeBase {
	public function harmonize(intervals:Array<Float>):Array<Dynamic>;
	public function toMidi():String;
	public function toNote():String;
	public function toTicks():Encoding.Ticks;
	public function transpose(interval:Float):Frequency;
}

@:native("DynamicConstructor") interface FrequencyConstructor extends PrimitiveTypeConstructor<Dynamic, Frequency> {
	public function ftom(frequency:Dynamic):String;
	public function mtof(midi:String):Dynamic;
}

@:native("String") interface Midi extends Frequency {
	public function toFrequency():Float;
}

@:native("StringConstructor") interface MidiConstructor extends PrimitiveTypeConstructor<String, Midi> {
	public function ftom(frequency:Dynamic):String;
	public function mtof(midi:String):Dynamic;
}

@:native("Encoding.Ticks") interface Ticks extends TransportTime {}
@:native("Encoding.TicksConstructor") interface TicksConstructor extends PrimitiveTypeConstructor<Encoding.Ticks, Ticks> {}

@:native("Encoding.TimeBase") interface TimeBase {
	public function toFrequency():Float;
	public function toMilliseconds():Float;
	public function toSamples():Float;
	public function toSeconds():Float;
	public function valueOf():Float;
}

@:native("Encoding.TimeBaseConstructor") interface TimeBaseConstructor extends PrimitiveTypeConstructor<Encoding.Time, TimeBase> {}

@:native("Encoding.Time") interface Time extends TimeBase {
	public function quantize(val:haxe.extern.EitherType<Float, Encoding.Time>, ?percent:Float):Float;
	public function toBarsBeatsSixteenths():Float32Array;
	public function toMidi():String;
	public function toNotation():String;
	public function toTicks():Encoding.Ticks;
}

@:native("Encoding.TimeConstructor") interface TimeConstructor extends PrimitiveTypeConstructor<Encoding.Time, Time> {}
@:native("Encoding.TransportTime") interface TransportTime extends Time {}
@:native("Encoding.TransportTimeConstructor") interface TransportTimeConstructor extends PrimitiveTypeConstructor<Encoding.TransportTime, TransportTime> {}

@:native("Encoding.AudioNode") extern class AudioNode extends Tone {
	public var channelCount:Float;
	public var channelCountMode:String;
	public var channelInterpretation:String;
	public var numberOfInputs:Float;
	public var numberOfOutputs:Float;
	public function chain(nodes:haxe.extern.Rest<ProcessingNode>):Tone;
	public function fan(nodes:haxe.extern.Rest<ProcessingNode>):Tone;
	public function connect(unit:ProcessingNode, ?outputNum:Float, ?inputNum:Float):Tone;
	public function disconnect(output:haxe.extern.EitherType<Float, ProcessingNode>):Tone;
	public function dispose():Tone;
	public function toMaster():Tone;
}

@:native("Encoding.Buffer") extern class Buffer extends Tone {
	public function new(url:haxe.extern.EitherType<AudioBuffer, String>, ?onload:js.lib.Function, ?onerror:js.lib.Function):Void;
	static public function cancelDownload():Buffer;
	@:overload(function(array:BufferArray):Tone {})
	static public function fromArray(array:BufferArray):Buffer;
	static public function fromUrl(url:String):Promise<Buffer>;
	@:overload(function(url:String):Promise<Tone> {})
	static public function load(url:String, onload:js.lib.Function, onerror:js.lib.Function, onprogress:js.lib.Function):XMLHttpRequest;
	static public function supportsType(url:String):Bool;
	public var duration:Float;
	public var length:Float;
	public var numberOfChannels:Float;
	public var reverse:Bool;
	public function dispose():Tone;
	public function get():AudioBuffer;
	public function getChannelData(channel:Float):Float32Array;
	public function set(buffer:haxe.extern.EitherType<AudioBuffer, Buffer>):Tone;
	public function slice(start:Encoding.Time, ?end:Encoding.Time):Tone;
	public function toArray(?channel:Float):BufferArray;
	public function toMono(?channel:Float):BufferArray;
}

@:native("Encoding.Buffers") extern class Buffers extends Tone {
	public function new(urls:haxe.extern.EitherType<Dynamic, Array<String>>, ?callback:js.lib.Function):Void;
	public var baseUrl:String;
	public function add(name:String, url:haxe.extern.EitherType<String, haxe.extern.EitherType<Buffer, AudioBuffer>>, ?callback:js.lib.Function):Tone;
	public function dispose():Tone;
	public function get(name:haxe.extern.EitherType<String, Float>):Buffer;
	public function has(name:haxe.extern.EitherType<String, Float>):Bool;
}

@:native("Encoding.Context") extern class Context extends Emitter {
	public function new(?context:AudioContext):Void;
	public var clockSource:haxe.extern.EitherType<String, Float>;
	public var latencyHint:haxe.extern.EitherType<String, Float>;
	public var lookAhead:Float;
	public var updateInterval:Float;
	public function clearTimeout(id:Float):Tone;
	public function close():Promise<Dynamic>;
	public function createAnalyser():AnalyserNode;
	public function createBiquadFilter():BiquadFilterNode;
	public function createConstantSource():ConstantSourceNode;
	public function createPanner():PannerNode;
	public function createStereoPanner():StereoPannerNode;
	public function getConstant(val:Float):AudioBufferSourceNode;
	public function ready():Promise<Dynamic>;
	public function setTimeout(fn:js.lib.Function, timeout:Float):Float;
}

@:native("Encoding.OfflineContext") extern class OfflineContext extends Context {
	public function new(channels:Float, duration:Float, sampleRate:Float):Void;
	public function createBufferSource():BufferSource;
	public function render():Promise<AudioBuffer>;
}

@:native("Encoding.Delay") extern class Delay extends Tone {
	public function new(?delayTime:Encoding.Time, ?maxDelay:Encoding.Time):Void;
	public var delayTime:Param<Float, Float>;
	public var maxDelay:Encoding.Time;
	public function dispose():Tone;
}

@:native("Encoding.Clock") extern class Clock extends Emitter {
	public function new(callback:js.lib.Function, frequency:Dynamic):Void;
	public var callback:js.lib.Function;
	public var frequency:TickSignal<Float, Dynamic>;
	public var state:State;
	public function getSecondsAtTime(time:Encoding.Time):Float;
	public function getStateAtTime(time:Encoding.Time):State;
	public function getTicksAtTime(time:Encoding.Time):Encoding.Ticks;
	public function nextTickTime(ticks:Encoding.Ticks, before:Encoding.Time):Tone;
	public function pause(?time:Encoding.Time):Tone;
	public function setTicksAtTime(ticks:Encoding.Ticks, time:Encoding.Time):Tone;
	public function start(?time:Encoding.Time, ?offset:Encoding.Ticks):Tone;
	public function stop(?time:Encoding.Time):Tone;
}

@:native("Encoding.Emitter") extern class Emitter extends Tone {
	static public function mixin(object:Dynamic):Emitter;
	public function dispose():Tone;
	public function emit(event:String, args:haxe.extern.Rest<Dynamic>):Tone;
	public function off(event:String, callback:js.lib.Function):Tone;
	public function on(event:String, callback:js.lib.Function):Tone;
	public function once(event:String, callback:js.lib.Function):Tone;
}

@:native("Encoding.GainOptions") interface GainOptions {
	public var gain:Encoding.Gain;
	public var convert:Bool;
}

@:native("Encoding.Gain") extern class Gain extends Tone {
	public function new(?gain:Encoding.Gain, ?units:Float):Void;
	public var gain:Param<String, Dynamic>;
}

@:native("Encoding.Transport") interface Transport {
	public var PPQ:Float;
	public var bpm:Array<Clock>;
	public var loop:Bool;
	public var loopEnd:Encoding.Time;
	public var loopStart:Encoding.Time;
	public var position:Float32Array;
	public var progress:Float;
	public var seconds:Float;
	public var state:State;
	public var swing:Float;
	public var swingSubdivision:Encoding.Time;
	public var ticks:Encoding.Ticks;
	public var timeSignature:haxe.extern.EitherType<Float, Array<Dynamic>>;
	public function cancel(after:Encoding.TransportTime):Tone;
	public function clear(eventId:Float):Tone;
	public function getSecondsAtTime(time:Encoding.Time):Float;
	public function getTicksAtTime(time:Encoding.Time):Encoding.Ticks;
	public function nextSubdivision(subdivision:Encoding.Time):Float;
	public function pause(?time:Encoding.Time):Tone;
	public function schedule(callback:js.lib.Function, time:Encoding.TransportTime):Float;
	public function scheduleOnce(callback:js.lib.Function, time:Encoding.TransportTime):Float;
	public function scheduleRepeat(callback:js.lib.Function, interval:Encoding.Time, ?startTime:Encoding.TransportTime, ?duration:Encoding.Time):Float;
	public function setLoopPoints(startPosition:Encoding.TransportTime, endPosition:Encoding.TransportTime):Tone;
	public function start(?time:Encoding.Time, ?offset:Encoding.TransportTime):Tone;
	public function stop(?time:Encoding.Time):Tone;
	public function syncSignal(signal:Signal<Dynamic, Dynamic>, ratio:Float):Tone;
	public function toggle(time:Encoding.Time):Tone;
	public function unsyncSignal(signal:Signal<Dynamic, Dynamic>):Tone;
}

@:native("Encoding.TransportEvent") extern class TransportEvent extends Tone {
	public var Transport:Transport;
	public var callback:js.lib.Function;
	public var id:Float;
	public var time:Encoding.Ticks;
	public function dispose():Tone;
	public function invoke(time:Encoding.Time):Void;
}

@:native("Encoding.TransportRepeatEvent") extern class TransportRepeatEvent extends TransportEvent {}

@:native("Encoding.Listener") extern class Listener extends Tone {
	public function new():Void;
	public var forwardX:Float;
	public var forwardY:Float;
	public var forwardZ:Float;
	public var positionX:Float;
	public var positionY:Float;
	public var positionZ:Float;
	public var upX:Float;
	public var upY:Float;
	public var upZ:Float;
	public function dispose():Tone;
	public function setOrientation(x:Float, y:Float, z:Float, upX:Float, upY:Float, upZ:Float):Tone;
	public function setPosition(x:Float, y:Float, z:Float):Tone;
}

@:native("Encoding.EventObject") interface EventObject {
	public var time:Encoding.Time;
}

@:native("Encoding.Timeline") extern class Timeline extends Tone {
	public function new(memory:Float):Void;
	public var length:Float;
	public var memory:Float;
	public function add<T:(EventObject)>(event:T):Tone;
	public function cancel(time:Float):Tone;
	public function cancelBefore(time:Float):Tone;
	public function dispose():Tone;
	public function forEach(callback:js.lib.Function):Tone;
	public function forEachAtTime(time:Float, callback:js.lib.Function):Tone;
	public function forEachBefore(time:Float, callback:js.lib.Function):Tone;
	public function forEachBetween(startTime:Float, endTime:Float, callback:js.lib.Function):Tone;
	public function forEachFrom(time:Float, callback:js.lib.Function):Tone;
	public function get(time:Float, comparator:String):Void;
	public function getAfter(time:Float, comparator:String):Void;
	public function getBefore(time:Float, comparator:String):Void;
	public function peek<T:(EventObject)>():T;
	public function previousEvent<T:(EventObject)>(event:T):T;
	public function remove<T:(EventObject)>(event:T):Tone;
	public function shift<T:(EventObject)>():T;
}

@:native("Encoding.TimelineState") extern class TimelineState extends Timeline {
	public function new(initial:String):Void;
	public function getLastState<T:(EventObject)>(state:State, time:Encoding.Time):T;
	public function getNextState<T:(EventObject)>(state:State, time:Encoding.Time):T;
	public function getValueAtTime(time:Float):String;
	public function setStateAtTime(state:String, time:Float):Tone;
}

@:native("Encoding.Param") extern class Param<E, T> extends AudioNode {
	public function new(param:AudioParam, units:Dynamic, convert:Bool):Void;
	public var convert:Bool;
	public var units:Float;
	public var value:T;
	public var minValue:Float;
	public var maxValue:Float;
	public function cancelAndHoldAtTime(time:Encoding.Time):Tone;
	public function cancelScheduledValues(time:Encoding.Time):Tone;
	public function exponentialApproachValueAtTime(value:E, time:Encoding.Time, rampTime:Encoding.Time):Tone;
	public function exponentialRampTo(value:E, rampTime:Encoding.Time, ?startTime:Encoding.Time):Tone;
	public function exponentialRampToValueAtTime(value:E, endTime:Encoding.Time):Tone;
	public function getValueAtTime(time:Encoding.Time):T;
	public function linearRampTo(value:E, rampTime:Encoding.Time, ?startTime:Encoding.Time):Tone;
	public function linearRampToValueAtTime(value:E, endTime:Encoding.Time):Tone;
	public function rampTo(value:E, rampTime:Encoding.Time, ?startTime:Encoding.Time):Tone;
	public function setRampPoint(?now:Encoding.Time):Tone;
	public function setTargetAtTime(value:E, startTime:Encoding.Time, timeConstant:Encoding.Time):Tone;
	public function setValueAtTime(value:E, time:Encoding.Time):Tone;
	public function setValueCurveAtTime(values:Array<Dynamic>, startTime:Encoding.Time, duration:Encoding.Time, ?scaling:Float):Tone;
	public function targetRampTo(value:E, rampTime:Encoding.Time, ?startTime:Encoding.Time):Tone;
}

@:native("FloatTimeline") extern class IntervalTimeline extends Tone {
	public var length:Float;
	public function add<T:(EventObject)>(event:T):Tone;
	public function cancel(time:Float):Tone;
	public function dispose():Tone;
	public function forEach(callback:js.lib.Function):Tone;
	public function forEachAtTime(time:Float, callback:js.lib.Function):Tone;
	public function forEachFrom(time:Float, callback:js.lib.Function):Tone;
	public function get<T:(EventObject)>(event:T):T;
	public function remove<T:(EventObject)>(event:T):Tone;
}

@:native("Encoding.Draw") interface Draw {
	public var anticipation:Float;
	public var expiration:Float;
	public function cancel(?after:Encoding.Time):Tone;
	public function schedule(callback:js.lib.Function, time:Encoding.Time):Tone;
}

@:native("Encoding.Compressor") extern class Compressor extends AudioNode {
	public function new(?threshold:haxe.extern.EitherType<Float, Dynamic>, ?ratio:Float):Void;
	public var attack:Param<Float, Float>;
	public var knee:Param<Float, Float>;
	public var ratio:Param<Float, Float>;
	public var release:Param<Float, Float>;
	public var threshold:Param<Float, Float>;
}

@:native("Encoding.Gate") extern class Gate extends AudioNode {
	public function new(?threshold:haxe.extern.EitherType<Float, Dynamic>, ?attack:Encoding.Time, ?release:Encoding.Time):Void;
	public var attack:Array<Follower>;
	public var release:Array<Follower>;
	public var threshold:Array<GreaterThan<Float, Dynamic>>;
}

@:native("Encoding.FFT") extern class FFT extends AudioNode {
	public function new(?size:Float):Void;
	public var size:Array<Analyser>;
}

@:native("Encoding.Solo") extern class Solo extends AudioNode {
	public var input:Gain;
	public var muted:Bool;
	public var solo:Bool;
}

@:native("Encoding.Limiter") extern class Limiter extends AudioNode {
	public function new(threshold:Float):Void;
	public var threshold:Array<Compressor>;
}

@:native("Encoding.Mono") extern class Mono extends AudioNode {}

@:native("Encoding.Meter") extern class Meter extends AudioNode {
	public function new(smoother:Float):Void;
	public var smoothing:Float;
	public function getLevel():Float;
	public function getValue():Float;
}

@:native("Encoding.Panner") extern class Panner extends AudioNode {
	public function new(?initialPan:Float):Void;
	public var pan:Array<StereoPannerNode>;
}

@:native("Encoding.Envelope") extern class Envelope extends AudioNode {
	public function new(?attack:Encoding.Time, ?decay:Encoding.Time, ?sustain:Float, ?release:Encoding.Time):Void;
	public var attack:Encoding.Time;
	public var attackCurve:EnvelopeCurve;
	public var decay:Encoding.Time;
	public var decayCurve:EnvelopeCurve;
	public var release:Encoding.Time;
	public var releaseCurve:EnvelopeCurve;
	public var sustain:Float;
	public var value:Float;
	public function cancel(after:Encoding.Time):Tone;
	public function getValueAtTime(time:Float):Float;
	public function triggerAttack(?time:Encoding.Time, ?velocity:Float):Tone;
	public function triggerAttackRelease(duration:Encoding.Time, ?time:Encoding.Time, ?velocity:Float):Tone;
	public function triggerRelease(?time:Encoding.Time):Tone;
}

@:native("Encoding.CrossFade") extern class CrossFade extends AudioNode {
	public function new(?initialFade:Float):Void;
	public var a:Gain;
	public var b:Gain;
	public var fade:Signal<Float, Float>;
}

@:native("Encoding.Split") extern class Split extends AudioNode {
	public var left:Gain;
	public var right:Gain;
}

@:native("Encoding.LFO") extern class LFO extends AudioNode {
	public function new(?frequency:haxe.extern.EitherType<Dynamic, Dynamic>, ?min:Float, ?max:Float):Void;
	public var amplitude:Array<Oscillator>;
	public var frequency:Array<Oscillator>;
	public var max:Array<Scale>;
	public var min:Array<Scale>;
	public var mute:Bool;
	public var phase:Float;
	public var state:State;
	public var type:Array<Oscillator>;
	public var units:Float;
	public function start(?time:Encoding.Time):Tone;
	public function stop(?time:Encoding.Time):Tone;
	public function sync():Tone;
	public function unsync():Tone;
}

@:native("Encoding.EQ3") extern class EQ3 extends AudioNode {
	public function new(?lowLevel:Float, ?midLevel:Float, ?highLevel:Float):Void;
	public var Q:Array<MultibandSplit>;
	public var high:Array<Gain>;
	public var highFrequency:Array<MultibandSplit>;
	public var low:Array<Gain>;
	public var lowFrequency:Array<MultibandSplit>;
	public var mid:Array<Gain>;
}

@:native("Encoding.Analyser") extern class Analyser extends AudioNode {
	public function new(?type:AnalysisType, ?size:Float):Void;
	public var size:Float;
	public var smoothing:Array<AnalyserNode>;
	public var type:AnalysisType;
	public function getValue():js.lib.Float32Array;
}

@:native("Encoding.Follower") extern class Follower extends AudioNode {
	public function new(?attack:haxe.extern.EitherType<Encoding.Time, Dynamic>, ?release:Encoding.Time):Void;
	public var attack:Encoding.Time;
	public var release:Encoding.Time;
}

@:native("Encoding.VolumeOptions") interface VolumeOptions {
	@:optional
	public var volume:Float;
	@:optional
	public var mute:Bool;
}

@:native("Encoding.Volume") extern class Volume extends AudioNode {
	@:overload(function(?options:VolumeOptions):Void {})
	public function new(?volume:Float):Void;
	public var mute:Bool;
	public var volume:Array<Gain>;
}

@:native("Encoding.Merge") extern class Merge extends AudioNode {
	public var left:Gain;
	public var right:Gain;
}

@:native("Encoding.FilterOptions") interface FilterOptions {
	@:optional
	public var type:FilterType;
	@:optional
	public var frequency:Dynamic;
	@:optional
	public var rolloff:FilterRolloff;
	@:optional
	public var Q:Float;
	@:optional
	public var gain:Encoding.Gain;
}

@:native("Encoding.Filter") extern class Filter extends AudioNode {
	@:overload(function(?frequency:Dynamic, ?type:FilterType, ?rolloff:FilterRolloff):Void {})
	public function new(?options:FilterOptions):Void;
	public var Q:Signal<Float, Float>;
	public var detune:Signal<Float, Float>;
	public var frequency:Signal<Dynamic, Dynamic>;
	public var gain:Signal<Dynamic, Dynamic>;
	public var rolloff:FilterRolloff;
	public var type:FilterType;
}

@:native("Encoding.Waveform") extern class Waveform extends AudioNode {
	public function new(?size:Float):Void;
	public var size:Float;
	public function getValue():Array<Dynamic>;
}

@:native("Encoding.CompressorOptions") interface CompressorOptions {
	@:optional
	public var ratio:Float;
	@:optional
	public var threshold:Float;
	@:optional
	public var release:Float;
	@:optional
	public var attack:Float;
	@:optional
	public var knee:Float;
}

@:native("Encoding.MidSideCompressorOptions") interface MidSideCompressorOptions {
	@:optional
	public var mid:CompressorOptions;
	@:optional
	public var side:CompressorOptions;
}

@:native("Encoding.MidSideCompressor") extern class MidSideCompressor extends AudioNode {
	public function new(options:MidSideCompressorOptions):Void;
	public var mid:Compressor;
	public var side:Compressor;
}

@:native("Encoding.LowpassCombFilter") extern class LowpassCombFilter extends AudioNode {
	public function new(?delayTime:haxe.extern.EitherType<Encoding.Time, Dynamic>, ?resonance:Float, ?dampening:Dynamic):Void;
	// public var dampening:Param<Dynamic>;
	public var delayTime:Array<Delay>;
	public var resonance:Array<Gain>;
}

@:native("Encoding.PanVol") extern class PanVol extends AudioNode {
	public function new(pan:Float, volume:Float):Void;
	public var mute:Bool;
	public var pan:Array<Panner>;
	public var volume:Array<Volume>;
}

@:native("Encoding.MultibandSplit") extern class MultibandSplit extends AudioNode {
	public function new(?lowFrequency:haxe.extern.EitherType<Dynamic, Dynamic>, ?highFrequency:Dynamic):Void;
	public var Q:Signal<Float, Float>;
	public var high:Filter;
	public var highFrequency:Signal<Dynamic, Dynamic>;
	public var low:Filter;
	public var lowFrequency:Signal<Dynamic, Dynamic>;
	public var mid:Filter;
}

@:native("Encoding.FeedbackCombFilter") extern class FeedbackCombFilter extends AudioNode {
	public function new(?delayTime:haxe.extern.EitherType<Encoding.Time, Dynamic>, ?resonance:Float):Void;
	public var delayTime:Array<Delay>;
	public var resonance:Array<Gain>;
}

@:native("Encoding.MultibandCompressorOptions") interface MultibandCompressorOptions {
	@:optional
	public var low:CompressorOptions;
	@:optional
	public var mid:CompressorOptions;
	@:optional
	public var high:CompressorOptions;
	@:optional
	public var lowFrequency:Dynamic;
	@:optional
	public var highFrequency:Dynamic;
}

@:native("Encoding.MultibandCompressor") extern class MultibandCompressor extends AudioNode {
	public function new(options:MultibandCompressorOptions):Void;
	public var high:Compressor;
	public var highFrequency:Signal<Dynamic, Dynamic>;
	public var low:Compressor;
	public var lowFrequency:Signal<Dynamic, Dynamic>;
	public var mid:Compressor;
}

@:native("Encoding.ADSREnvelopeOptions") interface ADSREnvelopeOptions {
	@:optional
	public var attack:Encoding.Time;
	@:optional
	public var attackCurve:EnvelopeCurve;
	@:optional
	public var decay:Encoding.Time;
	@:optional
	public var decayCurve:EnvelopeCurve;
	@:optional
	public var sustain:Float;
	@:optional
	public var release:Encoding.Time;
	@:optional
	public var releaseCurve:EnvelopeCurve;
}

@:native("DynamicEnvelopeOptions") interface FrequencyEnvelopeOptions extends ADSREnvelopeOptions {
	@:optional
	public var baseFrequency:Dynamic;
	@:optional
	public var octaves:Float;
	@:optional
	public var exponent:Float;
}

@:native("DynamicEnvelope") extern class FrequencyEnvelope extends Envelope {
	@:overload(function(attack:Encoding.Time, decay:Encoding.Time, sustain:Float, release:Encoding.Time):Void {})
	public function new(options:FrequencyEnvelopeOptions):Void;
	public var baseFrequency:Dynamic;
	public var exponent:Float;
	public var octaves:Float;
}

@:native("Encoding.ScaledEnvelopeOptions") interface ScaledEnvelopeOptions extends ADSREnvelopeOptions {
	@:optional
	public var min:Float;
	@:optional
	public var max:Float;
	@:optional
	public var exponent:Float;
}

@:native("Encoding.ScaledEnvelope") extern class ScaledEnvelope extends Envelope {
	@:overload(function(attack:Encoding.Time, decay:Encoding.Time, sustain:Float, release:Encoding.Time):Void {})
	public function new(options:FrequencyEnvelopeOptions):Void;
	public var exponent:Float;
	public var max:Float;
	public var min:Float;
}

@:native("Encoding.AmplitudeEnvelopeOptions") interface AmplitudeEnvelopeOptions extends ADSREnvelopeOptions {}

@:native("Encoding.AmplitudeEnvelope") extern class AmplitudeEnvelope extends Envelope {
	@:overload(function(?attack:Encoding.Time, ?decay:Encoding.Time, ?sustain:Float, ?release:Encoding.Time):Void {})
	public function new(options:AmplitudeEnvelopeOptions):Void;
}

@:native("Encoding.Panner3D") extern class Panner3D extends AudioNode {
	public function new(positionX:Float, positionY:Float, positionZ:Float):Void;
	public var coneInnerAngle:Float;
	public var coneOuterAngle:Float;
	public var coneOuterGain:Gain;
	public var distanceModel:DistanceModel;
	public var maxDistance:Float;
	public var orientationX:Float;
	public var orientationY:Float;
	public var orientationZ:Float;
	public var panningModel:PanningModel;
	public var positionX:Float;
	public var positionY:Float;
	public var positionZ:Float;
	public var refDistance:Float;
	public var rolloffFactor:Float;
	public function setOrientation(x:Float, y:Float, z:Float):Tone;
	public function setPosition(x:Float, y:Float, z:Float):Tone;
}

@:native("Encoding.MidSideMerge") extern class MidSideMerge extends AudioNode {
	public var mid:Gain;
	public var side:Gain;
}

@:native("Encoding.MidSideSplit") extern class MidSideSplit extends AudioNode {
	public var mid:Multiply<Dynamic, Dynamic>;
	public var side:Multiply<Dynamic, Dynamic>;
}

@:native("Encoding.InstrumentOptions") interface InstrumentOptions {
	public var volume:Float;
}

@:native("Encoding.Instrument") extern class Instrument<O> extends AudioNode {
	public function new(?opts:O):Void;
	public var volume:Array<Volume>;
	public function sync():Tone;
	public function triggerAttackRelease(note:Dynamic, duration:Encoding.Time, ?time:Encoding.Time, ?velocity:Float):Tone;
	public function unsync():Tone;
}

@:native("Encoding.Monophonic") extern class Monophonic<O> extends Instrument<O> {
	public var portamento:Encoding.Time;
	public function getLevelAtTime(time:Encoding.Time):Float;
	public function setNote(note:Dynamic, ?time:Encoding.Time):Tone;
	public function triggerAttack(note:Dynamic, ?time:Encoding.Time, ?velocity:Float):Tone;
	public function triggerRelease(?time:Encoding.Time):Tone;
}

@:native("Encoding.NoiseSynthOptions") interface NoiseSynthOptions {
	public var noise:{public var type:NoiseType;};
	@:optional
	public var envelope:ADSREnvelopeOptions;
}

@:native("Encoding.NoiseSynth") extern class NoiseSynth extends Instrument<Dynamic> {
	public function new(options:NoiseSynthOptions):Void;
	public var envelope:AmplitudeEnvelope;
	public var noise:Noise;
	public function triggerAttack(note:Dynamic, ?time:Encoding.Time, ?velocity:Float):Tone;
	public function triggerRelease(?time:Encoding.Time):Tone;
}

@:native("Encoding.OscillatorOptions") interface OscillatorOptions<T> {
	@:optional
	public var type:T;
	@:optional
	public var modulationType:T;
	@:optional
	public var modulationIndex:Float;
	@:optional
	public var harmonicity:Float;
}

@:native("Encoding.SynthOptions") interface SynthOptions {
	@:optional
	public var oscillator:OscillatorOptions<OscillatorType>;
	@:optional
	public var envelope:ADSREnvelopeOptions;
}

@:native("Encoding.Synth") extern class Synth extends Monophonic<SynthOptions> {
	public var detune:Array<OmniOscillator>;
	public var envelope:AmplitudeEnvelope;
	public var frequency:Array<OmniOscillator>;
	public var oscillator:OmniOscillator;
}

@:native("Encoding.AMSynthOptions") interface AMSynthOptions {
	@:optional
	public var harmonicity:Float;
	@:optional
	public var detune:Float;
	@:optional
	public var oscillator:OscillatorOptions<Dynamic>;
	@:optional
	public var envelope:ADSREnvelopeOptions;
	@:optional
	public var modulation:OscillatorOptions<Dynamic>;
	@:optional
	public var modulationEnvelope:ADSREnvelopeOptions;
}

@:native("Encoding.AMSynth") extern class AMSynth extends Monophonic<AMSynthOptions> {
	public var detune:Signal<Float, Float>;
	public var envelope:Array<Synth>;
	public var frequency:Signal<Dynamic, Dynamic>;
	public var harmonicity:Multiply<Float, Float>;
	public var modulation:Oscillator;
	public var modulationEnvelope:AmplitudeEnvelope;
	public var oscillator:OmniOscillator;
}

@:native("Encoding.MonoSynthOptions") interface MonoSynthOptions {
	@:optional
	public var frequency:Dynamic;
	@:optional
	public var detune:Float;
	@:optional
	public var oscillator:OscillatorOptions<Dynamic>;
	@:optional
	public var filter:FilterOptions;
	@:optional
	public var envelope:ADSREnvelopeOptions;
	@:optional
	public var filterEnvelope:FrequencyEnvelopeOptions;
}

@:native("Encoding.MonoSynth") extern class MonoSynth extends Monophonic<MonoSynthOptions> {
	public var detune:Array<OmniOscillator>;
	public var envelope:AmplitudeEnvelope;
	public var frequency:Array<OmniOscillator>;
	public var filter:Filter;
	public var filterEnvelope:FrequencyEnvelope;
	public var oscillator:OmniOscillator;
}

@:native("Encoding.VoiceOptions") interface VoiceOptions {
	@:optional
	public var volume:Float;
	@:optional
	public var portamento:Float;
	@:optional
	public var oscillator:OscillatorOptions<Dynamic>;
	@:optional
	public var filterEnvelope:ADSREnvelopeOptions;
	@:optional
	public var envelope:ADSREnvelopeOptions;
}

@:native("Encoding.DuoSynthOptions") interface DuoSynthOptions {
	@:optional
	public var vibratoAmount:Float;
	@:optional
	public var vibratoRate:Dynamic;
	@:optional
	public var harmonicity:Float;
}

@:native("Encoding.DuoSynth") extern class DuoSynth extends Monophonic<DuoSynthOptions> {
	public var frequency:Signal<Dynamic, Dynamic>;
	public var harmonicity:Multiply<Float, Float>;
	public var vibratoAmount:Array<Gain>;
	public var vibratoRate:Array<LFO>;
	public var voice0:MonoSynth;
	public var voice1:MonoSynth;
}

@:native("Encoding.SamplesObject") interface SamplesObject {}

@:native("Encoding.Sampler") extern class Sampler extends Instrument<Dynamic> {
	public function new(samples:SamplesObject, ?onload:js.lib.Function, ?baseUrl:String):Void;
	public var attack:Encoding.Time;
	public var release:Encoding.Time;
	public function add(note:haxe.extern.EitherType<String, String>, url:haxe.extern.EitherType<String, haxe.extern.EitherType<Buffer, AudioBuffer>>,
		?callback:js.lib.Function):Void;
	public function releaseAll(?time:Encoding.Time):Tone;
	public function triggerAttack(note:Dynamic, ?time:Encoding.Time, ?velocity:Float):Tone;
	public function triggerRelease(?time:Encoding.Time):Tone;
}

@:native("Encoding.FMSynthOptions") interface FMSynthOptions {
	@:optional
	public var harmonicity:Float;
	@:optional
	public var modulationIndex:Float;
	@:optional
	public var detune:Float;
	@:optional
	public var oscillator:OscillatorOptions<Dynamic>;
	@:optional
	public var envelope:ADSREnvelopeOptions;
	@:optional
	public var modulation:ModulationOptions;
	@:optional
	public var modulationEnvelope:ADSREnvelopeOptions;
}

@:native("Encoding.FMSynth") extern class FMSynth extends Monophonic<FMSynthOptions> {
	public var detune:Signal<Float, Float>;
	public var envelope:Array<Synth>;
	public var frequency:Signal<Dynamic, Dynamic>;
	public var harmonicity:Multiply<Float, Float>;
	public var modulation:Array<Synth>;
	public var modulationEnvelope:Array<Synth>;
	public var modulationIndex:Multiply<Float, Float>;
	public var oscillator:Array<Synth>;
}

@:native("Encoding.PluckSynthOptions") interface PluckSynthOptions {
	@:optional
	public var attackNoise:Float;
	@:optional
	public var dampening:Dynamic;
	@:optional
	public var resonance:Float;
}

@:native("Encoding.PluckSynth") extern class PluckSynth extends Instrument<Dynamic> {
	public function new(?options:PluckSynthOptions):Void;
	public var attackNoise:Float;
	public var dampening:Array<LowpassCombFilter>;
	public var resonance:Array<LowpassCombFilter>;
	public function triggerAttack(note:Dynamic, ?time:Encoding.Time):Tone;
}

@:native("Encoding.MetalSynthOptions") interface MetalSynthOptions {
	@:optional
	public var frequency:Dynamic;
	@:optional
	public var harmonicity:Float;
	@:optional
	public var modulationIndex:Float;
	@:optional
	public var resonance:Float;
	@:optional
	public var octaves:Float;
}

@:native("Encoding.MetalSynth") extern class MetalSynth extends Instrument<Dynamic> {
	public function new(?options:MetalSynthOptions):Void;
	public var envelope:Envelope;
	public var frequency:Signal<Dynamic, Dynamic>;
	public var harmonicity:Array<FMOscillator>;
	public var modulationIndex:Array<FMOscillator>;
	public var octaves:Float;
	public var resonance:Array<Scale>;
	public function triggerAttack(note:Dynamic, ?time:Encoding.Time, ?velocity:Float):Tone;
	public function triggerRelease(?time:Encoding.Time):Tone;
}

@:native("Encoding.PolySynthOptions") interface PolySynthOptions {
	@:optional
	public var polyphony:Float;
	@:optional
	public var volume:Float;
	@:optional
	public var detune:Float;
	@:optional
	public var voice:Dynamic;
}

@:native("Encoding.PolySynth") extern class PolySynth<T:(Instrument<Dynamic>) > extends Instrument<Dynamic> {
	@:overload(function(?polyphony:Float, ?voice:Dynamic):Void {})
	public function new(?options:PolySynthOptions):Void;
	public var detune:Signal<Float, Float>;
	public var voices:Array<Dynamic>;
	public function get(?params:haxe.extern.EitherType<String, Array<String>>):Array<Dynamic>;
	public function releaseAll(?time:Encoding.Time):Tone;
	@:overload(function(params:String, value:Dynamic, ?rampTime:Encoding.Time):Tone {})
	public function set(attributes:Dynamic):Tone;
	public function triggerAttack(notes:Array<Dynamic>, ?time:Encoding.Time, ?velocity:Float):Tone;
	public function triggerRelease(notes:Array<Dynamic>, ?time:Encoding.Time):Tone;
}

@:native("Encoding.MembraneSynthOptions") interface MembraneSynthOptions {
	@:optional
	public var pitchDecay:Encoding.Time;
	@:optional
	public var octaves:Float;
	@:optional
	public var oscillator:OscillatorOptions<Dynamic>;
	@:optional
	public var envelope:ADSREnvelopeOptions;
}

@:native("Encoding.MembraneSynth") extern class MembraneSynth extends Instrument<MembraneSynthOptions> {
	public var envelope:AmplitudeEnvelope;
	public var octaves:Float;
	public var oscillator:OmniOscillator;
	public var pitchDecay:Encoding.Time;
	public function triggerAttack(note:Dynamic, ?time:Encoding.Time, ?velocity:Float):Tone;
	public function triggerRelease(?time:Encoding.Time):Tone;
}

@:native("Encoding.Event") extern class Event extends Tone {
	public function new(callback:js.lib.Function, value:Dynamic):Void;
	public var callback:js.lib.Function;
	public var loop:haxe.extern.EitherType<Bool, Float>;
	public var loopEnd:Encoding.Time;
	public var loopStart:Encoding.Time;
	public var mute:Bool;
	public var playbackRate:Float;
	public var probability:Float;
	public var progress:Float;
	public var state:haxe.extern.EitherType<String, String>;
	public function cancel(?time:Encoding.TransportTime):Tone;
	public function start(time:Encoding.TransportTime):Tone;
	public function stop(time:Encoding.TransportTime):Tone;
}

@:native("Encoding.TimeEventObject") interface TimeEventObject {
	public var time:Encoding.Time;
	public var note:String;
	@:optional
	public var dur:String;
	@:optional
	public var velocity:Float;
}

@:native("Encoding.Part") extern class Part extends Event {
	public function new(callback:js.lib.Function, events:Array<Dynamic>):Void;
	// public function new(callback:js.lib.Function<Array<Dynamic>>, events:Array<Dynamic>):Void;
	// public function new(callback:js.lib.Function<Array<Dynamic>>, events:Array<Dynamic.extern.EitherType<TimeEventPair, TimeEventObject>>):Void;
	public var length:Float;
	public function add(time:Encoding.Time, value:Dynamic):Tone;
	public function at(time:Encoding.TransportTime, ?value:Dynamic):Event;
}

@:native("Encoding.Sequence") extern class Sequence<T> extends Part {
	public function new(callback:Dynamic, events:Array<Dynamic>, subdivision:Encoding.Time):Void;
	public var subdivision:Encoding.Time;
}

@:native("Encoding.Loop") extern class Loop extends Tone {
	public function new(callback:js.lib.Function, interval:Encoding.Time):Void;
	// public function new(callback:js.lib.Function<Array<Dynamic>>, interval:Encoding.Time):Void;
	public var callback:js.lib.Function;
	public var humanize:haxe.extern.EitherType<Bool, Encoding.Time>;
	public var interval:Encoding.Time;
	public var iterations:Float;
	public var mute:Bool;
	public var playbackRate:Float;
	public var probability:Float;
	public var progress:Float;
	public var state:haxe.extern.EitherType<String, String>;
	public function cancel(?time:Encoding.TransportTime):Tone;
	public function start(time:Encoding.TransportTime):Tone;
	public function stop(time:Encoding.TransportTime):Tone;
}

@:native("Encoding.Pattern") extern class Pattern extends Loop {
	public function new(callback:js.lib.Function, values:Array<String>):Void;
	public var index:Float;
	public var pattern:ControlPattern;
	public var value:String;
}

@:native("Encoding.EffectOptions") interface EffectOptions {
	@:optional
	public var wet:Float;
}

@:native("Encoding.Effect") extern class Effect extends AudioNode {
	@:overload(function(?options:EffectOptions):Void {})
	public function new(?wet:Float):Void;
	public var wet:Array<CrossFade>;
}

@:native("Encoding.StereoEffect") extern class StereoEffect extends Effect {}

@:native("Encoding.FeedbackEffectOptions") interface FeedbackEffectOptions {
	@:optional
	public var feedback:Float;
}

@:native("Encoding.FeedbackEffect") extern class FeedbackEffect extends Effect {
	@:overload(function(?options:FeedbackEffectOptions):Void {})
	public function new(?feedback:Float):Void;
	public var feedback:Array<Gain>;
}

@:native("Encoding.StereoFeedbackEffect") extern class StereoFeedbackEffect extends StereoEffect {
	public var feedback:Signal<Float, Float>;
}

@:native("Encoding.StereoXFeedbackEffect") extern class StereoXFeedbackEffect extends StereoEffect {
	public var feedback:Signal<Float, Float>;
}

@:native("Encoding.MidSideEffect") extern class MidSideEffect extends Effect {}

@:native("Encoding.ChorusOptions") interface ChorusOptions {
	@:optional
	public var frequency:Dynamic;
	@:optional
	public var delayTime:Float;
	@:optional
	public var depth:Float;
	@:optional
	public var type:BasicOscillatorType;
	@:optional
	public var spread:Float;
}

@:native("Encoding.Chorus") extern class Chorus extends StereoEffect {
	@:overload(function(?frequency:Dynamic, ?delayTime:Float, ?depth:Float):Void {})
	public function new(?options:ChorusOptions):Void;
	public var delayTime:Float;
	public var depth:Float;
	public var frequency:Dynamic;
	public var spread:Float;
	public var type:BasicOscillatorType;
}

@:native("Encoding.AutoPannerOptions") interface AutoPannerOptions {
	@:optional
	public var depth:Float;
	@:optional
	public var frequency:Dynamic;
	@:optional
	public var type:BasicOscillatorType;
}

@:native("Encoding.AutoPanner") extern class AutoPanner extends Effect {
	@:overload(function(?frequency:Dynamic):Void {})
	public function new(?options:AutoPannerOptions):Void;
	public var depth:Array<LFO>;
	public var frequency:Array<LFO>;
	public var type:BasicOscillatorType;
	public function start(?time:Encoding.Time):Tone;
	public function stop(?time:Encoding.Time):Tone;
	public function sync(?delay:Encoding.Time):Tone;
	public function unsync():Tone;
}

@:native("Encoding.FollowerOptions") interface FollowerOptions {
	@:optional
	public var attack:Encoding.Time;
	@:optional
	public var release:Encoding.Time;
}

@:native("Encoding.AutoWahOptions") interface AutoWahOptions {
	@:optional
	public var baseFrequency:Dynamic;
	@:optional
	public var octaves:Float;
	@:optional
	public var sensitivity:Float;
	@:optional
	public var Q:Float;
	@:optional
	public var gain:Float;
	@:optional
	public var follower:FollowerOptions;
}

@:native("Encoding.AutoWah") extern class AutoWah extends Effect {
	@:overload(function(?baseFrequency:Dynamic, ?octaves:Float, ?sensitivity:Float):Void {})
	public function new(?options:AutoWahOptions):Void;
	public var Q:Array<Filter>;
	public var baseFrequency:Dynamic;
	public var gain:Array<Filter>;
	public var octaves:Float;
	public var sensitivity:Float;
}

@:native("Encoding.PitchShift") extern class PitchShift extends FeedbackEffect {
	public function new(?pitch:Float):Void;
	public var delayTime:Array<FeedbackDelay>;
	public var pitch:Float;
	public var windowSize:Encoding.Time;
}

@:native("Encoding.StereoWidenerOptions") interface StereoWidenerOptions {
	public var width:Float;
}

@:native("Encoding.StereoWidener") extern class StereoWidener extends MidSideEffect {
	@:overload(function(?width:Float):Void {})
	public function new(?options:StereoWidenerOptions):Void;
	public var width:Signal<Float, Float>;
}

@:native("Encoding.Tremolo") extern class Tremolo extends StereoEffect {
	public function new(?frequency:Dynamic, ?depth:Float):Void;
	public var depth:Signal<Float, Float>;
	public var frequency:Signal<Dynamic, Dynamic>;
	public var spread:Float;
	public var type:BasicOscillatorType;
	public function start(?time:Encoding.Time):Tone;
	public function stop(?time:Encoding.Time):Tone;
	public function sync(?delay:Encoding.Time):Tone;
	public function unsync():Tone;
}

@:native("Encoding.PingPongDelayOptions") interface PingPongDelayOptions {
	@:optional
	public var delayTime:Encoding.Time;
	@:optional
	public var maxDelayTime:Float;
	@:optional
	public var feedback:Float;
}

@:native("Encoding.PingPongDelay") extern class PingPongDelay extends StereoXFeedbackEffect {
	@:overload(function(?delayTime:Encoding.Time, ?feedback:Float):Void {})
	public function new(?options:PingPongDelayOptions):Void;
	// public var delayTime:Signal<Encoding.Time, Dynamic>;
}

@:native("Encoding.ConvolverOptions") interface ConvolverOptions {
	@:optional
	public var url:haxe.extern.EitherType<String, Buffer>;
	@:optional
	public var onload:js.lib.Function;
}

@:native("Encoding.Convolver") extern class Convolver extends Effect {
	@:overload(function(?url:haxe.extern.EitherType<String, Buffer>, ?onload:js.lib.Function):Void {})
	public function new(?options:ConvolverOptions):Void;
	public var buffer:AudioBuffer;
	public function load(url:String, ?callback:js.lib.Function):Promise<Tone>;
}

@:native("Encoding.ChebyShevOptions") interface ChebyShevOptions {
	@:optional
	public var order:Float;
	@:optional
	public var oversample:OverSampleType;
}

@:native("Encoding.ChebyShev") extern class ChebyShev extends Effect {
	@:overload(function(?order:Float):Void {})
	public function new(?options:ChebyShevOptions):Void;
	public var order:Float;
	public var oversample:OversamplingType;
}

@:native("Encoding.Vibrato") extern class Vibrato extends Effect {
	public function new(frequency:Dynamic, depth:Float):Void;
	public var depth:Array<LFO>;
	public var frequency:Array<LFO>;
	public var type:BasicOscillatorType;
}

@:native("Encoding.BitCrusher") extern class BitCrusher extends Effect {
	public function new(bits:Float):Void;
	public var bits:Float;
}

@:native("Encoding.Reverb") extern class Reverb extends Convolver {
	public function new(?decay:Encoding.Time):Void;
	public var decay:Encoding.Time;
	public var preDelay:Encoding.Time;
	public function generate():Promise<Tone>;
}

@:native("Encoding.DistortionOptions") interface DistortionOptions {
	@:optional
	public var distortion:Float;
	@:optional
	public var oversample:OversamplingType;
}

@:native("Encoding.Distortion") extern class Distortion extends Effect {
	@:overload(function(?distortion:Float):Void {})
	public function new(?object:DistortionOptions):Void;
	public var distortion:Float;
	public var oversample:OversamplingType;
}

@:native("Encoding.JCReverbOptions") interface JCReverbOptions {
	public var roomSize:Float;
}

@:native("Encoding.JCReverb") extern class JCReverb extends Effect {
	@:overload(function(?roomSize:Float):Void {})
	public function new(?object:JCReverbOptions):Void;
	public var roomSize:Signal<Float, Float>;
}

@:native("Encoding.FreeverbOptions") interface FreeverbOptions {
	@:optional
	public var roomSize:Float;
	@:optional
	public var dampening:Dynamic;
}

@:native("Encoding.Freeverb") extern class Freeverb extends Effect {
	@:overload(function(?roomSize:Float, ?dampening:Dynamic):Void {})
	public function new(?object:FreeverbOptions):Void;
	public var dampening:Signal<Dynamic, Dynamic>;
	public var roomSize:Signal<Float, Float>;
}

@:native("Encoding.AutoFilterOptions") interface AutoFilterOptions {
	@:optional
	public var frequency:Dynamic;
	@:optional
	public var type:BasicOscillatorType;
	@:optional
	public var depth:Float;
	@:optional
	public var baseFrequency:Dynamic;
	@:optional
	public var octaves:Float;
	@:optional
	public var filter:FilterOptions;
}

@:native("Encoding.AutoFilter") extern class AutoFilter extends Effect {
	@:overload(function(?frequency:Dynamic, ?baseFrequency:Dynamic, ?octaves:Float):Void {})
	public function new(?object:AutoFilterOptions):Void;
	public var depth:Array<LFO>;
	public var filter:Filter;
	public var frequency:Array<LFO>;
	public var min:Dynamic;
	public var octaves:Float;
	public var type:BasicOscillatorType;
	public function start(?time:Encoding.Time):Tone;
	public function stop(?time:Encoding.Time):Tone;
	public function sync(?delay:Encoding.Time):Tone;
	public function unsync():Tone;
}

@:native("Encoding.FeedbackDelayOptions") interface FeedbackDelayOptions {
	public var delayTime:Encoding.Time;
	public var maxDelay:Float;
}

@:native("Encoding.FeedbackDelay") extern class FeedbackDelay extends FeedbackEffect {
	@:overload(function(?delayTime:Encoding.Time, ?feedback:Float):Void {})
	public function new(?object:FeedbackDelayOptions):Void;
	public var delayTime:Array<Delay>;
}

@:native("Encoding.PhaserOptions") interface PhaserOptions {
	public var frequency:Dynamic;
	public var octaves:Float;
	public var stages:Float;
	public var Q:Float;
	public var baseFrequency:Dynamic;
}

@:native("Encoding.Phaser") extern class Phaser extends StereoEffect {
	@:overload(function(?frequency:Dynamic, ?octaves:Float, ?baseFrequency:Dynamic):Void {})
	public function new(?object:PhaserOptions):Void;
	public var Q:Signal<Float, Float>;
	public var baseFrequency:Dynamic;
	public var frequency:Array<LFO>;
	public var octaves:Float;
}

@:native("Encoding.CtrlPattern") extern class CtrlPattern<T> extends Tone {
	public function new(values:Array<Dynamic>, ?type:ControlPattern):Void;
	public var index:Float;
	public var type:ControlPattern;
	public var value:T;
	public var values:Array<Dynamic>;
	public function next():T;
}

@:native("Encoding.MarkovWeightedState") interface MarkovWeightedState {
	public var value:String;
	public var probability:Float;
}

@:native("Encoding.ControlMarkovValues") interface ControlMarkovValues {}

@:native("Encoding.CtrlMarkov") extern class CtrlMarkov extends Tone {
	public function new(values:ControlMarkovValues):Void;
	public var value:String;
	public var values:ControlMarkovValues;
	public function next():String;
}

@:native("Encoding.CtrlRandom") extern class CtrlRandom extends Tone {
	public function new(min:haxe.extern.EitherType<Float, Encoding.Time>, max:haxe.extern.EitherType<Float, Encoding.Time>):Void;
	public var integer:Bool;
	public var max:haxe.extern.EitherType<Float, Encoding.Time>;
	public var min:haxe.extern.EitherType<Float, Encoding.Time>;
	public var value:haxe.extern.EitherType<Float, Encoding.Time>;
}

@:native("Encoding.CtrlInterpolate") extern class CtrlInterpolate<T> extends Tone {
	public function new(values:Array<Dynamic>, index:Float):Void;
	public var index:Float;
	public var value:T;
	public var values:Array<Dynamic>;
}

@:native("Encoding.Source") extern class Source extends AudioNode {
	public var fadeIn:Encoding.Time;
	public var fadeOut:Encoding.Time;
	public var mute:Bool;
	public var state:State;
	public var volume:Array<Volume>;
	public function start(?time:Encoding.Time):Tone;
	public function stop(?time:Encoding.Time):Tone;
	public function sync():Tone;
	public function unsync():Tone;
}

@:native("Encoding.NoiseOptions") interface NoiseOptions {
	@:optional
	public var type:NoiseType;
	@:optional
	public var playbackRate:Float;
}

@:native("Encoding.Noise") extern class Noise extends Source {
	@:overload(function(?options:NoiseOptions):Void {})
	public function new(type:NoiseType):Void;
	public var type:NoiseType;
	public function restart(?time:Encoding.Time):Void;
}

@:native("Encoding.TickSource") extern class TickSource extends Tone {
	public function new(frequency:Dynamic):Void;
	public var frequency:TickSignal<Dynamic, Dynamic>;
	public var seconds:Float;
	public var state:State;
	public var ticks:Encoding.Ticks;
	public function cancel(?time:Encoding.Time):Tone;
	public function forEachTickBetween(startTime:Encoding.Time, endTime:Encoding.Time, callback:js.lib.Function):Tone;
	public function getSecondsAtTime(time:Encoding.Time):Float;
	public function getStateAtTime(time:Encoding.Time):State;
	public function getTicksAtTime(time:Encoding.Time):Encoding.Ticks;
	public function getTimeOfTick(ticks:Encoding.Ticks, ?before:Encoding.Time):Encoding.Time;
	public function pause(?time:Encoding.Time):Tone;
	public function setTicksAtTime(ticks:Encoding.Ticks, time:Encoding.Time):Tone;
	public function start(?time:Encoding.Time, ?offset:Encoding.Ticks):Tone;
	public function stop(?time:Encoding.Time):Tone;
}

@:native("Encoding.Player") extern class Player extends Source {
	public function new(url:haxe.extern.EitherType<String, AudioBuffer>, ?onload:js.lib.Function):Void;
	public var autostart:Bool;
	public var buffer:Buffer;
	public var loop:Bool;
	public var loopEnd:Encoding.Time;
	public var loopStart:Encoding.Time;
	public var playbackRate:Float;
	public var position:Float;
	public var reverse:Bool;
	public function load(url:String, ?callback:js.lib.Function):Promise<Tone>;
	public function restart(?startTime:Encoding.Time, ?offset:Encoding.Time, ?duration:Encoding.Time):Tone;
	public function seek(offset:Encoding.Time, ?time:Encoding.Time):Tone;
	public function setLoopPoints(loopStart:Encoding.Time, loopEnd:Encoding.Time):Tone;
}

@:native("Encoding.BufferSource") extern class BufferSource extends AudioNode {
	public function new(buffer:haxe.extern.EitherType<AudioBuffer, Buffer>, onload:js.lib.Function):Void;
	public var buffer:Buffer;
	public var curve:Float;
	public var fadeIn:Encoding.Time;
	public var fadeOut:Encoding.Time;
	public var loop:Bool;
	public var loopEnd:Encoding.Time;
	public var loopStart:Encoding.Time;
	public var onended:js.lib.Function;
	public var playbackRate:Param<Float, Float>;
	public var state:State;
	public function cancelStop():Tone;
	public function getStateAtTime(time:Encoding.Time):State;
	public function start(?startTime:Encoding.Time, ?offset:Encoding.Time, ?duration:Encoding.Time, ?gain:Encoding.Gain, ?fadeInTime:Encoding.Time):Tone;
	public function stop(?time:Encoding.Time, ?fadeOutTime:Encoding.Time):Tone;
}

@:native("Encoding.Oscillator") extern class Oscillator extends Source {
	public function new(?frequency:Dynamic, ?type:BasicOscillatorType):Void;
	public var detune:Signal<Float, Float>;
	public var frequency:Signal<Dynamic, Dynamic>;
	public var partials:Array<Frequency>;
	public var phase:Float;
	public var type:OscillatorType;
	public function restart(?time:Encoding.Time):Tone;
	public function syncFrequency():Tone;
	public function unsyncFrequency():Tone;
}

@:native("Encoding.FatOscillator") extern class FatOscillator extends Source {
	public function new(frequency:Dynamic, type:BasicOscillatorType, modulationType:BasicOscillatorType):Void;
	public var count:Float;
	public var detune:Signal<Float, Float>;
	public var frequency:Signal<Dynamic, Dynamic>;
	public var partials:Array<Frequency>;
	public var phase:Float;
	public var spread:Float;
	public var type:OscillatorType;
}

@:native("Encoding.URLMap") interface URLMap {}

@:native("Encoding.PlayersOptions") interface PlayersOptions {
	public var urls:URLMap;
	@:optional
	public var volume:Float;
	@:optional
	public var mute:Bool;
	@:optional
	public var onload:js.lib.Function;
	@:optional
	public var fadeIn:Float;
	@:optional
	public var fadeOut:Float;
}

@:native("Encoding.Players") extern class Players extends AudioNode {
	@:overload(function(urls:URLMap, ?onload:js.lib.Function):Void {})
	public function new(?options:PlayersOptions):Void;
	public var state:State;
	public var volume:Array<Volume>;
	public function add(name:String, url:String, callback:js.lib.Function):Void;
	public function get(name:String):Player;
	public function has(name:String):Bool;
	public function stopAll(?time:Encoding.Time):Tone;
}

@:native("Encoding.PWMOscillator") extern class PWMOscillator extends Source {
	public function new(frequency:Dynamic, ?modulationFrequency:Dynamic):Void;
	public var detune:Array<Oscillator>;
	public var frequency:Array<Oscillator>;
	public var modulationFrequency:Array<PulseOscillator>;
	public var phase:Array<Oscillator>;
	public var type:String;
}

@:native("Encoding.AMOscillator") extern class AMOscillator extends Oscillator {
	public function new(frequency:Dynamic, type:BasicOscillatorType, modulationType:BasicOscillatorType):Void;
	public var harmonicity:Multiply<Float, Float>;
	public var modulationType:Array<Oscillator>;
}

@:native("Encoding.OscillatorNode") extern class OscillatorNode extends AudioNode {
	public function new(buffer:haxe.extern.EitherType<AudioBuffer, Buffer>, onload:js.lib.Function):Void;
	public var detune:Param<Float, Float>;
	public var frequency:Param<Float, Float>;
	public var onended:js.lib.Function;
	public var state:State;
	public var type:BasicOscillatorType;
	public function cancelStop():Tone;
	public function getStateAtTime(time:Encoding.Time):State;
	public function setPeriodicWave(periodicWave:PeriodicWave):Tone;
	public function start(?time:Encoding.Time):Tone;
	public function stop(?time:Encoding.Time):Tone;
}

@:native("Encoding.PulseOscillator") extern class PulseOscillator extends Source {
	public function new(frequency:Dynamic, width:Float):Void;
	public var detune:Array<Oscillator>;
	public var frequency:Array<Oscillator>;
	public var phase:Array<Oscillator>;
	public var type:String;
	public var width:Signal<Float, Float>;
}

@:native("Encoding.FMOscillator") extern class FMOscillator extends Source {
	public var detune:Array<Oscillator>;
	public var frequency:Array<Oscillator>;
	public var harmonicity:Multiply<Float, Float>;
	public var modulationIndex:Multiply<Float, Float>;
	public var modulationType:Array<Oscillator>;
	public var partials:Array<Oscillator>;
	public var phase:Array<Oscillator>;
	public var type:Array<Oscillator>;
}

@:native("Encoding.OmniOscillator") extern class OmniOscillator extends Source {
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

@:native("Encoding.GrainPlayer") extern class GrainPlayer extends Source {
	public function new(url:haxe.extern.EitherType<String, Buffer>, ?callback:js.lib.Function):Void;
	public var buffer:Buffer;
	public var detune:Float;
	public var grainSize:Encoding.Time;
	public var loop:Bool;
	public var loopEnd:Encoding.Time;
	public var loopStart:Encoding.Time;
	public var overlap:Encoding.Time;
	public var playbackRate:Float;
	public var reverse:Bool;
	public function seek(offset:Encoding.Time, ?time:Encoding.Time):Tone;
}

@:native("Encoding.UserMedia") extern class UserMedia extends AudioNode {
	public function new(?volume:Float):Void;
	static public function enumerateDevices():Promise<Array<Dynamic>>;
	public var deviceId:String;
	public var groupId:String;
	public var label:String;
	public var mute:Bool;
	public var state:State;
	static public var supported:Bool;
	public var volume:Array<Volume>;
	public function close():Tone;
	public function open(labelOrId:haxe.extern.EitherType<String, Float>):Promise<MediaStream>;
}

@:native("Encoding.SignalBase") extern class SignalBase extends Tone {
	public function connect(node:haxe.extern.EitherType<ProcessingNode, haxe.extern.EitherType<Signal<Dynamic, Dynamic>, SignalBase>>, ?outputNumber:Float,
		?inputNumber:Float):Tone;
}

@:native("Encoding.SignalOptions") interface SignalOptions<E> {
	public var value:E;
	public var units:Float;
	public var convert:Bool;
}

@:native("Encoding.Signal") extern class Signal<E, T> extends Param<E, T> {
	public function new(?value:haxe.extern.EitherType<E, AudioParam>, ?units:Float):Void;
}

@:native("Encoding.Add") extern class Add<E, T> extends Signal<E, T> {
	public function new(?value:Float):Void;
}

@:native("Encoding.Multiply") extern class Multiply<E, T> extends Signal<E, T> {
	public function new(?value:Float):Void;
}

@:native("Encoding.Scale") extern class Scale extends SignalBase {
	public function new(?outputMin:Float, ?outputMax:Float):Void;
	public var max:Float;
	public var min:Float;
}

@:native("Encoding.Pow") extern class Pow extends SignalBase {
	public function new(exp:Float):Void;
	public var value:Float;
}

@:native("Encoding.EqualPowerGain") extern class EqualPowerGain extends SignalBase {}
@:native("Encoding.TransportTimelineSignal") extern class TransportTimelineSignal<E, T> extends Signal<E, T> {}
@:native("Encoding.GainToAudio") extern class GainToAudio extends SignalBase {}

@:native("Encoding.Subtract") extern class Subtract<E, T> extends Signal<E, T> {
	public function new(?value:Float):Void;
}

@:native("Encoding.Abs") extern class Abs extends SignalBase {}

@:native("Encoding.Normalize") extern class Normalize extends SignalBase {
	public function new(inputMin:Float, inputMax:Float):Void;
	public var max:Float;
	public var min:Float;
}

@:native("Encoding.ScaleExp") extern class ScaleExp extends SignalBase {
	public function new(?outputMin:Float, ?outputMax:Float, ?exponent:Float):Void;
	public var exponent:Float;
	public var max:Float;
	public var min:Float;
}

@:native("Encoding.Zero") extern class Zero extends SignalBase {}

@:native("Encoding.GreaterThan") extern class GreaterThan<E, T> extends Signal<E, T> {
	public function new(?value:Float):Void;
}

@:native("Encoding.AudioToGain") extern class AudioToGain extends SignalBase {}

@:native("Encoding.WaveShaper") extern class WaveShaper extends SignalBase {
	public function new(mapping:haxe.extern.EitherType<WaveShaperMappingFn, haxe.extern.EitherType<Array<Dynamic>, Float>>, ?bufferLen:Float):Void;
	public var curve:Array<Dynamic>;
	public var oversample:OversamplingType;
	public function setMap(mapping:WaveShaperMappingFn):Tone;
}

@:native("Encoding.GreaterThanZero") extern class GreaterThanZero extends SignalBase {}

@:native("Encoding.TickSignal") extern class TickSignal<E, T> extends Signal<E, T> {
	public function new(?value:Dynamic):Void;
}

@:native("Encoding.Negate") extern class Negate extends SignalBase {}

@:native("Encoding.Modulo") extern class Modulo extends SignalBase {
	public function new(modulus:Float):Void;
	public var value:Float;
}

@:native("Encoding.EncodingTopLevel") extern class EncodingTopLevel {
	static var Master:Dynamic;
	static var Frequency:Dynamic;
	static var Midi:Dynamic;
	static var Ticks:Dynamic;
	static var TimeBase:Dynamic;
	static var Time:Dynamic;
	static var TransportTime:Dynamic;
	static var Transport:Dynamic;
	static var Draw:Dynamic;
}

@:enum abstract State(Int) {
	var Started = 0;
	var started = 1;
	var Stopped = 2;
	var stopped = 3;
	var Paused = 4;
	var paused = 5;
}
