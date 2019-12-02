package js.test.tone;

// import tone.Encoding;
import js.lib.Promise;
import js.html.audio.AudioParam;
import js.html.audio.*;

// typedef ToneQuery = Dynamic->?Dynamic->?String->Tone;
@:native("Tone")
extern class Tone {
	public function new(?opts:Dynamic):Void;

	public static inline function construct(?opts:Dynamic):Tone {
		return js.Syntax.construct("Tone");
	}
}
