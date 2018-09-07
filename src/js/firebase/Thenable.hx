package js.firebase;
/**
 * Haxe externs for Firebase v5.4.2
 * Project: https://firebase.google.com/docs/?authuser=0
 * Definitions by: 	Aksel <https://github.com/jefvel>
 * 					Matthijs Kamstra aka [mck] <https://github.com/MatthijsKamstra>
 * Definitions: <https://github.com/jefvel/haxe-firebase>
 *    			<https://github.com/MatthijsKamstra/hxexterns>
 */

@:native("firebase.Thenable") extern class Thenable<T> {
	//public function catch(error:Dynamic):Thenable<Dynamic>;
	public function then(?onResolve:T -> Void, ?onReject:Dynamic -> Void):Promise<T>;
}