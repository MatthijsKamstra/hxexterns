package js.npm.castv2client;

import haxe.extern.EitherType;
import haxe.Constraints.Function;

// @:native('Airtable')
@:jsRequire("castv2-client", "Client")
extern class Client {
	function new();


	function connect(host:Dynamic, callback:Dynamic):Void;
	function launch(defaultMediaReceiver:Dynamic, callback: Error ->Dynamic -> Void):Void;
	function on(error:String, callback: Error -> Void):Void;
	function close():Void;

}


