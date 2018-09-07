package js.firebase.database;
/**
 * Haxe externs for Firebase v5.4.2
 * Project: https://firebase.google.com/docs/?authuser=0
 * Definitions by: 	Aksel <https://github.com/jefvel>
 * 					Matthijs Kamstra aka [mck] <https://github.com/MatthijsKamstra>
 * Definitions: <https://github.com/jefvel/haxe-firebase>
 *    			<https://github.com/MatthijsKamstra/hxexterns>
 */
@:native("firebase.database.Database")
extern class Database {
	public var app:js.firebase.app.App;

	public function goOffline():Void;
	public function goOnline():Void;

	public function ref(?path:String):Reference;
	public function refFromURL(url:String):Reference;

}