package js.firebase;
/**
 * Haxe externs for Firebase v5.4.2
 * Project: https://firebase.google.com/docs/?authuser=0
 * Definitions by: 	Aksel <https://github.com/jefvel>
 * 					Matthijs Kamstra aka [mck] <https://github.com/MatthijsKamstra>
 * Definitions: <https://github.com/jefvel/haxe-firebase>
 *    			<https://github.com/MatthijsKamstra/hxexterns>
 */

@:native("firebase.Promise") extern class Promise<T> extends Thenable<T> {
	public function new(resolver: Void -> T);
	public function all(values:Array<Promise<T>>):Promise<T>;
	public function reject(value:Dynamic):Promise<T>;
	public function resolve(value:T):Promise<T>;

	@:native('catch')
	public function catch_(onReject:Dynamic -> Void):Dynamic;

}