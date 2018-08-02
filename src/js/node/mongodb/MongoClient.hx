package js.node.mongodb;
import js.node.events.EventEmitter;
import js.node.mongodb.MongoError;
import js.node.mongodb.MongoDatabase;
import js.node.mongodb.MongoOption.MongoOption;
import js.node.mongodb.MongoOption.MongoServerOption;

/**
 * 
 */
@:jsRequire("mongodb", "MongoClient")
extern class MongoClient extends EventEmitter<MongoClient>
{
	/**
	 * Creates a new MongoClient instance.
	 */	
	@:overload(function(p_server:MongoServer):Void { })	
	function new(p_server : MongoServer, p_options:MongoOption);
	
	/**
	 * Connect to MongoDB using a url as documented at
	 * docs.mongodb.org/manual/reference/connection-string/ 
	 */	
	@:overload(function(p_url:String, p_callback:MongoError->MongoDatabase->Void):Void { } )		
	static function connect(p_url:String, p_options:MongoOption, p_callback:MongoError->MongoDatabase->Void):Void;
	
	
	
	/**
	 * Connect to MongoDB using a url as documented at
	 * docs.mongodb.org/manual/reference/connection-string/
	 * @param	p_url
	 * @param	p_options
	 * @param	p_callback
	 */
	@:overload(function(p_url:String, p_callback:MongoError->MongoDatabase->Void):Void { } )	
	@:native("connect")
	function Connect(p_url:String, p_options:MongoOption, p_callback:MongoError->MongoDatabase-> Void):Void;
	
	/**
	 * Initialize the database connection.
	 * @param	p_callback
	 */
	function open(p_callback:MongoError->MongoDatabase->Void):Void;
	
	/**
	 * Close the current db connection, including all the child db instances. Emits close event if no callback is provided.
	 * @param	p_callback
	 */
	@:overload(function():Void{})
	function close(p_callback:MongoError->Dynamic->Void):Void;
	
	/**
	 * Create a new Db instance sharing the current socket connections.
	 * @param	name
	 * @return
	 */
	function db(name:String):MongoDatabase;
}