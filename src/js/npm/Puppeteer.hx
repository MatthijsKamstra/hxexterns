package js.npm;


import haxe.extern.EitherType;
import haxe.Constraints.Function;

@:native('puppeteer')
@:jsRequire("puppeteer")
extern class Puppeteer {

	function new():Void;

	function newPage():Void;
	function launch():js.Promise<Dynamic>;
	// static function launch():Void;

	public function await() : Dynamic {
		return untyped __js__('await');
	}


}

@:native('async')
extern class Async {
  	@:selfCall
	function new (callback:Function):Void;
}


class AAwai  {
	// public static inline var tt = untyped await;
	public static function t () : Dynamic {
		return untyped await;
	}

	public static inline function debug() {
		return untyped __js__("await");
	}

}

@:native('await')
extern class Await {
  	@:selfCall
	function new (?callback:Function);
}

class A{

	@:native('async')
	static function sync(?callback:Function) {

	}

	// @:native('await')
	public static inline function wait(?callback:Function) {
		return untyped __js__('await ${callback}');
	}
}
