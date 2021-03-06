package js.node.mongodb;

import haxe.extern.EitherType;
import js.node.mongodb.ReadPreference;


/**
 * Class that implements a listener for log events of a MongoServer.
 * Extend it to use in the Mongo callbacks.
 */
extern class MongoLogger
{
	/**
	 * Debug callback.
	 * @param	p_message
	 * @param	p_object
	 */
	function debug(p_message : String, p_object : Dynamic):Void;
	
	/**
	 * Log callback.
	 * @param	p_message
	 * @param	p_object
	 */
	function log(p_message : String, p_object : Dynamic):Void;
	
	/**
	 * Error callback.
	 * @param	p_message
	 * @param	p_object
	 */
	function error(p_message : String, p_object : Dynamic):Void;
}

/**
 * Class that describes a common MongoDB option class used in different classes.
 * @author Eduardo Pons - eduardo@thelaborat.org
 */
extern class MongoOption
{
	/**
	 *  { Number / String, > -1 || ‘majority’ || tag name } the write concern for the operation where < 1 is no acknowlegement of write and w >= 1, w = ‘majority’ or tag acknowledges the write
	 */
	var w 					: EitherType<String,Int>;
	
	/**
	 * {Number, 0} set the timeout for waiting for write concern to finish (combines with w option)
	 */
	var wtimeout 			: Int;
	
	/**
	 *  (Boolean, default:false) write waits for fsync before returning, from MongoDB 2.6 on, fsync cannot be combined with journal
	 */
	var fsync 				: Bool;
	
	/**
	 * (Boolean, default:false) write waits for journal sync before returning
	 */
	var j 					: Bool;
	
	/**
	 * {String}, the prefered read preference (ReadPreference.PRIMARY, ReadPreference.PRIMARY_PREFERRED, ReadPreference.SECONDARY, ReadPreference.SECONDARY_PREFERRED, ReadPreference.NEAREST).
	 */
	var readPreference 		: EitherType<String,ReadPreference>;
	
	/**
	 * {Boolean, default:false}, use c++ bson parser.
	 */
	var native_parser 		: Bool;
	
	/**
	 * {Boolean, default:false}, force server to create _id fields instead of client.
	 */
	var forceServerObjectId  : Bool;
	
	/**
	 * {Object} object overriding the basic ObjectID primary key generation.
	 */
	var pkFactory 			: ObjectID;
	
	/**
	 * {Boolean, default:false}, serialize functions.
	 */
	var serializeFunctions 	: Bool;
	
	/**
	 * {Boolean, default:false}, peform operations using raw bson buffers.
	 */
	var raw 				: Bool;
	
	/**
	 * {Boolean, default:false}, record query statistics during execution.
	 */
	var recordQueryStats 	: Bool;
	
	/**
	 * {Number, default:5000}, number of miliseconds between retries.
	 */
	var retryMiliSeconds 	: Int;
	
	/**
	 * {Number, default:5}, number of retries off connection.
	 */
	var numberOfRetries    : Int;
	
	/**
	 * {Number, default: -1}, sets a cap on how many operations the driver will buffer up before giving up on getting a working connection, default is -1 which is unlimited
	 */
	var bufferMaxEntries 	: Int;

	
	/**
	 *  Use only for MongoDatabase's 'eval' method.
	 *  {Boolean, default:false}, Tell MongoDB not to block on the evaulation of the javascript.
	 */
	var nolock : Bool;
	
}


/**
 * Creation options for a MongoServer instance.
 */
extern class MongoServerOption
{
	/**
	 * {Boolean, default:false}, use ssl connection (needs to have a mongod server with ssl support)
	 */
	var ssl			 				: Bool; 
	
	/**
	 * {Boolean, default:false}, validate mongod server certificate against ca (needs to have a mongod server with ssl support, 2.4 or higher)
	 */
	var sslValidate 				: Bool; 
	
	/**
	 * {Array, default:null}, Array of valid certificates either as Buffers or Strings (needs to have a mongod server with ssl support, 2.4 or higher)
	 */
	var sslCA 						: Array<Dynamic>; 
	
	/**
	 * {Buffer/String, default:null}, String or buffer containing the certificate we wish to present (needs to have a mongod server with ssl support, 2.4 or higher)
	 */
	var sslCert 					: Dynamic; 
	
	/**
	 * {Buffer/String, default:null}, String or buffer containing the certificate private key we wish to present (needs to have a mongod server with ssl support, 2.4 or higher)
	 */
	var sslKey 						: Dynamic; 
	
	/**
	 * {Buffer/String, default:null}, String or buffer containing the certificate password (needs to have a mongod server with ssl support, 2.4 or higher)
	 */
	var sslPass 					: Dynamic; 
	
	/**
	 * {Number, default:5}, number of connections in the connection pool, set to 5 as default for legacy reasons.
	 */
	var poolSize 					: Int; 
	
	/**
	 * {Object, default:null}, an object containing socket options to use (noDelay:(boolean), keepAlive:(number), connectTimeoutMS:(number), socketTimeoutMS:(number))
	 */
	var socketOptions 				: MongoServerSocketOption; 
	
	/**
	 * {Object, default:null}, an object representing a logger that you want to use, needs to support functions debug, log, error ({error:function(message, object) {}, log:function(message, object) {}, debug:function(message, object) {}}).
	 */
	var logger 						: MongoLogger; 
	
	/**
	 * {Boolean, default:false}, reconnect on error.
	 */
	var auto_reconnect 				: Bool; 
	
	/**
	 * { Boolean, default:false }, force the server to error if the BSON message is to big
	 */
	var disableDriverBSONSizeCheck  : Bool; 
	
}

/**
 * 
 */
extern class MongoMongosOption
{
	/**
	 * {Object, default:null}, an object containing socket options to use (noDelay:(boolean), keepAlive:(number), connectTimeoutMS:(number), socketTimeoutMS:(number))
	 */
	var socketOptions 				: MongoServerSocketOption; 
	
	/**
	 * {Boolean, default:true}, turn on high availability.
	 */
	var ha 							 : Int;	
	
	/**
	 * {Number, default:2000}, time between each replicaset status check.
	 */
	var haInterval 					 : Int;		
	
}

/**
 * 
 */
extern class MongoReplSetOption extends MongoServerOption
{
	/**
	 * {Boolean, default:true}, turn on high availability.
	 */
	var ha 							 : Int;	
	
	/**
	 * {Number, default:2000}, time between each replicaset status check.
	 */
	var haInterval 					 : Int;	
	
	/**
	 * {Number, default:1000}, time to wait in miliseconds before attempting reconnect.
	 */
	var reconnectWait 				 : Int;	
	
	/**
	 * {Number, default:30}, number of times to attempt a replicaset reconnect.
	 */
	var retries 					 : Int;	
	
	/**
	 * {String}, the name of the replicaset to connect to.	
	 */
	var rs_name 					 : Int;	
	
	/**
	 * {String, default:’ping’}, selection strategy for reads choose between (ping, statistical and none, default is ping)
	 */
	var strategy 					 : Int;	
	
	/**
	 * {Number, default:15}, sets the range of servers to pick when using NEAREST (lowest ping ms + the latency fence, ex: range of 1 to (1 + 15) ms)
	 */
	var secondaryAcceptableLatencyMS : Int;	
	
	/**
	 * {Boolean, default:false}, sets if the driver should connect even if no primary is available
	 */
	var connectWithNoPrimary 		 : Int;	
	
	/**
	 * { Boolean, default:false }, sets if the driver should connect to arbiters or not.
	 */
	var connectArbiter 				 : Int;	
	
}

/**
 * Object containing socket options to use (noDelay:(boolean), keepAlive:(number), connectTimeoutMS:(number), socketTimeoutMS:(number))
 */
extern class MongoServerSocketOption
{
	/**
	 * 
	 */
	var noDelay : Bool;
	
	/**
	 * 
	 */
	var keepAlive : Bool;
		
	/**
	 * 
	 */
	var connectTimeoutMS : Int;
	
	/**
	 * 
	 */
	var socketTimeoutMS : Int;

}


/**
 * 
 */
extern class MongoConnectionOption
{
	/**
	 * { Boolean, default:false } uri decode the user name and password for authentication
	 */
	var uri_decode_auth 	: Bool;	
	
	/**
	 * { Object, default: null } a hash off options to set on the db object, see Db constructor
	 */
	var db 					: MongoDatabaseOption;	
	
	/**
	 * { Object, default: null } a hash off options to set on the server objects, see Server constructor **
	 */
	var server 				: MongoServerOption;	
	
	/**
	 * { Object, default: null } a hash off options to set on the replSet object, see ReplSet constructor **
	 */
	var replSet 			: MongoReplSetOption;	
	
	/**
	 * { Object, default: null } a hash off options to set on the mongos object, see Mongos constructor **
	 */
	var mongos 				: MongoMongosOption;	
	
}

/**
 * 
 */
extern class MongoDatabaseOption extends MongoOption
{
	/**
	 * 	{Object, default:null}, an object representing a logger that you want to use, needs to support functions debug, log, error ({error:function(message, object) {}, log:function(message, object) {}, debug:function(message, object) {}}).
	 */
	var logger 				: MongoLogger;
	
	/**
	 * 	{Number, default:null}, force setting of SlaveOk flag on queries (only use when explicitly connecting to a secondary server).
	 */
	var slaveOk 			: Int;
	
	/**
	 * {Boolean, default:true}, when deserializing a Long will fit it into a Number if it’s smaller than 53 bits	
	 */
	var promoteLongs 		: Bool;	
	
	
	/**
	 * Use only in MongoDatabase's 'collectionNames' method.
	 * {String, default:false}, Return only the full collection namespace.
	 */
	var namesOnly : String;
}


/**
 * 
 */
class MongoAuthOption
{
	/**
	 * 
	 */
	static inline public var MONGO_CR : String = "MONGODB - CR";
	
	/**
	 * 
	 */
	static inline public var GSSAPI : String = "GSSAPI";
	/**
	 *  { String, default:MONGODB - CR }, The authentication mechanism to use, GSSAPI or MONGODB - CR
	 */
	public var authMechanism :String = MONGO_CR;
	
	/**
	 * 
	 */
	public function new():Void{}
}

/**
 * 
 */


/**
 * 
 */
extern class MongoRemoveUserOption
{
	/**
	 * {Number/String, > -1 || ‘majority’ || tag name} the write concern for the operation where &lt; 1 is no acknowledgement of write and w >= 1, w = ‘majority’ or tag acknowledges the write
	 */
	var w 			: EitherType<String,Int>;			
	/**
	 * {Number, 0} set the timeout for waiting for write concern to finish (combines with w option)
	 */
	var wtimeout 	: Int;				
	/**
	 * (Boolean, default:false) write waits for fsync before returning, from MongoDB 2.6 on, fsync cannot be combined with journal
	 */
	var fsync		: Bool;				
	/**
	 * (Boolean, default:false) write waits for journal sync before returning
	 */
	var j			: Bool;				
}

/**
 * 
 */

extern class MongoCursorOption
{
	/**
	 * {Number} skip number of documents to skip.
	 */
	var skip 					:Int;
	/**
	 * {Number}, limit the number of results to return. -1 has a special meaning and is used by Db.eval. A value of 1 will also be treated as if it were -1.
	 */
	var limit 					:Int;
	/**
	 * {Array | Object}, set to sort the documents coming back from the query. Array of indexes, [[‘a’, 1]] etc.
	 */
	var sort 					:Dynamic;
	/**
	 * {Object}, hint force the query to use a specific index.
	 */
	var hint 					:Dynamic;
	/**
	 * {Boolean}, explain return the explaination of the query.
	 */
	var explain 				:Bool;
	/**
	 * {Boolean}, snapshot Snapshot mode assures no duplicates are returned.
	 */
	var snapshot 				:Bool;
	/**
	 * {Boolean}, timeout allow the query to timeout.
	 */
	var timeout 				:Bool;
	/**
	 * {Boolean}, tailable allow the cursor to be tailable.
	 */
	var tailable 				:Bool;
	/**
	 * {Boolean}, awaitdata allow the cursor to wait for data, only applicable for tailable cursor.
	 */
	var awaitdata				:Bool;
	/**
	 * {Boolean}, sets an internal flag, only applicable for tailable cursor.
	 */
	var oplogReplay 			:Bool;
	
	/**
	 * {Number}, batchSize the number of the subset of results to request the database to return for every request. This should initially be greater than 1 otherwise the database will automatically close the cursor. The batch size can be set to 1 with cursorInstance.batchSize after performing the initial query to the database.
	 */
	var batchSize 				:Int;
	
	/**
	 * {Boolean}, raw return all query documents as raw buffers (default false).
	 */
	var raw 					:Bool;
	
	/**
	 * {Boolean}, read specify override of read from source (primary/secondary).
	 */
	var read 					:Bool;
	
	/**
	 * {Boolean}, returnKey only return the index key.
	 */
	var returnKey 				:Bool;
	
	/**
	 * {Number}, maxScan limit the number of items to scan.
	 */
	var maxScan 				:Int;
	
	/**
	 * {Number}, min set index bounds.
	 */
	var min 					:Int;
	
	/**
	 * {Number}, max set index bounds.
	 */
	var max 					:Int;
	
	/**
	 * {Number}, number of miliseconds to wait before aborting the query.
	 */
	var maxTimeMS 				:Int;
	
	/**
	 * {Boolean}, showDiskLoc show disk location of results.
	 */
	var showDiskLoc 			:Bool;
	
	/**
	 * {String}, comment you can put a $comment field on a query to make looking in the profiler logs simpler.
	 */
	var comment 				:String;
	
	/**
	 * {Number}, numberOfRetries if using awaidata specifies the number of times to retry on timeout.
	 */
	var numberOfRetries 		:Int;
	
	/**
	 * {String}, dbName override the default dbName.
	 */
	var dbName 					:String;
	
	/**
	 * {Number}, tailableRetryInterval specify the miliseconds between getMores on tailable cursor.
	 */
	var tailableRetryInterval 	:Int;
	
	/**
	 * {Boolean}, exhaust have the server send all the documents at once as getMore packets.
	 */
	var exhaust					:Bool;
	/**
	 * { Boolean }, partial have the sharded system return a partial result from mongos.
	 */
	var partial 				:Bool;
	
	/**
	 *  { String }, the preferred read preference (ReadPreference.PRIMARY, ReadPreference.PRIMARY_PREFERRED, ReadPreference.SECONDARY, ReadPreference.SECONDARY_PREFERRED, ReadPreference.NEAREST).
	 *  Use only in the MongoDatabase 'cursorInfo' method.
	 */
	var readPreference : EitherType<String,ReadPreference>;
	
}



/**
 * 
 */
extern class CollectionFetchOption
{
	/**
	 * {Number/String, > -1 || ‘majority’ || tag name} the write concern for the operation where &lt; 1 is no acknowledgement of write and w >= 1, w = ‘majority’ or tag acknowledges the write
	 */	
	var w					: EitherType<String,Int>;	
	
	/**
	 * {Number, 0} set the timeout for waiting for write concern to finish (combines with w option)
	 */
	var wtimeout 			: Int;	
	
	/**
	 * 	(Boolean, default:false) write waits for fsync before returning, from MongoDB 2.6 on, fsync cannot be combined with journal
	 */
	var fsync 				: Bool;
	
	/**
	 * (Boolean, default:false) write waits for journal sync before returning
	 */
	var j 					: Bool;	
	
	/**
	 * {Boolean, default:false}, serialize functions on the document.
	 */
	var serializeFunctions 	: Bool;	
	
	/**
	 * {Boolean, default:false}, perform all operations using raw bson objects.
	 */
	var raw 				: Bool;	
	
	/**
	 * 	{Object}, object overriding the basic ObjectID primary key generation.
	 */
	var pkFactory 			: ObjectID;
	
	/**
	 * {String}, the preferred read preference (ReadPreference.PRIMARY, ReadPreference.PRIMARY_PREFERRED, ReadPreference.SECONDARY, ReadPreference.SECONDARY_PREFERRED, ReadPreference.NEAREST).
	 */
	var readPreference 		: EitherType<String,ReadPreference>;	
	
	/**
	 * (Boolean, default:false) returns an error if the collection does not exist
	 */
	var strict 				: Bool;	
	
}

/**
 * 
 */
extern class CollectionOption extends CollectionFetchOption
{
	/**
	 * {Boolean, default:false}, create a capped collection.
	 */
	var capped 			: Bool;		
	/**
	 * {Number}, the size of the capped collection in bytes.
	 */
	var size 			: Int;		
	/**
	 * {Number}, the maximum number of documents in the capped collection.
	 */
	var max 			: Int;		
	
	/**
	 * { Boolean, default:true }, create an index on the _id field of the document, True by default on MongoDB 2.2 or higher off for version & lt; 2.2.
	 */
	var autoIndexId 	: Bool;		
}

/**
 * 
 */
extern class CollectionBuildOption
{
	/**
	 * {String}, the prefered read preference (ReadPreference.PRIMARY, ReadPreference.PRIMARY_PREFERRED, ReadPreference.SECONDARY, ReadPreference.SECONDARY_PREFERRED, ReadPreference.NEAREST).
	 */
	var readPreference 				:EitherType<String,ReadPreference>;
	/**
	 * {Boolean, default:false}, Allow reads from secondaries.
	 */
	var slaveOk 					:Bool;
	/**
	 * {Boolean, default:false}, serialize functions on the document.
	 */
	var serializeFunctions 			:Bool;
	/**
	 * {Boolean, default:false}, perform all operations using raw bson objects.
	 */
	var raw 						:Bool;
	/**
	 * { Object }, object overriding the basic ObjectID primary key generation.
	 */
	var pkFactory 					:ObjectID;
	
	/**
	 *  { Boolean, default:false }, drop the target name collection if it previously exists.
	 *  Use only for MongoDatabase 'renameCollection' method.
	 */
	var dropTarget : Bool;
	
}

/**
 * 
 */
extern class BSONOption
{
	/**
	 * {Boolean, default:false}, evaluate functions in the BSON document scoped to the object deserialized.
	 */
	var evalFunctions 		:Bool;
	
	/**
	 * {Boolean, default:false}, cache evaluated functions for reuse.
	 */
	var cacheFunctions 		:Bool;
	
	/**
	 * { Boolean, default:false }, use a crc32 code for caching, otherwise use the string of the function.
	 */
	var cacheFunctionsCrc32 :Bool;
}

