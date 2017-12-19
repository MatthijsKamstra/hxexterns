package js.npm.castv2client;

import haxe.extern.EitherType;
import haxe.Constraints.Function;

// @:native('Airtable')
@:jsRequire("castv2-client", "DefaultMediaReceiver")
extern class DefaultMediaReceiver {

	@:selfCall
	function new();
}