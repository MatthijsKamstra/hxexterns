package js.firebase.database;
/**
 * Haxe externs for Firebase v5.4.2
 * Project: https://firebase.google.com/docs/?authuser=0
 * Definitions by: 	Aksel <https://github.com/jefvel>
 * 					Matthijs Kamstra aka [mck] <https://github.com/MatthijsKamstra>
 * Definitions: <https://github.com/jefvel/haxe-firebase>
 *    			<https://github.com/MatthijsKamstra/hxexterns>
 */

@:native("firebase.database.OnDisconnect")
extern class OnDisconnect {
	public function cancel(?onComplete:js.firebase.auth.Error -> Void):js.firebase.Promise<Void>;
	public function remove(?onComplete:js.firebase.auth.Error -> Void):js.firebase.Promise<Void>;
	public function set(value:Dynamic, ?onComplete:js.firebase.auth.Error -> Void):js.firebase.Promise<Void>;
	public function setWithPriority(value:Dynamic, priority:Dynamic, ?onComplete:js.firebase.auth.Error -> Void):js.firebase.Promise<Void>;
	public function update(values:Dynamic, ?onComplete:js.firebase.auth.Error -> Void):js.firebase.Promise<Void>;
}