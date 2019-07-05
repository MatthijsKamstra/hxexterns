
// @:native("Index.GUIParams") interface GUIParams {
// 	@:optional
// 	public var autoPlace : Bool;
// 	@:optional
// 	public var closed : Bool;
// 	@:optional
// 	public var closeOnTop : Bool;
// 	@:optional
// 	public var hideable : Bool;
// 	@:optional
// 	public var load : Dynamic;
// 	@:optional
// 	public var name : String;
// 	@:optional
// 	public var preset : String;
// 	@:optional
// 	public var width : Float;
// }
@:native("Index.GUI") extern class GUI {
	public function new(?option:GUIParams):Void;
	public var __controllers : Array<GUIController>;
	public var __folders : Array<GUI>;
	public var domElement : HTMLElement;
	@:overload(function(target:Dynamic, propName:String, status:Bool):GUIController { })
	@:overload(function(target:Dynamic, propName:String, items:Array<String>):GUIController { })
	@:overload(function(target:Dynamic, propName:String, items:Array<Float>):GUIController { })
	@:overload(function(target:Dynamic, propName:String, items:Dynamic):GUIController { })
	public function add(target:Dynamic, propName:String, ?min:Float, ?max:Float, ?step:Float):GUIController;
	public function addColor(target:Dynamic, propName:String):GUIController;
	public function remove(controller:GUIController):Void;
	public function destroy():Void;
	public function addFolder(propName:String):GUI;
	public function removeFolder(subFolder:GUI):Void;
	public function open():Void;
	public function close():Void;
	public function remember(target:Dynamic, additionalTargets:haxe.extern.Rest<Dynamic>):Void;
	public function getRoot():GUI;
	public function getSaveObject():Dynamic;
	public function save():Void;
	public function saveAs(presetName:String):Void;
	public function revert(gui:GUI):Void;
	public function listen(controller:GUIController):Void;
	public function updateDisplay():Void;
	public var parent : GUI;
	public var scrollable : Bool;
	public var autoPlace : Bool;
	public var preset : String;
	public var width : Float;
	public var name : String;
	public var closed : Bool;
	public var load : Dynamic;
	public var useLocalStorage : Bool;
}
@:native("Index.GUIController") extern class GUIController {
	public function destroy():Void;
	public var onChange : ?Dynamic -> GUIController;
	public var onFinishChange : ?Dynamic -> GUIController;
	public function setValue(value:Dynamic):GUIController;
	public function getValue():Dynamic;
	public function updateDisplay():GUIController;
	public function isModified():Bool;
	public function min(n:Float):GUIController;
	public function max(n:Float):GUIController;
	public function step(n:Float):GUIController;
	public function fire():GUIController;
	public function options(option:Dynamic):GUIController;
	public function name(s:String):GUIController;
	public function listen():GUIController;
	public function remove():GUIController;
}
