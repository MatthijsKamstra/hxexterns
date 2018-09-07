package js.firebase;
/**
 * Haxe externs for Firebase v5.4.2
 * Project: https://firebase.google.com/docs/?authuser=0
 * Definitions by: 	Aksel <https://github.com/jefvel>
 * 					Matthijs Kamstra aka [mck] <https://github.com/MatthijsKamstra>
 * Definitions: <https://github.com/jefvel/haxe-firebase>
 *    			<https://github.com/MatthijsKamstra/hxexterns>
 */

@:native("firebase.UserInfo")
extern class UserInfo {
	public var displayName:String;
	public var email:String;
	public var photoURL:String;
	public var providerId:String;
	public var uid:String;
}