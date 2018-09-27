package js.firebase;


typedef FirebaseObj = {
    var apiKey: String;
    var authDomain: String;
    var databaseURL: String;
    var projectId: String;
    var storageBucket: String;
    var messagingSenderId: String;
};

/**
 * Haxe externs for Firebase v5.4.2
 * Project: https://firebase.google.com/docs/?authuser=0
 * Definitions by: 	Aksel <https://github.com/jefvel>
 * 					Matthijs Kamstra aka [mck] <https://github.com/MatthijsKamstra>
 * Definitions: <https://github.com/jefvel/haxe-firebase>
 *    			<https://github.com/MatthijsKamstra/hxexterns>
 */

/**
 * set in build.hxml the value `-D nodejs` to use the module you installed via
 * `npm install firebase --save`
 * default is for browser use
 */
#if nodejs
@:jsRequire("firebase")
#end
@:native("firebase")
extern class Firebase {
	// static function __init__():Void {
	// 	#if js
	// 		haxe.macro.Compiler.includeFile("../lib/firebase.js");
	// 	#end
	// }

	public static function app(?name:String):js.firebase.app.App;
	public static function apps():Array<js.firebase.app.App>;
	public static function initializeApp(options:haxe.extern.EitherType<Dynamic, FirebaseObj>):js.firebase.app.App;
	public static function database(?app:js.firebase.app.App):js.firebase.database.Database;
	public static function auth(?app:js.firebase.app.App):js.firebase.auth.Auth;
	public static function storage(?app:js.firebase.app.App):js.firebase.storage.Storage;
	public static function messaging(?app:js.firebase.app.App):js.firebase.messaging.Messaging;

}
