package js.tone;

// import tone.Encoding;
import js.lib.Promise;
import js.html.audio.AudioParam;
import js.html.audio.*;

@:native("Tone")
extern class Tone {
	public function new(?opts:Dynamic):Void;

	static public function Offline(callback:Dynamic, duration:Encoding.Time):Promise<Encoding.Buffer>;
	static public function connectSeries(nodes:haxe.extern.Rest<haxe.extern.EitherType<AudioParam, haxe.extern.EitherType<Tone, AudioNode>>>):Tone;
	static public function dbToGain(db:Float):Float;

	// @:overload(function<G>(given:NonNullable<G>, ?fallback:Dynamic):G { })
	// @:overload(function<F>(given:Dynamic, fallback:NonNullable<F>):F { })
	// @:overload(function<G, F>(given:G, ?fallback:F):G { })
	// static public function defaultArg<G:(Dynamic), F:(Dynamic)>(given:G, fallback:F):Dynamic;
	static public function defaults(values:Array<Dynamic>, keys:Array<String>,
		constr:haxe.extern.Rest<Dynamic> -> haxe.extern.EitherType<Dynamic, Dynamic>):Dynamic;
	static public function equalPowerScale(percent:Float):Float;
	// static public function extend<T:(Tone.Ctor), P:(Tone.Ctor)>(child:T, ?parent:P):Dynamic;
	static public function gainToDb(gain:Float):Float;
	static public function intervalToFrequencyRation(interval:Float):Float;

	@:overload(function(arg:Dynamic):Bool {})
	static public function isArray(arg:Array<Dynamic>):Bool;

	@:overload(function(arg:Dynamic):Bool {})
	static public function isBoolean(arg:Bool):Bool;

	@:overload(function(arg:Dynamic):Bool {})
	static public function isDefined(?arg:Dynamic):Bool;

	@:overload(function(arg:Dynamic):Bool {})
	static public function isFunction(arg:haxe.extern.Rest<Dynamic>->Void):Bool;

	@:overload(function(arg:Dynamic):Bool {})
	static public function isNumber(arg:Float):Bool;

	@:overload(function(arg:Dynamic):Bool {})
	static public function isObject(arg:Dynamic):Bool;

	@:overload(function(arg:Dynamic):Bool {})
	static public function isString(arg:String):Bool;

	@:overload(function(arg:Dynamic):Bool {})
	static public function isUndef(?arg:Dynamic):Bool;

	static public function isNote(arg:Dynamic):Bool;
	static public function loaded():Promise<Void>;
	static public function now():Float;
	static public var context:Dynamic;
	public function receive(channelName:String, ?channelNumber:Float):Tone;
	public function send(channelName:String, amount:Float):GainNode;
	public function toFrequency(freq:Encoding.Frequency):Float;
	public function toSeconds(time:Encoding.Time):Float;
	public function toTicks(time:Encoding.Time):Encoding.Ticks;
}
