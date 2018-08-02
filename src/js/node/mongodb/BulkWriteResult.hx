package js.node.mongodb;

/**
 * Result of a BulkWrite operation.
 */
@:jsRequire("mongodb", "BulkWriteResult")
extern class BulkWriteResult
{
	/** Did bulk operation correctly execute */
	var ok(default,null) : Bool;
	
	/** Number of inserted documents */
	var nInserted(default,null)	: Int;

	/** Number of documents updated logically */
	var nUpdated(default,null) : Int;

	/** Number of upserted documents */
	var nUpserted(default,null) : Int;

	/** Number of documents updated physically on disk. */
	var nModified(default,null) : Int;

	/** Number of removed documents */
	var nRemoved(default,null) : Int;

	/**
	 * Return an array of inserted ids.
	 */
	function getInsertedIds() : Array<InsertedId>;

	/**
	 * Retrieve lastOp if available.
	 */
	function getLastOp() : MongoDocument;

	/**
	 * Return raw internal result.
	 */
	function getRawResponse() : BulkResult;

	/**
	 * Return the upserted id at position index
	 * @param  index - the number of the upserted id to return, returns undefined if no result for passed in index
	 */
	function getUpsertedIdAt(index:Int) : UpsertedId;

	/**
	 * Return an array of upserted ids.
	 */
	function getUpsertedIds() : Array<UpsertedId>;

	/**
	 * Retrieve the write concern error if any.
	 */
	function getWriteConcernError() : WriteConcernError;

	/**
	 * Returns a specific write error object.
	 */
	function getWriteErrorAt() : WriteError;

	/**
	 * Returns the number of write errors off the bulk operation.
	 */
	function getWriteErrorCount() : Int;

	/**
	 * Retrieve all write errors.
	 */
	function getWriteErrors() : Array<WriteError>;

	/**
	 * Returns true if the bulk operation contains a write error.
	 */
	function hasWriteErrors() : Bool;

} // End of BulkWriteResultClass

//
// Additional types
//
// Typedefs specific to bulk write results.
//
typedef InsertedId = { index:Int, _id:String };
typedef UpsertedId = InsertedId;


extern class WriteError
{
	/** Write concern error code. */
	var code(default,null) : Int;

	/** Write concern error original bulk operation index. */
	var index(default,null) : Int;

	/** Write concern error message. */
	var errmsg(default,null) : String;
}


extern class WriteConcernError
{ 
	/** Write concern error code. */
	var code(default,null) : Int;

	/** Write concern error message. */
	var errmsg(default,null) : String;
}


extern class BulkResult
{ 
	var ok(default,null) : Bool;  
	var writeErrors(default,null) : Array<WriteError>;  
	var writeConcernErrors(default,null) : Array<WriteConcernError>;
	var insertedIds(default,null) : Array<InsertedId>;
	var nInserted(default,null) : Int;
	var nUpserted(default,null) : Int;
	var nMatched(default,null) : Int;
	var nModified(default,null) : Int;
	var nRemoved(default,null) : Int;
	var upserted(default,null) : Array<UpsertedId>; 
}
