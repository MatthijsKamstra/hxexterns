package js.firebase.database;
/**
 * Haxe externs for Firebase v5.4.2
 * Project: https://firebase.google.com/docs/?authuser=0
 * Definitions by: 	Aksel <https://github.com/jefvel>
 * 					Matthijs Kamstra aka [mck] <https://github.com/MatthijsKamstra>
 * Definitions: <https://github.com/jefvel/haxe-firebase>
 *    			<https://github.com/MatthijsKamstra/hxexterns>
 */

@:native("firebase.database.DataSnapshot")
extern class DataSnapshot {
	public var key:String;
	public var ref:Reference;

	public function child(path:String):DataSnapshot;
	public function exists():Bool;
	public function exportVal():Dynamic;
	public function forEach(action: DataSnapshot -> Bool):Bool;
	public function getPriority():Dynamic;
	public function hasChild(path:String):Bool;
	public function hasChildren():Bool;
	public function numChildren():Int;

	public function val():Dynamic;

}