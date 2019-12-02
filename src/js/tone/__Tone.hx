package js.tone;



@:native("Tone") extern class Tone {
	public function new(?opts:Dynamic):Void;
	static public function Offline(callback:Tone.Callback, duration:Tone.Time):Promise<Tone.Buffer>;
	static public function connectSeries(nodes:haxe.extern.Rest<haxe.extern.EitherType<AudioParam, haxe.extern.EitherType<Tone, AudioNode>>>):Tone;
	static public function dbToGain(db:Tone.Decibels):Float;
	@:overload(function<G>(given:NonNullable<G>, ?fallback:Undefined):G { })
	@:overload(function<F>(given:Undefined, fallback:NonNullable<F>):F { })
	@:overload(function<G, F>(given:G, ?fallback:F):G { })
	static public function defaultArg<G:(Dynamic), F:(Dynamic)>(given:G, fallback:F):Dynamic;
	static public function defaults(values:Array<Dynamic>, keys:Array<String>, constr:haxe.extern.Rest<Dynamic> -> haxe.extern.EitherType<Dynamic, Dynamic>):Dynamic;
	static public function equalPowerScale(percent:Tone.NormalRange):Float;
	static public function extend<T:(Tone.Ctor), P:(Tone.Ctor)>(child:T, ?parent:P):Dynamic;
	static public function gainToDb(gain:Float):Tone.Decibels;
	static public function intervalToFrequencyRation(interval:Tone.Interval):Float;
	@:overload(function(arg:Dynamic):False { })
	static public function isArray(arg:ReadonlyArray<Dynamic>):True;
	@:overload(function(arg:Dynamic):False { })
	static public function isBoolean(arg:Bool):True;
	@:overload(function(arg:Dynamic):True { })
	static public function isDefined(?arg:Undefined):False;
	@:overload(function(arg:Dynamic):False { })
	static public function isFunction(arg:haxe.extern.Rest<Dynamic> -> Void):True;
	@:overload(function(arg:Dynamic):False { })
	static public function isNumber(arg:Float):True;
	@:overload(function(arg:Dynamic):False { })
	static public function isObject(arg:Dynamic):True;
	@:overload(function(arg:Dynamic):False { })
	static public function isString(arg:String):True;
	@:overload(function(arg:Dynamic):False { })
	static public function isUndef(?arg:Undefined):True;
	static public function isNote(arg:Dynamic):Bool;
	static public function loaded():Promise<Void>;
	static public function now():Float;
	static public var context : Tone.Context;
	public function receive(channelName:String, ?channelNumber:Float):This;
	public function send(channelName:String, amount:Tone.Decibels):GainNode;
	public function toFrequency(freq:Tone.Frequency):Tone.Hertz;
	public function toSeconds(time:Tone.Time):Tone.Seconds;
	public function toTicks(time:Tone.Time):Tone.Ticks;
}





@:native("Tone.Master") interface Master {
	public var mute : Bool;
	public var volume : Array<Volume>;
	public function chain(nodes:haxe.extern.Rest<ProcessingNode>):This;
}
@:native("Tone.PrimitiveTypeConstructor") interface PrimitiveTypeConstructor<E, T> {
	public function new(value:E, ?units:Unit):T;
}
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
@:native("Tone.Frequency") interface Frequency extends TimeBase {
	public function harmonize(intervals:ReadonlyArray<Tone.Interval>):ReadonlyArray<Float>;
	public function toMidi():Tone.MIDI;
	public function toNote():Tone.Note;
	public function toTicks():Tone.Ticks;
	public function transpose(interval:Tone.Interval):Frequency;
}
@:native("Tone.FrequencyConstructor") interface FrequencyConstructor extends PrimitiveTypeConstructor<Tone.Frequency, Frequency> {
	public function ftom(frequency:Tone.Frequency):Tone.MIDI;
	public function mtof(midi:Tone.MIDI):Tone.Frequency;
}
@:native("Tone.Midi") interface Midi extends Frequency {
	public function toFrequency():Float;
}
@:native("Tone.MidiConstructor") interface MidiConstructor extends PrimitiveTypeConstructor<Tone.MIDI, Midi> {
	public function ftom(frequency:Tone.Frequency):Tone.MIDI;
	public function mtof(midi:Tone.MIDI):Tone.Frequency;
}
@:native("Tone.Ticks") interface Ticks extends TransportTime {

}
@:native("Tone.TicksConstructor") interface TicksConstructor extends PrimitiveTypeConstructor<Tone.Ticks, Ticks> {

}
@:native("Tone.TimeBase") interface TimeBase {
	public function toFrequency():Float;
	public function toMilliseconds():Float;
	public function toSamples():Float;
	public function toSeconds():Float;
	public function valueOf():Float;
}
@:native("Tone.TimeBaseConstructor") interface TimeBaseConstructor extends PrimitiveTypeConstructor<Tone.Time, TimeBase> {

}
@:native("Tone.Time") interface Time extends TimeBase {
	public function quantize(val:haxe.extern.EitherType<Float, Tone.Time>, ?percent:Tone.NormalRange):Float;
	public function toBarsBeatsSixteenths():Tone.BarsBeatsSixteenths;
	public function toMidi():Tone.MIDI;
	public function toNotation():Tone.Notation;
	public function toTicks():Tone.Ticks;
}
@:native("Tone.TimeConstructor") interface TimeConstructor extends PrimitiveTypeConstructor<Tone.Time, Time> {

}
@:native("Tone.TransportTime") interface TransportTime extends Time {

}
@:native("Tone.TransportTimeConstructor") interface TransportTimeConstructor extends PrimitiveTypeConstructor<Tone.TransportTime, TransportTime> {

}
@:native("Tone.AudioNode") extern class AudioNode extends Tone {
	public var channelCount : Float;
	public var channelCountMode : String;
	public var channelInterpretation : String;
	public var numberOfInputs : Float;
	public var numberOfOutputs : Float;
	public function chain(nodes:haxe.extern.Rest<ProcessingNode>):This;
	public function fan(nodes:haxe.extern.Rest<ProcessingNode>):This;
	public function connect(unit:ProcessingNode, ?outputNum:Float, ?inputNum:Float):This;
	public function disconnect(output:haxe.extern.EitherType<Float, ProcessingNode>):This;
	public function dispose():This;
	public function toMaster():This;
}
@:native("Tone.Buffer") extern class Buffer extends Tone {
	public function new(url:haxe.extern.EitherType<AudioBuffer, String>, ?onload:Callback, ?onerror:Callback):Void;
	static public function cancelDownload():Buffer;
	@:overload(function(array:BufferArray):This { })
	static public function fromArray(array:BufferArray):Buffer;
	static public function fromUrl(url:String):Promise<Buffer>;
	@:overload(function(url:String):Promise<This> { })
	static public function load(url:String, onload:Callback, onerror:Callback, onprogress:Callback):XMLHttpRequest;
	static public function supportsType(url:String):Bool;
	public var duration : Float;
	public var length : Float;
	public var numberOfChannels : Float;
	public var reverse : Bool;
	public function dispose():This;
	public function get():AudioBuffer;
	public function getChannelData(channel:Float):Float32Array;
	public function set(buffer:haxe.extern.EitherType<AudioBuffer, Buffer>):This;
	public function slice(start:Tone.Time, ?end:Tone.Time):This;
	public function toArray(?channel:Float):BufferArray;
	public function toMono(?channel:Float):BufferArray;
}
@:native("Tone.Buffers") extern class Buffers extends Tone {
	public function new(urls:haxe.extern.EitherType<Dynamic, Array<String>>, ?callback:Callback):Void;
	public var baseUrl : String;
	public function add(name:String, url:haxe.extern.EitherType<String, haxe.extern.EitherType<Buffer, AudioBuffer>>, ?callback:Callback):This;
	public function dispose():This;
	public function get(name:haxe.extern.EitherType<String, Float>):Buffer;
	public function has(name:haxe.extern.EitherType<String, Float>):Bool;
}
@:native("Tone.Context") extern class Context extends Emitter {
	public function new(?context:AudioContext):Void;
	public var clockSource : haxe.extern.EitherType<String, Tone.Seconds>;
	public var latencyHint : haxe.extern.EitherType<String, Tone.Seconds>;
	public var lookAhead : Float;
	public var updateInterval : Float;
	public function clearTimeout(id:Float):This;
	public function close():Promise<Dynamic>;
	public function createAnalyser():AnalyserNode;
	public function createBiquadFilter():BiquadFilterNode;
	public function createConstantSource():ConstantSourceNode;
	public function createPanner():PannerNode;
	public function createStereoPanner():StereoPannerNode;
	public function getConstant(val:Float):AudioBufferSourceNode;
	public function ready():Promise<Dynamic>;
	public function setTimeout(fn:Callback, timeout:Tone.Seconds):Float;
}
@:native("Tone.OfflineContext") extern class OfflineContext extends Context {
	public function new(channels:Float, duration:Float, sampleRate:Float):Void;
	public function createBufferSource():BufferSource;
	public function render():Promise<AudioBuffer>;
}
@:native("Tone.Delay") extern class Delay extends Tone {
	public function new(?delayTime:Tone.Time, ?maxDelay:Tone.Time):Void;
	public var delayTime : Param<Tone.Time>;
	public var maxDelay : Tone.Time;
	public function dispose():This;
}
@:native("Tone.Clock") extern class Clock extends Emitter {
	public function new(callback:Callback, frequency:Tone.Frequency):Void;
	public var callback : Callback;
	public var frequency : TickSignal<Tone.BPM>;
	public var state : State;
	public function getSecondsAtTime(time:Tone.Time):Tone.Seconds;
	public function getStateAtTime(time:Tone.Time):State;
	public function getTicksAtTime(time:Tone.Time):Tone.Ticks;
	public function nextTickTime(ticks:Tone.Ticks, before:Tone.Time):This;
	public function pause(?time:Tone.Time):This;
	public function setTicksAtTime(ticks:Tone.Ticks, time:Tone.Time):This;
	public function start(?time:Tone.Time, ?offset:Tone.Ticks):This;
	public function stop(?time:Tone.Time):This;
}
@:native("Tone.Emitter") extern class Emitter extends Tone {
	static public function mixin(object:Dynamic):Emitter;
	public function dispose():This;
	public function emit(event:String, args:haxe.extern.Rest<Dynamic>):This;
	public function off(event:String, callback:Callback):This;
	public function on(event:String, callback:Callback):This;
	public function once(event:String, callback:Callback):This;
}
@:native("Tone.GainOptions") interface GainOptions {
	public var gain : Tone.Gain;
	public var convert : Bool;
}
@:native("Tone.Gain") extern class Gain extends Tone {
	public function new(?gain:Tone.Gain, ?units:Unit):Void;
	public var gain : Param<Tone.Gain>;
}
@:native("Tone.Transport") interface Transport {
	public var PPQ : Float;
	public var bpm : Array<Clock>;
	public var loop : Bool;
	public var loopEnd : Tone.Time;
	public var loopStart : Tone.Time;
	public var position : Tone.BarsBeatsSixteenths;
	public var progress : Tone.NormalRange;
	public var seconds : Tone.Seconds;
	public var state : State;
	public var swing : Tone.NormalRange;
	public var swingSubdivision : Tone.Time;
	public var ticks : Tone.Ticks;
	public var timeSignature : haxe.extern.EitherType<Float, Array<Dynamic>>;
	public function cancel(after:Tone.TransportTime):This;
	public function clear(eventId:Float):This;
	public function getSecondsAtTime(time:Tone.Time):Tone.Seconds;
	public function getTicksAtTime(time:Tone.Time):Tone.Ticks;
	public function nextSubdivision(subdivision:Tone.Time):Float;
	public function pause(?time:Tone.Time):This;
	public function schedule(callback:Callback, time:Tone.TransportTime):Float;
	public function scheduleOnce(callback:Callback, time:Tone.TransportTime):Float;
	public function scheduleRepeat(callback:Callback, interval:Tone.Time, ?startTime:Tone.TransportTime, ?duration:Tone.Time):Float;
	public function setLoopPoints(startPosition:Tone.TransportTime, endPosition:Tone.TransportTime):This;
	public function start(?time:Tone.Time, ?offset:Tone.TransportTime):This;
	public function stop(?time:Tone.Time):This;
	public function syncSignal(signal:Signal, ratio:Float):This;
	public function toggle(time:Tone.Time):This;
	public function unsyncSignal(signal:Signal):This;
}
@:native("Tone.TransportEvent") extern class TransportEvent extends Tone {
	public var Transport : Transport;
	public var callback : Callback;
	public var id : Float;
	public var time : Tone.Ticks;
	public function dispose():This;
	public function invoke(time:Tone.Time):Void;
}
@:native("Tone.TransportRepeatEvent") extern class TransportRepeatEvent extends TransportEvent {

}
@:native("Tone.Listener") extern class Listener extends Tone {
	public function new():Void;
	public var forwardX : Float;
	public var forwardY : Float;
	public var forwardZ : Float;
	public var positionX : Float;
	public var positionY : Float;
	public var positionZ : Float;
	public var upX : Float;
	public var upY : Float;
	public var upZ : Float;
	public function dispose():This;
	public function setOrientation(x:Float, y:Float, z:Float, upX:Float, upY:Float, upZ:Float):This;
	public function setPosition(x:Float, y:Float, z:Float):This;
}
@:native("Tone.EventObject") interface EventObject {
	public var time : Tone.Time;
}
@:native("Tone.Timeline") extern class Timeline extends Tone {
	public function new(memory:Tone.Positive):Void;
	public var length : Float;
	public var memory : Tone.Positive;
	public function add<T:(EventObject)>(event:T):This;
	public function cancel(time:Float):This;
	public function cancelBefore(time:Float):This;
	public function dispose():This;
	public function forEach(callback:Callback):This;
	public function forEachAtTime(time:Float, callback:Callback):This;
	public function forEachBefore(time:Float, callback:Callback):This;
	public function forEachBetween(startTime:Float, endTime:Float, callback:Callback):This;
	public function forEachFrom(time:Float, callback:Callback):This;
	public function get(time:Float, comparator:String):Void;
	public function getAfter(time:Float, comparator:String):Void;
	public function getBefore(time:Float, comparator:String):Void;
	public function peek<T:(EventObject)>():T;
	public function previousEvent<T:(EventObject)>(event:T):T;
	public function remove<T:(EventObject)>(event:T):This;
	public function shift<T:(EventObject)>():T;
}
@:native("Tone.TimelineState") extern class TimelineState extends Timeline {
	public function new(initial:String):Void;
	public function getLastState<T:(EventObject)>(state:State, time:Tone.Time):T;
	public function getNextState<T:(EventObject)>(state:State, time:Tone.Time):T;
	public function getValueAtTime(time:Float):String;
	public function setStateAtTime(state:String, time:Float):This;
}
@:native("Tone.Param") extern class Param<E, T> extends AudioNode {
	public function new(param:AudioParam, units:Unit, convert:Bool):Void;
	public var convert : Bool;
	public var units : Tone.Default;
	public var value : T;
	public var minValue : Float;
	public var maxValue : Float;
	public function cancelAndHoldAtTime(time:Tone.Time):This;
	public function cancelScheduledValues(time:Tone.Time):This;
	public function exponentialApproachValueAtTime(value:E, time:Tone.Time, rampTime:Tone.Time):This;
	public function exponentialRampTo(value:E, rampTime:Tone.Time, ?startTime:Tone.Time):This;
	public function exponentialRampToValueAtTime(value:E, endTime:Tone.Time):This;
	public function getValueAtTime(time:Tone.Time):T;
	public function linearRampTo(value:E, rampTime:Tone.Time, ?startTime:Tone.Time):This;
	public function linearRampToValueAtTime(value:E, endTime:Tone.Time):This;
	public function rampTo(value:E, rampTime:Tone.Time, ?startTime:Tone.Time):This;
	public function setRampPoint(?now:Tone.Time):This;
	public function setTargetAtTime(value:E, startTime:Tone.Time, timeConstant:Tone.Time):This;
	public function setValueAtTime(value:E, time:Tone.Time):This;
	public function setValueCurveAtTime(values:ReadonlyArray<E>, startTime:Tone.Time, duration:Tone.Time, ?scaling:Tone.NormalRange):This;
	public function targetRampTo(value:E, rampTime:Tone.Time, ?startTime:Tone.Time):This;
}
@:native("Tone.IntervalTimeline") extern class IntervalTimeline extends Tone {
	public var length : Float;
	public function add<T:(EventObject)>(event:T):This;
	public function cancel(time:Float):This;
	public function dispose():This;
	public function forEach(callback:Callback):This;
	public function forEachAtTime(time:Float, callback:Callback):This;
	public function forEachFrom(time:Float, callback:Callback):This;
	public function get<T:(EventObject)>(event:T):T;
	public function remove<T:(EventObject)>(event:T):This;
}
@:native("Tone.Draw") interface Draw {
	public var anticipation : Float;
	public var expiration : Float;
	public function cancel(?after:Tone.Time):This;
	public function schedule(callback:Callback, time:Tone.Time):This;
}
@:native("Tone.Compressor") extern class Compressor extends AudioNode {
	public function new(?threshold:haxe.extern.EitherType<Tone.Decibels, Dynamic>, ?ratio:Tone.Positive):Void;
	public var attack : Param<Tone.Time>;
	public var knee : Param<Tone.Decibels>;
	public var ratio : Param<Float>;
	public var release : Param<Tone.Time>;
	public var threshold : Param<Tone.Decibels>;
}
@:native("Tone.Gate") extern class Gate extends AudioNode {
	public function new(?threshold:haxe.extern.EitherType<Tone.Decibels, Dynamic>, ?attack:Tone.Time, ?release:Tone.Time):Void;
	public var attack : Array<Follower>;
	public var release : Array<Follower>;
	public var threshold : Array<GreaterThan<Tone.Decibels>>;
}
@:native("Tone.FFT") extern class FFT extends AudioNode {
	public function new(?size:Float):Void;
	public var size : Array<Analyser>;
}
@:native("Tone.Solo") extern class Solo extends AudioNode {
	public var input : Gain;
	public var muted : Bool;
	public var solo : Bool;
}
@:native("Tone.Limiter") extern class Limiter extends AudioNode {
	public function new(threshold:Float):Void;
	public var threshold : Array<Compressor>;
}
@:native("Tone.Mono") extern class Mono extends AudioNode {

}
@:native("Tone.Meter") extern class Meter extends AudioNode {
	public function new(smoother:Float):Void;
	public var smoothing : Float;
	public function getLevel():Tone.Decibels;
	public function getValue():Float;
}
@:native("Tone.Panner") extern class Panner extends AudioNode {
	public function new(?initialPan:Tone.NormalRange):Void;
	public var pan : Array<StereoPannerNode>;
}
@:native("Tone.Envelope") extern class Envelope extends AudioNode {
	public function new(?attack:Tone.Time, ?decay:Tone.Time, ?sustain:Tone.NormalRange, ?release:Tone.Time):Void;
	public var attack : Tone.Time;
	public var attackCurve : EnvelopeCurve;
	public var decay : Tone.Time;
	public var decayCurve : EnvelopeCurve;
	public var release : Tone.Time;
	public var releaseCurve : EnvelopeCurve;
	public var sustain : Tone.NormalRange;
	public var value : Float;
	public function cancel(after:Tone.Time):This;
	public function getValueAtTime(time:Float):Float;
	public function triggerAttack(?time:Tone.Time, ?velocity:Tone.NormalRange):This;
	public function triggerAttackRelease(duration:Tone.Time, ?time:Tone.Time, ?velocity:Tone.NormalRange):This;
	public function triggerRelease(?time:Tone.Time):This;
}
@:native("Tone.CrossFade") extern class CrossFade extends AudioNode {
	public function new(?initialFade:Tone.NormalRange):Void;
	public var a : Gain;
	public var b : Gain;
	public var fade : Signal<Tone.NormalRange>;
}
@:native("Tone.Split") extern class Split extends AudioNode {
	public var left : Gain;
	public var right : Gain;
}
@:native("Tone.LFO") extern class LFO extends AudioNode {
	public function new(?frequency:haxe.extern.EitherType<Tone.Frequency, Dynamic>, ?min:Float, ?max:Float):Void;
	public var amplitude : Array<Oscillator>;
	public var frequency : Array<Oscillator>;
	public var max : Array<Scale>;
	public var min : Array<Scale>;
	public var mute : Bool;
	public var phase : Float;
	public var state : State;
	public var type : Array<Oscillator>;
	public var units : Tone.Default;
	public function start(?time:Tone.Time):This;
	public function stop(?time:Tone.Time):This;
	public function sync():This;
	public function unsync():This;
}
@:native("Tone.EQ3") extern class EQ3 extends AudioNode {
	public function new(?lowLevel:Tone.Decibels, ?midLevel:Tone.Decibels, ?highLevel:Tone.Decibels):Void;
	public var Q : Array<MultibandSplit>;
	public var high : Array<Gain>;
	public var highFrequency : Array<MultibandSplit>;
	public var low : Array<Gain>;
	public var lowFrequency : Array<MultibandSplit>;
	public var mid : Array<Gain>;
}
@:native("Tone.Analyser") extern class Analyser extends AudioNode {
	public function new(?type:AnalysisType, ?size:Float):Void;
	public var size : Float;
	public var smoothing : Array<AnalyserNode>;
	public var type : AnalysisType;
	public function getValue():Float32Array;
}
@:native("Tone.Follower") extern class Follower extends AudioNode {
	public function new(?attack:haxe.extern.EitherType<Tone.Time, Dynamic>, ?release:Tone.Time):Void;
	public var attack : Tone.Time;
	public var release : Tone.Time;
}
@:native("Tone.VolumeOptions") interface VolumeOptions {
	@:optional
	public var volume : Tone.Decibels;
	@:optional
	public var mute : Bool;
}
@:native("Tone.Volume") extern class Volume extends AudioNode {
	@:overload(function(?options:VolumeOptions):Void { })
	public function new(?volume:Tone.Decibels):Void;
	public var mute : Bool;
	public var volume : Array<Gain>;
}
@:native("Tone.Merge") extern class Merge extends AudioNode {
	public var left : Gain;
	public var right : Gain;
}
@:native("Tone.FilterOptions") interface FilterOptions {
	@:optional
	public var type : FilterType;
	@:optional
	public var frequency : Tone.Frequency;
	@:optional
	public var rolloff : FilterRolloff;
	@:optional
	public var Q : Tone.Positive;
	@:optional
	public var gain : Tone.Gain;
}
@:native("Tone.Filter") extern class Filter extends AudioNode {
	@:overload(function(?frequency:Tone.Frequency, ?type:FilterType, ?rolloff:FilterRolloff):Void { })
	public function new(?options:FilterOptions):Void;
	public var Q : Signal<Tone.Positive>;
	public var detune : Signal<Tone.Cents>;
	public var frequency : Signal<Tone.Frequency>;
	public var gain : Signal<Tone.Gain>;
	public var rolloff : FilterRolloff;
	public var type : FilterType;
}
@:native("Tone.Waveform") extern class Waveform extends AudioNode {
	public function new(?size:Float):Void;
	public var size : Float;
	public function getValue():ReadonlyArray<Float>;
}
@:native("Tone.CompressorOptions") interface CompressorOptions {
	@:optional
	public var ratio : Float;
	@:optional
	public var threshold : Float;
	@:optional
	public var release : Float;
	@:optional
	public var attack : Float;
	@:optional
	public var knee : Float;
	@:optional
	public var ratio : Float;
	@:optional
	public var threshold : Float;
	@:optional
	public var release : Float;
	@:optional
	public var attack : Float;
	@:optional
	public var knee : Float;
}
@:native("Tone.MidSideCompressorOptions") interface MidSideCompressorOptions {
	@:optional
	public var mid : CompressorOptions;
	@:optional
	public var side : CompressorOptions;
}
@:native("Tone.MidSideCompressor") extern class MidSideCompressor extends AudioNode {
	public function new(options:MidSideCompressorOptions):Void;
	public var mid : Compressor;
	public var side : Compressor;
}
@:native("Tone.LowpassCombFilter") extern class LowpassCombFilter extends AudioNode {
	public function new(?delayTime:haxe.extern.EitherType<Tone.Time, Dynamic>, ?resonance:Tone.NormalRange, ?dampening:Tone.Frequency):Void;
	public var dampening : Param<Tone.Frequency>;
	public var delayTime : Array<Delay>;
	public var resonance : Array<Gain>;
}
@:native("Tone.PanVol") extern class PanVol extends AudioNode {
	public function new(pan:Tone.AudioRange, volume:Float):Void;
	public var mute : Bool;
	public var pan : Array<Panner>;
	public var volume : Array<Volume>;
}
@:native("Tone.MultibandSplit") extern class MultibandSplit extends AudioNode {
	public function new(?lowFrequency:haxe.extern.EitherType<Tone.Frequency, Dynamic>, ?highFrequency:Tone.Frequency):Void;
	public var Q : Signal<Float>;
	public var high : Filter;
	public var highFrequency : Signal<Tone.Frequency>;
	public var low : Filter;
	public var lowFrequency : Signal<Tone.Frequency>;
	public var mid : Filter;
}
@:native("Tone.FeedbackCombFilter") extern class FeedbackCombFilter extends AudioNode {
	public function new(?delayTime:haxe.extern.EitherType<Tone.Time, Dynamic>, ?resonance:Tone.NormalRange):Void;
	public var delayTime : Array<Delay>;
	public var resonance : Array<Gain>;
}
@:native("Tone.MultibandCompressorOptions") interface MultibandCompressorOptions {
	@:optional
	public var low : CompressorOptions;
	@:optional
	public var mid : CompressorOptions;
	@:optional
	public var high : CompressorOptions;
	@:optional
	public var lowFrequency : Tone.Frequency;
	@:optional
	public var highFrequency : Tone.Frequency;
}
@:native("Tone.MultibandCompressor") extern class MultibandCompressor extends AudioNode {
	public function new(options:MultibandCompressorOptions):Void;
	public var high : Compressor;
	public var highFrequency : Signal<Tone.Frequency>;
	public var low : Compressor;
	public var lowFrequency : Signal<Tone.Frequency>;
	public var mid : Compressor;
}
@:native("Tone.ADSREnvelopeOptions") interface ADSREnvelopeOptions {
	@:optional
	public var attack : Tone.Time;
	@:optional
	public var attackCurve : EnvelopeCurve;
	@:optional
	public var decay : Tone.Time;
	@:optional
	public var decayCurve : EnvelopeCurve;
	@:optional
	public var sustain : Tone.NormalRange;
	@:optional
	public var release : Tone.Time;
	@:optional
	public var releaseCurve : EnvelopeCurve;
}
@:native("Tone.FrequencyEnvelopeOptions") interface FrequencyEnvelopeOptions extends ADSREnvelopeOptions {
	@:optional
	public var baseFrequency : Tone.Frequency;
	@:optional
	public var octaves : Tone.Positive;
	@:optional
	public var exponent : Float;
}
@:native("Tone.FrequencyEnvelope") extern class FrequencyEnvelope extends Envelope {
	@:overload(function(attack:Tone.Time, decay:Tone.Time, sustain:Tone.NormalRange, release:Tone.Time):Void { })
	public function new(options:FrequencyEnvelopeOptions):Void;
	public var baseFrequency : Tone.Frequency;
	public var exponent : Float;
	public var octaves : Tone.Positive;
}
@:native("Tone.ScaledEnvelopeOptions") interface ScaledEnvelopeOptions extends ADSREnvelopeOptions {
	@:optional
	public var min : Float;
	@:optional
	public var max : Float;
	@:optional
	public var exponent : Float;
}
@:native("Tone.ScaledEnvelope") extern class ScaledEnvelope extends Envelope {
	@:overload(function(attack:Tone.Time, decay:Tone.Time, sustain:Tone.NormalRange, release:Tone.Time):Void { })
	public function new(options:FrequencyEnvelopeOptions):Void;
	public var exponent : Float;
	public var max : Float;
	public var min : Float;
}
@:native("Tone.AmplitudeEnvelopeOptions") interface AmplitudeEnvelopeOptions extends ADSREnvelopeOptions {

}
@:native("Tone.AmplitudeEnvelope") extern class AmplitudeEnvelope extends Envelope {
	@:overload(function(?attack:Tone.Time, ?decay:Tone.Time, ?sustain:Tone.NormalRange, ?release:Tone.Time):Void { })
	public function new(options:AmplitudeEnvelopeOptions):Void;
}
@:native("Tone.Panner3D") extern class Panner3D extends AudioNode {
	public function new(positionX:Float, positionY:Float, positionZ:Float):Void;
	public var coneInnerAngle : Tone.Degrees;
	public var coneOuterAngle : Tone.Degrees;
	public var coneOuterGain : Gain;
	public var distanceModel : DistanceModel;
	public var maxDistance : Tone.Positive;
	public var orientationX : Float;
	public var orientationY : Float;
	public var orientationZ : Float;
	public var panningModel : PanningModel;
	public var positionX : Float;
	public var positionY : Float;
	public var positionZ : Float;
	public var refDistance : Float;
	public var rolloffFactor : Float;
	public function setOrientation(x:Float, y:Float, z:Float):This;
	public function setPosition(x:Float, y:Float, z:Float):This;
}
@:native("Tone.MidSideMerge") extern class MidSideMerge extends AudioNode {
	public var mid : Gain;
	public var side : Gain;
}
@:native("Tone.MidSideSplit") extern class MidSideSplit extends AudioNode {
	public var mid : Multiply;
	public var side : Multiply;
}
@:native("Tone.InstrumentOptions") interface InstrumentOptions {
	public var volume : Tone.Decibels;
}
@:native("Tone.Instrument") extern class Instrument<O> extends AudioNode {
	public function new(?opts:O):Void;
	public var volume : Array<Volume>;
	public function sync():This;
	public function triggerAttackRelease(note:Tone.Frequency, duration:Tone.Time, ?time:Tone.Time, ?velocity:Tone.NormalRange):This;
	public function unsync():This;
}
@:native("Tone.Monophonic") extern class Monophonic<O> extends Instrument<O> {
	public var portamento : Tone.Time;
	public function getLevelAtTime(time:Tone.Time):Tone.NormalRange;
	public function setNote(note:Tone.Frequency, ?time:Tone.Time):This;
	public function triggerAttack(note:Tone.Frequency, ?time:Tone.Time, ?velocity:Float):This;
	public function triggerRelease(?time:Tone.Time):This;
}
@:native("Tone.NoiseSynthOptions") interface NoiseSynthOptions {
	public var noise : { public var type : NoiseType; };
	@:optional
	public var envelope : ADSREnvelopeOptions;
}
@:native("Tone.NoiseSynth") extern class NoiseSynth extends Instrument {
	public function new(options:NoiseSynthOptions):Void;
	public var envelope : AmplitudeEnvelope;
	public var noise : Noise;
	public function triggerAttack(note:Tone.Frequency, ?time:Tone.Time, ?velocity:Float):This;
	public function triggerRelease(?time:Tone.Time):This;
}
@:native("Tone.OscillatorOptions") interface OscillatorOptions<T> {
	@:optional
	public var type : T;
	@:optional
	public var modulationType : T;
	@:optional
	public var modulationIndex : Float;
	@:optional
	public var harmonicity : Float;
}
@:native("Tone.SynthOptions") interface SynthOptions {
	@:optional
	public var oscillator : OscillatorOptions<OscillatorType>;
	@:optional
	public var envelope : ADSREnvelopeOptions;
}
@:native("Tone.Synth") extern class Synth extends Monophonic<SynthOptions> {
	public var detune : Array<OmniOscillator>;
	public var envelope : AmplitudeEnvelope;
	public var frequency : Array<OmniOscillator>;
	public var oscillator : OmniOscillator;
}
@:native("Tone.AMSynthOptions") interface AMSynthOptions {
	@:optional
	public var harmonicity : Tone.Positive;
	@:optional
	public var detune : Tone.Cents;
	@:optional
	public var oscillator : OscillatorOptions;
	@:optional
	public var envelope : ADSREnvelopeOptions;
	@:optional
	public var modulation : OscillatorOptions;
	@:optional
	public var modulationEnvelope : ADSREnvelopeOptions;
}
@:native("Tone.AMSynth") extern class AMSynth extends Monophonic<AMSynthOptions> {
	public var detune : Signal<Tone.Cents>;
	public var envelope : Array<Synth>;
	public var frequency : Signal<Tone.Frequency>;
	public var harmonicity : Multiply<Tone.Positive>;
	public var modulation : Oscillator;
	public var modulationEnvelope : AmplitudeEnvelope;
	public var oscillator : OmniOscillator;
}
@:native("Tone.MonoSynthOptions") interface MonoSynthOptions {
	@:optional
	public var frequency : Tone.Frequency;
	@:optional
	public var detune : Tone.Cents;
	@:optional
	public var oscillator : OscillatorOptions;
	@:optional
	public var filter : FilterOptions;
	@:optional
	public var envelope : ADSREnvelopeOptions;
	@:optional
	public var filterEnvelope : FrequencyEnvelopeOptions;
}
@:native("Tone.MonoSynth") extern class MonoSynth extends Monophonic<MonoSynthOptions> {
	public var detune : Array<OmniOscillator>;
	public var envelope : AmplitudeEnvelope;
	public var frequency : Array<OmniOscillator>;
	public var filter : Filter;
	public var filterEnvelope : FrequencyEnvelope;
	public var oscillator : OmniOscillator;
}
@:native("Tone.VoiceOptions") interface VoiceOptions {
	@:optional
	public var volume : Tone.Decibels;
	@:optional
	public var portamento : Float;
	@:optional
	public var oscillator : OscillatorOptions;
	@:optional
	public var filterEnvelope : ADSREnvelopeOptions;
	@:optional
	public var envelope : ADSREnvelopeOptions;
}
@:native("Tone.DuoSynthOptions") interface DuoSynthOptions {
	@:optional
	public var vibratoAmount : Tone.Positive;
	@:optional
	public var vibratoRate : Tone.Frequency;
	@:optional
	public var harmonicity : Tone.Positive;
}
@:native("Tone.DuoSynth") extern class DuoSynth extends Monophonic<DuoSynthOptions> {
	public var frequency : Signal<Tone.Frequency>;
	public var harmonicity : Multiply<Tone.Positive>;
	public var vibratoAmount : Array<Gain>;
	public var vibratoRate : Array<LFO>;
	public var voice0 : MonoSynth;
	public var voice1 : MonoSynth;
}
@:native("Tone.SamplesObject") interface SamplesObject {

}
@:native("Tone.Sampler") extern class Sampler extends Instrument {
	public function new(samples:SamplesObject, ?onload:Callback, ?baseUrl:String):Void;
	public var attack : Tone.Time;
	public var release : Tone.Time;
	public function add(note:haxe.extern.EitherType<Tone.Note, Tone.MIDI>, url:haxe.extern.EitherType<String, haxe.extern.EitherType<Buffer, AudioBuffer>>, ?callback:Callback):Void;
	public function releaseAll(?time:Tone.Time):This;
	public function triggerAttack(note:Tone.Frequency, ?time:Tone.Time, ?velocity:Float):This;
	public function triggerRelease(?time:Tone.Time):This;
}
@:native("Tone.FMSynthOptions") interface FMSynthOptions {
	@:optional
	public var harmonicity : Tone.Positive;
	@:optional
	public var modulationIndex : Tone.Positive;
	@:optional
	public var detune : Tone.Cents;
	@:optional
	public var oscillator : OscillatorOptions;
	@:optional
	public var envelope : ADSREnvelopeOptions;
	@:optional
	public var modulation : ModulationOptions;
	@:optional
	public var modulationEnvelope : ADSREnvelopeOptions;
}
@:native("Tone.FMSynth") extern class FMSynth extends Monophonic<FMSynthOptions> {
	public var detune : Signal<Tone.Cents>;
	public var envelope : Array<Synth>;
	public var frequency : Signal<Tone.Frequency>;
	public var harmonicity : Multiply<Tone.Positive>;
	public var modulation : Array<Synth>;
	public var modulationEnvelope : Array<Synth>;
	public var modulationIndex : Multiply<Tone.Positive>;
	public var oscillator : Array<Synth>;
}
@:native("Tone.PluckSynthOptions") interface PluckSynthOptions {
	@:optional
	public var attackNoise : Float;
	@:optional
	public var dampening : Tone.Frequency;
	@:optional
	public var resonance : Tone.NormalRange;
}
@:native("Tone.PluckSynth") extern class PluckSynth extends Instrument {
	public function new(?options:PluckSynthOptions):Void;
	public var attackNoise : Float;
	public var dampening : Array<LowpassCombFilter>;
	public var resonance : Array<LowpassCombFilter>;
	public function triggerAttack(note:Tone.Frequency, ?time:Tone.Time):This;
}
@:native("Tone.MetalSynthOptions") interface MetalSynthOptions {
	@:optional
	public var frequency : Tone.Frequency;
	@:optional
	public var harmonicity : Tone.Positive;
	@:optional
	public var modulationIndex : Tone.Positive;
	@:optional
	public var resonance : Tone.NormalRange;
	@:optional
	public var octaves : Float;
}
@:native("Tone.MetalSynth") extern class MetalSynth extends Instrument {
	public function new(?options:MetalSynthOptions):Void;
	public var envelope : Envelope;
	public var frequency : Signal<Tone.Frequency>;
	public var harmonicity : Array<FMOscillator>;
	public var modulationIndex : Array<FMOscillator>;
	public var octaves : Float;
	public var resonance : Array<Scale>;
	public function triggerAttack(note:Tone.Frequency, ?time:Tone.Time, ?velocity:Float):This;
	public function triggerRelease(?time:Tone.Time):This;
}
@:native("Tone.PolySynthOptions") interface PolySynthOptions {
	@:optional
	public var polyphony : Float;
	@:optional
	public var volume : Tone.Decibels;
	@:optional
	public var detune : Tone.Cents;
	@:optional
	public var voice : Dynamic;
}
@:native("Tone.PolySynth") extern class PolySynth<T:(Instrument)> extends Instrument {
	@:overload(function(?polyphony:Float, ?voice:Dynamic):Void { })
	public function new(?options:PolySynthOptions):Void;
	public var detune : Signal<Tone.Cents>;
	public var voices : ReadonlyArray<T>;
	public function get(?params:haxe.extern.EitherType<String, Array<String>>):ReadonlyArray<Dynamic>;
	public function releaseAll(?time:Tone.Time):This;
	@:overload(function(params:String, value:Dynamic, ?rampTime:Tone.Time):This { })
	public function set(attributes:Dynamic):This;
	public function triggerAttack(notes:Array<Tone.Frequency>, ?time:Tone.Time, ?velocity:Float):This;
	public function triggerRelease(notes:Array<Tone.Frequency>, ?time:Tone.Time):This;
}
@:native("Tone.MembraneSynthOptions") interface MembraneSynthOptions {
	@:optional
	public var pitchDecay : Tone.Time;
	@:optional
	public var octaves : Tone.Positive;
	@:optional
	public var oscillator : OscillatorOptions;
	@:optional
	public var envelope : ADSREnvelopeOptions;
}
@:native("Tone.MembraneSynth") extern class MembraneSynth extends Instrument<MembraneSynthOptions> {
	public var envelope : AmplitudeEnvelope;
	public var octaves : Float;
	public var oscillator : OmniOscillator;
	public var pitchDecay : Tone.Time;
	public function triggerAttack(note:Tone.Frequency, ?time:Tone.Time, ?velocity:Float):This;
	public function triggerRelease(?time:Tone.Time):This;
}
@:native("Tone.Event") extern class Event extends Tone {
	public function new(callback:Callback, value:Dynamic):Void;
	public var callback : Callback;
	public var loop : haxe.extern.EitherType<Bool, Float>;
	public var loopEnd : Tone.Time;
	public var loopStart : Tone.Time;
	public var mute : Bool;
	public var playbackRate : Float;
	public var probability : Tone.NormalRange;
	public var progress : Tone.NormalRange;
	public var state : haxe.extern.EitherType<String, String>;
	public function cancel(?time:Tone.TransportTime):This;
	public function start(time:Tone.TransportTime):This;
	public function stop(time:Tone.TransportTime):This;
}
@:native("Tone.TimeEventObject") interface TimeEventObject {
	public var time : Tone.Time;
	public var note : Tone.Note;
	@:optional
	public var dur : Tone.Note;
	@:optional
	public var velocity : Float;
}
@:native("Tone.Part") extern class Part extends Event {
	public function new(callback:Callback<Array<Dynamic>>, events:ReadonlyArray<haxe.extern.EitherType<TimeEventPair, TimeEventObject>>):Void;
	public var length : Tone.Positive;
	public function add(time:Tone.Time, value:Dynamic):This;
	public function at(time:Tone.TransportTime, ?value:Dynamic):Event;
}
@:native("Tone.Sequence") extern class Sequence<T> extends Part {
	public function new(callback:SequenceCallback<T>, events:ReadonlyArray<T>, subdivision:Tone.Time):Void;
	public var subdivision : Tone.Time;
}
@:native("Tone.Loop") extern class Loop extends Tone {
	public function new(callback:Callback<Array<Dynamic>>, interval:Tone.Time):Void;
	public var callback : Callback;
	public var humanize : haxe.extern.EitherType<Bool, Tone.Time>;
	public var interval : Tone.Time;
	public var iterations : Tone.Positive;
	public var mute : Bool;
	public var playbackRate : Float;
	public var probability : Tone.NormalRange;
	public var progress : Tone.NormalRange;
	public var state : haxe.extern.EitherType<String, String>;
	public function cancel(?time:Tone.TransportTime):This;
	public function start(time:Tone.TransportTime):This;
	public function stop(time:Tone.TransportTime):This;
}
@:native("Tone.Pattern") extern class Pattern extends Loop {
	public function new(callback:Callback, values:ReadonlyArray<Tone.Note>):Void;
	public var index : Tone.Positive;
	public var pattern : ControlPattern;
	public var value : Tone.Note;
}
@:native("Tone.EffectOptions") interface EffectOptions {
	@:optional
	public var wet : Tone.NormalRange;
}
@:native("Tone.Effect") extern class Effect extends AudioNode {
	@:overload(function(?options:EffectOptions):Void { })
	public function new(?wet:Tone.NormalRange):Void;
	public var wet : Array<CrossFade>;
}
@:native("Tone.StereoEffect") extern class StereoEffect extends Effect {

}
@:native("Tone.FeedbackEffectOptions") interface FeedbackEffectOptions {
	@:optional
	public var feedback : Tone.NormalRange;
}
@:native("Tone.FeedbackEffect") extern class FeedbackEffect extends Effect {
	@:overload(function(?options:FeedbackEffectOptions):Void { })
	public function new(?feedback:Tone.NormalRange):Void;
	public var feedback : Array<Gain>;
}
@:native("Tone.StereoFeedbackEffect") extern class StereoFeedbackEffect extends StereoEffect {
	public var feedback : Signal<Tone.NormalRange>;
}
@:native("Tone.StereoXFeedbackEffect") extern class StereoXFeedbackEffect extends StereoEffect {
	public var feedback : Signal<Tone.NormalRange>;
}
@:native("Tone.MidSideEffect") extern class MidSideEffect extends Effect {

}
@:native("Tone.ChorusOptions") interface ChorusOptions {
	@:optional
	public var frequency : Tone.Frequency;
	@:optional
	public var delayTime : Tone.Milliseconds;
	@:optional
	public var depth : Tone.NormalRange;
	@:optional
	public var type : BasicOscillatorType;
	@:optional
	public var spread : Tone.Degrees;
}
@:native("Tone.Chorus") extern class Chorus extends StereoEffect {
	@:overload(function(?frequency:Tone.Frequency, ?delayTime:Tone.Milliseconds, ?depth:Tone.NormalRange):Void { })
	public function new(?options:ChorusOptions):Void;
	public var delayTime : Tone.Milliseconds;
	public var depth : Tone.NormalRange;
	public var frequency : Tone.Frequency;
	public var spread : Tone.Degrees;
	public var type : BasicOscillatorType;
}
@:native("Tone.AutoPannerOptions") interface AutoPannerOptions {
	@:optional
	public var depth : Tone.NormalRange;
	@:optional
	public var frequency : Tone.Frequency;
	@:optional
	public var type : BasicOscillatorType;
}
@:native("Tone.AutoPanner") extern class AutoPanner extends Effect {
	@:overload(function(?frequency:Tone.Frequency):Void { })
	public function new(?options:AutoPannerOptions):Void;
	public var depth : Array<LFO>;
	public var frequency : Array<LFO>;
	public var type : BasicOscillatorType;
	public function start(?time:Tone.Time):This;
	public function stop(?time:Tone.Time):This;
	public function sync(?delay:Tone.Time):This;
	public function unsync():This;
}
@:native("Tone.FollowerOptions") interface FollowerOptions {
	@:optional
	public var attack : Tone.Time;
	@:optional
	public var release : Tone.Time;
}
@:native("Tone.AutoWahOptions") interface AutoWahOptions {
	@:optional
	public var baseFrequency : Tone.Frequency;
	@:optional
	public var octaves : Tone.Positive;
	@:optional
	public var sensitivity : Tone.Decibels;
	@:optional
	public var Q : Tone.Positive;
	@:optional
	public var gain : Float;
	@:optional
	public var follower : FollowerOptions;
}
@:native("Tone.AutoWah") extern class AutoWah extends Effect {
	@:overload(function(?baseFrequency:Tone.Frequency, ?octaves:Tone.Positive, ?sensitivity:Tone.Decibels):Void { })
	public function new(?options:AutoWahOptions):Void;
	public var Q : Array<Filter>;
	public var baseFrequency : Tone.Frequency;
	public var gain : Array<Filter>;
	public var octaves : Tone.Positive;
	public var sensitivity : Tone.Decibels;
}
@:native("Tone.PitchShift") extern class PitchShift extends FeedbackEffect {
	public function new(?pitch:Tone.Interval):Void;
	public var delayTime : Array<FeedbackDelay>;
	public var pitch : Tone.Interval;
	public var windowSize : Tone.Time;
}
@:native("Tone.StereoWidenerOptions") interface StereoWidenerOptions {
	public var width : Tone.NormalRange;
}
@:native("Tone.StereoWidener") extern class StereoWidener extends MidSideEffect {
	@:overload(function(?width:Tone.NormalRange):Void { })
	public function new(?options:StereoWidenerOptions):Void;
	public var width : Signal<Tone.NormalRange>;
}
@:native("Tone.Tremolo") extern class Tremolo extends StereoEffect {
	public function new(?frequency:Tone.Frequency, ?depth:Tone.NormalRange):Void;
	public var depth : Signal<Tone.NormalRange>;
	public var frequency : Signal<Tone.Frequency>;
	public var spread : Tone.Degrees;
	public var type : BasicOscillatorType;
	public function start(?time:Tone.Time):This;
	public function stop(?time:Tone.Time):This;
	public function sync(?delay:Tone.Time):This;
	public function unsync():This;
}
@:native("Tone.PingPongDelayOptions") interface PingPongDelayOptions {
	@:optional
	public var delayTime : Tone.Time;
	@:optional
	public var maxDelayTime : Tone.NormalRange;
	@:optional
	public var feedback : Tone.NormalRange;
}
@:native("Tone.PingPongDelay") extern class PingPongDelay extends StereoXFeedbackEffect {
	@:overload(function(?delayTime:Tone.Time, ?feedback:Tone.NormalRange):Void { })
	public function new(?options:PingPongDelayOptions):Void;
	public var delayTime : Signal<Tone.Time>;
}
@:native("Tone.ConvolverOptions") interface ConvolverOptions {
	@:optional
	public var url : haxe.extern.EitherType<String, Buffer>;
	@:optional
	public var onload : Callback;
}
@:native("Tone.Convolver") extern class Convolver extends Effect {
	@:overload(function(?url:haxe.extern.EitherType<String, Buffer>, ?onload:Callback):Void { })
	public function new(?options:ConvolverOptions):Void;
	public var buffer : AudioBuffer;
	public function load(url:String, ?callback:Callback):Promise<This>;
}
@:native("Tone.ChebyShevOptions") interface ChebyShevOptions {
	@:optional
	public var order : Tone.Positive;
	@:optional
	public var oversample : OverSampleType;
}
@:native("Tone.ChebyShev") extern class ChebyShev extends Effect {
	@:overload(function(?order:Tone.Positive):Void { })
	public function new(?options:ChebyShevOptions):Void;
	public var order : Tone.Positive;
	public var oversample : OversamplingType;
}
@:native("Tone.Vibrato") extern class Vibrato extends Effect {
	public function new(frequency:Tone.Frequency, depth:Tone.NormalRange):Void;
	public var depth : Array<LFO>;
	public var frequency : Array<LFO>;
	public var type : BasicOscillatorType;
}
@:native("Tone.BitCrusher") extern class BitCrusher extends Effect {
	public function new(bits:Float):Void;
	public var bits : Float;
}
@:native("Tone.Reverb") extern class Reverb extends Convolver {
	public function new(?decay:Tone.Time):Void;
	public var decay : Tone.Time;
	public var preDelay : Tone.Time;
	public function generate():Promise<This>;
}
@:native("Tone.DistortionOptions") interface DistortionOptions {
	@:optional
	public var distortion : Tone.NormalRange;
	@:optional
	public var oversample : OversamplingType;
}
@:native("Tone.Distortion") extern class Distortion extends Effect {
	@:overload(function(?distortion:Tone.NormalRange):Void { })
	public function new(?object:DistortionOptions):Void;
	public var distortion : Tone.NormalRange;
	public var oversample : OversamplingType;
}
@:native("Tone.JCReverbOptions") interface JCReverbOptions {
	public var roomSize : Tone.NormalRange;
}
@:native("Tone.JCReverb") extern class JCReverb extends Effect {
	@:overload(function(?roomSize:Tone.NormalRange):Void { })
	public function new(?object:JCReverbOptions):Void;
	public var roomSize : Signal<Tone.NormalRange>;
}
@:native("Tone.FreeverbOptions") interface FreeverbOptions {
	@:optional
	public var roomSize : Tone.NormalRange;
	@:optional
	public var dampening : Tone.Frequency;
}
@:native("Tone.Freeverb") extern class Freeverb extends Effect {
	@:overload(function(?roomSize:Tone.NormalRange, ?dampening:Tone.Frequency):Void { })
	public function new(?object:FreeverbOptions):Void;
	public var dampening : Signal<Tone.Frequency>;
	public var roomSize : Signal<Tone.NormalRange>;
}
@:native("Tone.AutoFilterOptions") interface AutoFilterOptions {
	@:optional
	public var frequency : Tone.Frequency;
	@:optional
	public var type : BasicOscillatorType;
	@:optional
	public var depth : Tone.NormalRange;
	@:optional
	public var baseFrequency : Tone.Frequency;
	@:optional
	public var octaves : Tone.Positive;
	@:optional
	public var filter : FilterOptions;
}
@:native("Tone.AutoFilter") extern class AutoFilter extends Effect {
	@:overload(function(?frequency:Tone.Frequency, ?baseFrequency:Tone.Frequency, ?octaves:Tone.Positive):Void { })
	public function new(?object:AutoFilterOptions):Void;
	public var depth : Array<LFO>;
	public var filter : Filter;
	public var frequency : Array<LFO>;
	public var min : Tone.Frequency;
	public var octaves : Tone.Positive;
	public var type : BasicOscillatorType;
	public function start(?time:Tone.Time):This;
	public function stop(?time:Tone.Time):This;
	public function sync(?delay:Tone.Time):This;
	public function unsync():This;
}
@:native("Tone.FeedbackDelayOptions") interface FeedbackDelayOptions {
	public var delayTime : Tone.Time;
	public var maxDelay : Tone.NormalRange;
}
@:native("Tone.FeedbackDelay") extern class FeedbackDelay extends FeedbackEffect {
	@:overload(function(?delayTime:Tone.Time, ?feedback:Tone.NormalRange):Void { })
	public function new(?object:FeedbackDelayOptions):Void;
	public var delayTime : Array<Delay>;
}
@:native("Tone.PhaserOptions") interface PhaserOptions {
	public var frequency : Tone.Frequency;
	public var octaves : Tone.Positive;
	public var stages : Float;
	public var Q : Tone.Positive;
	public var baseFrequency : Tone.Frequency;
}
@:native("Tone.Phaser") extern class Phaser extends StereoEffect {
	@:overload(function(?frequency:Tone.Frequency, ?octaves:Tone.Positive, ?baseFrequency:Tone.Frequency):Void { })
	public function new(?object:PhaserOptions):Void;
	public var Q : Signal<Tone.Positive>;
	public var baseFrequency : Tone.Frequency;
	public var frequency : Array<LFO>;
	public var octaves : Tone.Positive;
}
@:native("Tone.CtrlPattern") extern class CtrlPattern<T> extends Tone {
	public function new(values:ReadonlyArray<T>, ?type:ControlPattern):Void;
	public var index : Float;
	public var type : ControlPattern;
	public var value : T;
	public var values : ReadonlyArray<T>;
	public function next():T;
}
@:native("Tone.MarkovWeightedState") interface MarkovWeightedState {
	public var value : String;
	public var probability : Float;
}
@:native("Tone.ControlMarkovValues") interface ControlMarkovValues {

}
@:native("Tone.CtrlMarkov") extern class CtrlMarkov extends Tone {
	public function new(values:ControlMarkovValues):Void;
	public var value : String;
	public var values : ControlMarkovValues;
	public function next():String;
}
@:native("Tone.CtrlRandom") extern class CtrlRandom extends Tone {
	public function new(min:haxe.extern.EitherType<Float, Tone.Time>, max:haxe.extern.EitherType<Float, Tone.Time>):Void;
	public var integer : Bool;
	public var max : haxe.extern.EitherType<Float, Tone.Time>;
	public var min : haxe.extern.EitherType<Float, Tone.Time>;
	public var value : haxe.extern.EitherType<Float, Tone.Time>;
}
@:native("Tone.CtrlInterpolate") extern class CtrlInterpolate<T> extends Tone {
	public function new(values:ReadonlyArray<T>, index:Tone.Positive):Void;
	public var index : Tone.Positive;
	public var value : T;
	public var values : ReadonlyArray<T>;
}
@:native("Tone.Source") extern class Source extends AudioNode {
	public var fadeIn : Tone.Time;
	public var fadeOut : Tone.Time;
	public var mute : Bool;
	public var state : State;
	public var volume : Array<Volume>;
	public function start(?time:Tone.Time):This;
	public function stop(?time:Tone.Time):This;
	public function sync():This;
	public function unsync():This;
}
@:native("Tone.NoiseOptions") interface NoiseOptions {
	@:optional
	public var type : NoiseType;
	@:optional
	public var playbackRate : Float;
}
@:native("Tone.Noise") extern class Noise extends Source {
	@:overload(function(?options:NoiseOptions):Void { })
	public function new(type:NoiseType):Void;
	public var type : NoiseType;
	public function restart(?time:Tone.Time):Void;
}
@:native("Tone.TickSource") extern class TickSource extends Tone {
	public function new(frequency:Tone.Frequency):Void;
	public var frequency : TickSignal<Tone.Frequency>;
	public var seconds : Tone.Seconds;
	public var state : State;
	public var ticks : Tone.Ticks;
	public function cancel(?time:Tone.Time):This;
	public function forEachTickBetween(startTime:Tone.Time, endTime:Tone.Time, callback:Callback):This;
	public function getSecondsAtTime(time:Tone.Time):Tone.Seconds;
	public function getStateAtTime(time:Tone.Time):State;
	public function getTicksAtTime(time:Tone.Time):Tone.Ticks;
	public function getTimeOfTick(ticks:Tone.Ticks, ?before:Tone.Time):Tone.Time;
	public function pause(?time:Tone.Time):This;
	public function setTicksAtTime(ticks:Tone.Ticks, time:Tone.Time):This;
	public function start(?time:Tone.Time, ?offset:Tone.Ticks):This;
	public function stop(?time:Tone.Time):This;
}
@:native("Tone.Player") extern class Player extends Source {
	public function new(url:haxe.extern.EitherType<String, AudioBuffer>, ?onload:Callback):Void;
	public var autostart : Bool;
	public var buffer : Buffer;
	public var loop : Bool;
	public var loopEnd : Tone.Time;
	public var loopStart : Tone.Time;
	public var playbackRate : Float;
	public var position : Float;
	public var reverse : Bool;
	public function load(url:String, ?callback:Callback):Promise<This>;
	public function restart(?startTime:Tone.Time, ?offset:Tone.Time, ?duration:Tone.Time):This;
	public function seek(offset:Tone.Time, ?time:Tone.Time):This;
	public function setLoopPoints(loopStart:Tone.Time, loopEnd:Tone.Time):This;
}
@:native("Tone.BufferSource") extern class BufferSource extends AudioNode {
	public function new(buffer:haxe.extern.EitherType<AudioBuffer, Buffer>, onload:Callback):Void;
	public var buffer : Buffer;
	public var curve : FadeCurve;
	public var fadeIn : Tone.Time;
	public var fadeOut : Tone.Time;
	public var loop : Bool;
	public var loopEnd : Tone.Time;
	public var loopStart : Tone.Time;
	public var onended : Callback;
	public var playbackRate : Param<Tone.Positive>;
	public var state : State;
	public function cancelStop():This;
	public function getStateAtTime(time:Tone.Time):State;
	public function start(?startTime:Tone.Time, ?offset:Tone.Time, ?duration:Tone.Time, ?gain:Tone.Gain, ?fadeInTime:Tone.Time):This;
	public function stop(?time:Tone.Time, ?fadeOutTime:Tone.Time):This;
}
@:native("Tone.Oscillator") extern class Oscillator extends Source {
	public function new(?frequency:Tone.Frequency, ?type:BasicOscillatorType):Void;
	public var detune : Signal<Tone.Cents>;
	public var frequency : Signal<Tone.Frequency>;
	public var partials : ReadonlyArray<Tone.Frequency>;
	public var phase : Tone.Degrees;
	public var type : OscillatorType;
	public function restart(?time:Tone.Time):This;
	public function syncFrequency():This;
	public function unsyncFrequency():This;
}
@:native("Tone.FatOscillator") extern class FatOscillator extends Source {
	public function new(frequency:Tone.Frequency, type:BasicOscillatorType, modulationType:BasicOscillatorType):Void;
	public var count : Float;
	public var detune : Signal<Tone.Cents>;
	public var frequency : Signal<Tone.Frequency>;
	public var partials : ReadonlyArray<Tone.Frequency>;
	public var phase : Tone.Degrees;
	public var spread : Tone.Cents;
	public var type : OscillatorType;
}
@:native("Tone.URLMap") interface URLMap {

}
@:native("Tone.PlayersOptions") interface PlayersOptions {
	public var urls : URLMap;
	@:optional
	public var volume : Tone.Decibels;
	@:optional
	public var mute : Bool;
	@:optional
	public var onload : Callback;
	@:optional
	public var fadeIn : Float;
	@:optional
	public var fadeOut : Float;
}
@:native("Tone.Players") extern class Players extends AudioNode {
	@:overload(function(urls:URLMap, ?onload:Callback):Void { })
	public function new(?options:PlayersOptions):Void;
	public var state : State;
	public var volume : Array<Volume>;
	public function add(name:String, url:BufferURL, callback:Callback):Void;
	public function get(name:String):Player;
	public function has(name:String):Bool;
	public function stopAll(?time:Tone.Time):This;
}
@:native("Tone.PWMOscillator") extern class PWMOscillator extends Source {
	public function new(frequency:Tone.Frequency, ?modulationFrequency:Tone.Frequency):Void;
	public var detune : Array<Oscillator>;
	public var frequency : Array<Oscillator>;
	public var modulationFrequency : Array<PulseOscillator>;
	public var phase : Array<Oscillator>;
	public var type : String;
}
@:native("Tone.AMOscillator") extern class AMOscillator extends Oscillator {
	public function new(frequency:Tone.Frequency, type:BasicOscillatorType, modulationType:BasicOscillatorType):Void;
	public var harmonicity : Multiply<Tone.Positive>;
	public var modulationType : Array<Oscillator>;
}
@:native("Tone.OscillatorNode") extern class OscillatorNode extends AudioNode {
	public function new(buffer:haxe.extern.EitherType<AudioBuffer, Buffer>, onload:Callback):Void;
	public var detune : Param<Tone.Cents>;
	public var frequency : Param<Tone.Frequency>;
	public var onended : Callback;
	public var state : State;
	public var type : BasicOscillatorType;
	public function cancelStop():This;
	public function getStateAtTime(time:Tone.Time):State;
	public function setPeriodicWave(periodicWave:PeriodicWave):This;
	public function start(?time:Tone.Time):This;
	public function stop(?time:Tone.Time):This;
}
@:native("Tone.PulseOscillator") extern class PulseOscillator extends Source {
	public function new(frequency:Tone.Frequency, width:Tone.NormalRange):Void;
	public var detune : Array<Oscillator>;
	public var frequency : Array<Oscillator>;
	public var phase : Array<Oscillator>;
	public var type : String;
	public var width : Signal<Tone.NormalRange>;
}
@:native("Tone.FMOscillator") extern class FMOscillator extends Source {
	public var detune : Array<Oscillator>;
	public var frequency : Array<Oscillator>;
	public var harmonicity : Multiply<Tone.Positive>;
	public var modulationIndex : Multiply<Tone.Positive>;
	public var modulationType : Array<Oscillator>;
	public var partials : Array<Oscillator>;
	public var phase : Array<Oscillator>;
	public var type : Array<Oscillator>;
}
@:native("Tone.OmniOscillator") extern class OmniOscillator extends Source {
	public function new(frequency:Tone.Frequency, type:OscillatorType):Void;
	public var count : Array<FatOscillator>;
	public var detune : Signal<Tone.Cents>;
	public var frequency : Signal<Tone.Frequency>;
	public var harmonicity : haxe.extern.EitherType<Array<FMOscillator>, Array<AMOscillator>>;
	public var modulationFrequency : Array<PWMOscillator>;
	public var modulationType : haxe.extern.EitherType<Array<FMOscillator>, Array<AMOscillator>>;
	public var partials : ReadonlyArray<Tone.Frequency>;
	public var phase : Array<Oscillator>;
	public var spread : Array<FatOscillator>;
	public var type : OscillatorType;
	public var width : Array<PulseOscillator>;
	public function restart(?time:Tone.Time):This;
	@:overload(function(key:String, value:Float, rampTime:Tone.Time):This { })
	public function set(params:Dynamic):This;
}
@:native("Tone.GrainPlayer") extern class GrainPlayer extends Source {
	public function new(url:haxe.extern.EitherType<String, Buffer>, ?callback:Callback):Void;
	public var buffer : Buffer;
	public var detune : Tone.Cents;
	public var grainSize : Tone.Time;
	public var loop : Bool;
	public var loopEnd : Tone.Time;
	public var loopStart : Tone.Time;
	public var overlap : Tone.Time;
	public var playbackRate : Tone.Positive;
	public var reverse : Bool;
	public function seek(offset:Tone.Time, ?time:Tone.Time):This;
}
@:native("Tone.UserMedia") extern class UserMedia extends AudioNode {
	public function new(?volume:Tone.Decibels):Void;
	static public function enumerateDevices():Promise<ReadonlyArray<MediaDeviceInfo>>;
	public var deviceId : String;
	public var groupId : String;
	public var label : String;
	public var mute : Bool;
	public var state : State;
	static public var supported : Bool;
	public var volume : Array<Volume>;
	public function close():This;
	public function open(labelOrId:haxe.extern.EitherType<String, Float>):Promise<MediaStream>;
}
@:native("Tone.SignalBase") extern class SignalBase extends Tone {
	public function connect(node:haxe.extern.EitherType<ProcessingNode, haxe.extern.EitherType<Signal, SignalBase>>, ?outputNumber:Float, ?inputNumber:Float):This;
}
@:native("Tone.SignalOptions") interface SignalOptions<E> {
	public var value : E;
	public var units : Unit;
	public var convert : Bool;
}
@:native("Tone.Signal") extern class Signal<E, T> extends Param<E, T> {
	public function new(?value:haxe.extern.EitherType<E, AudioParam>, ?units:Unit):Void;
}
@:native("Tone.Add") extern class Add<E, T> extends Signal<E, T> {
	public function new(?value:Float):Void;
}
@:native("Tone.Multiply") extern class Multiply<E, T> extends Signal<E, T> {
	public function new(?value:Float):Void;
}
@:native("Tone.Scale") extern class Scale extends SignalBase {
	public function new(?outputMin:Float, ?outputMax:Float):Void;
	public var max : Float;
	public var min : Float;
}
@:native("Tone.Pow") extern class Pow extends SignalBase {
	public function new(exp:Tone.Positive):Void;
	public var value : Tone.Positive;
}
@:native("Tone.EqualPowerGain") extern class EqualPowerGain extends SignalBase {

}
@:native("Tone.TransportTimelineSignal") extern class TransportTimelineSignal<E, T> extends Signal<E, T> {

}
@:native("Tone.GainToAudio") extern class GainToAudio extends SignalBase {

}
@:native("Tone.Subtract") extern class Subtract<E, T> extends Signal<E, T> {
	public function new(?value:Float):Void;
}
@:native("Tone.Abs") extern class Abs extends SignalBase {

}
@:native("Tone.Normalize") extern class Normalize extends SignalBase {
	public function new(inputMin:Float, inputMax:Float):Void;
	public var max : Float;
	public var min : Float;
}
@:native("Tone.ScaleExp") extern class ScaleExp extends SignalBase {
	public function new(?outputMin:Float, ?outputMax:Float, ?exponent:Float):Void;
	public var exponent : Float;
	public var max : Float;
	public var min : Float;
}
@:native("Tone.Zero") extern class Zero extends SignalBase {

}
@:native("Tone.GreaterThan") extern class GreaterThan<E, T> extends Signal<E, T> {
	public function new(?value:Float):Void;
}
@:native("Tone.AudioToGain") extern class AudioToGain extends SignalBase {

}
@:native("Tone.WaveShaper") extern class WaveShaper extends SignalBase {
	public function new(mapping:haxe.extern.EitherType<WaveShaperMappingFn, haxe.extern.EitherType<ReadonlyArray<Float>, Float>>, ?bufferLen:Float):Void;
	public var curve : ReadonlyArray<Float>;
	public var oversample : OversamplingType;
	public function setMap(mapping:WaveShaperMappingFn):This;
}
@:native("Tone.GreaterThanZero") extern class GreaterThanZero extends SignalBase {

}
@:native("Tone.TickSignal") extern class TickSignal<E, T> extends Signal<E, T> {
	public function new(?value:Tone.Frequency):Void;
}
@:native("Tone.Negate") extern class Negate extends SignalBase {

}
@:native("Tone.Modulo") extern class Modulo extends SignalBase {
	public function new(modulus:Tone.NormalRange):Void;
	public var value : Tone.NormalRange;
}
@:native("Tone.EncodingTopLevel") extern class EncodingTopLevel {
	static var Master : Dynamic;
	static var Frequency : Dynamic;
	static var Midi : Dynamic;
	static var Ticks : Dynamic;
	static var TimeBase : Dynamic;
	static var Time : Dynamic;
	static var TransportTime : Dynamic;
	static var Transport : Dynamic;
	static var Draw : Dynamic;
}
