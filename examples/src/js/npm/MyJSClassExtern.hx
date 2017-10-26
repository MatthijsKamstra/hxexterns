package js.npm;

// Haxe extern
@:native('MyJSClass')
extern class MyJSClassExtern {

	static var SOME_PROP:Int;
	static function someFunc():Void;

	var myProp:String;

	function new();
	function myFunc(prop:String):Void;
}