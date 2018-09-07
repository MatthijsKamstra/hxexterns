package js.firebase.database;

typedef TransactionResult = {
	var committed:Bool;
	var snapshot:js.firebase.database.DataSnapshot;
}

/**
 * Haxe externs for Firebase v5.4.2
 * Project: https://firebase.google.com/docs/?authuser=0
 * Definitions by: 	Aksel <https://github.com/jefvel>
 * 					Matthijs Kamstra aka [mck] <https://github.com/MatthijsKamstra>
 * Definitions: <https://github.com/jefvel/haxe-firebase>
 *    			<https://github.com/MatthijsKamstra/hxexterns>
 */
@:native("firebase.database.Reference")
extern class Reference extends Query {

	public var key:String;
	public var parent:Reference;
	public var root:Reference;

	public function child(path:String):Reference;
	public function onDisconnect():OnDisconnect;
	public function push(?value:Dynamic, ?onComplete:js.firebase.auth.Error -> Void):ThenableReference;
	public function remove(?onComplete:js.firebase.auth.Error -> Void ):js.firebase.Promise<Void>;
	public function set(value:Dynamic, ?onComplete:js.firebase.auth.Error -> Void):js.firebase.Promise<Void>;
	public function setPriority(priority:Dynamic, ?onComplete:js.firebase.auth.Error -> Void):js.firebase.Promise<Void>;
	public function setWithPriority(value:Dynamic, priority:Dynamic, ?onComplete:js.firebase.auth.Error -> Void):js.firebase.Promise<Void>;

	public function transaction(transactionUpdate: Dynamic -> Void, ?onComplete: js.firebase.auth.Error -> Bool -> DataSnapshot -> Void, ?applyLocally:Bool):js.firebase.Promise<TransactionResult>;
	public function update(values:Dynamic, ?onComplete:js.firebase.auth.Error -> Void):js.firebase.Promise<Void>;
}