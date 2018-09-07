package js.firebase;
/**
 * Haxe externs for Firebase v5.4.2
 * Project: https://firebase.google.com/docs/?authuser=0
 * Definitions by: 	Aksel <https://github.com/jefvel>
 * 					Matthijs Kamstra aka [mck] <https://github.com/MatthijsKamstra>
 * Definitions: <https://github.com/jefvel/haxe-firebase>
 *    			<https://github.com/MatthijsKamstra/hxexterns>
 */

@:native("firebase.User")
extern class User extends UserInfo {
	public var emailVerified:Bool;
	public var isAnonymous:Bool;
	public var providerData:Array<Dynamic>;
	public var refreshToken:String;

	public function delete():Dynamic;
	public function getToken(?forceRefresh:Bool):Dynamic;
	public function link(credential:js.firebase.auth.AuthCredential):Dynamic;
	public function linkWithPopup(provider:js.firebase.auth.AuthProvider):Dynamic;
	public function linkWithRedirect(provider:js.firebase.auth.AuthProvider):Dynamic;
	public function reauthenticate(credential:js.firebase.auth.AuthCredential):Dynamic;
	public function reload():Dynamic;
	public function sendEmailVerification():Dynamic;
	public function unlink(providerId:String):Dynamic;
	public function updateEmail(newEmail:String):js.firebase.Promise<Void>;
}