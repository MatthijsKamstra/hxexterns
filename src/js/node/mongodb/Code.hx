package js.node.mongodb;

import haxe.extern.EitherType;

/**
 * A class representation of the BSON Code type.
 */
@:jsRequire("mongodb", "Code")
extern class Code
{
	/** A string or function. */
	var code(default,default) : EitherType<String,Dynamic->Void>;

	/** Optional scope for the function. */
	var scope(default,default) : Null<Dynamic>;

	/**
	 * Constructor
	 * @param  code  - a string or function.
	 * @param  scope - an optional scope for the function.
	 */
	function new(code:EitherType<String,Dynamic->Void>, scope:Dynamic) : Void;
	
}