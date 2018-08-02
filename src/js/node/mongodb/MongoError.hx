package js.node.mongodb;

@:jsRequire("mongodb", "MongoError")
extern class MongoError extends js.Error
{
	/**
	 * Constructs a new MongoError.
	 */
	function new(message:String) : Void;

	/**
	 * Creates a new MongoError object
	 */
	static function create(options:Dynamic) : MongoError;
}