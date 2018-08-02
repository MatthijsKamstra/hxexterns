package js.node.mongodb;

import haxe.extern.EitherType;
import js.node.mongodb.AggregationCursor;
import js.node.mongodb.Code;
import js.node.mongodb.MongoCallback.BulkWriteOpCallback;
import js.node.mongodb.MongoCallback.ResultCallback;
import js.node.mongodb.MongoCallback.CountResultCallback;
import js.node.mongodb.MongoCursor;
import js.node.mongodb.MongoDocument;
import js.node.mongodb.MongoDocument.MongoResult;
import js.node.mongodb.OrderedBulkOperation;

/**
 * Embodies a MongoDB collection allowing for insert/update/remove/find
 * and other command operation on that MongoDB collection.
 */
@:jsRequire("mongodb", "Collection")
extern class MongoCollection
{
	/** Get the collection name. */
	var collectionname(default,null) : String;

	/** Get the full collection namespace. */
	var namespace(default,null) : String;

	/** The current write concern values. */
	var writeConcern(default,null) : CollectionWriteConcern;

	/** Get current index hint for collection. */
	var hint(default,null) : MongoDocument;

	/**
	 * Execute an aggregation framework pipeline against the collection, needs MongoDB >= 2.2.
	 * @param  pipeline - Array containing all the aggregation framework commands for the execution.
	 * @param  options 	- Optional settings.
	 * @param  callback - result callback
	 * @return AggregationCursor or null
	 */
	function aggregate(pipeline:Array<MongoDocument>, options:AggregateOptions, callback:ResultCallback<MongoCollection>) : AggregationCursor;

	/**
	 * Perform a bulkWrite operation without a fluent API.
	 * Legal operation types are
	 * 		{ insertOne: { document: { a: 1 } } }
	 * 		{ updateOne: { filter: {a:2}, update: {$set: {a:2}}, upsert:true } }
	 * 		{ updateMany: { filter: {a:2}, update: {$set: {a:2}}, upsert:true } }
	 * 		{ deleteOne: { filter: {c:1} } }
	 * 		{ deleteMany: { filter: {c:1} } }
	 * 		{ replaceOne: { filter: {c:3}, replacement: {c:4}, upsert:true}}
	 *
	 * @param  operations<MongoDocument> - Bulk operations to perform.
	 * @param  options                   - Optional settings.
	 * @param  callback                  - The command result callback
	 */
	function bulkWrite(operations:Array<MongoDocument>, options:BulkWriteOptions, callback:BulkWriteOpCallback) : Void;

	/**
	 * Count number of matching documents in the db to a query.
	 * @param  query    - The query for the count.
	 * @param  options  - Optional settings.
	 * @param  callback - callback of type CountResultCallback.
	 */
	function count(query:MongoDocument, options:CountOptions, callback:CountResultCallback) : Void;

	/**
	 * Creates an index on the db and collection collection.
	 * @param  fieldOrSpec - Defines the index.
	 * @param  options     - Optional settings.
	 * @param  callback    - The command result callback.
	 */
	function createIndex(fieldOrSpec:EitherType<String,MongoDocument>, options:IndexOptions, callback:ResultCallback<MongoCollection>) : Void;

	/**
	 * Creates multiple indexes in the collection, this method is only supported for MongoDB 2.6 or higher. 
	 * Earlier version of MongoDB will throw a command not supported error. Index specifications are defined 
	 * at http://docs.mongodb.org/manual/reference/command/createIndexes/.
	 * 
	 * @param  indexSpecs - An array of index specifications to be created.
	 * @param  callback   - The command result callback.
	 */
	function createIndexes(indexSpecs:Array<MongoDocument>, callback:ResultCallback<MongoResult>) : Void;

	/**
	 * Delete multiple documents on MongoDB.
	 * @param  filter   - The Filter used to select the documents to remove.
	 * @param  options  - Optional settings.
	 * @param  callback - The command result callback.
	 */
	function deleteMany(filter:MongoDocument, options:WriteOption, callback:ResultCallback<WriteOpResult>) : Void;

	/**
	 * Delete a document on MongoDB.
	 * @param  filter   - The Filter used to select the documents to remove.
	 * @param  options  - Optional settings.
	 * @param  callback - The command result callback.
	 */
	function deleteOne(filter:MongoDocument, options:WriteOption, callback:ResultCallback<WriteOpResult>) : Void;

	/**
	 * The distinct command returns returns a list of distinct values for the given key across a collection.
	 * @param  key      - Field of the document to find distinct values for.
	 * @param  query    - The query for filtering the set of documents to which we apply the distinct filter.
	 * @param  options  - Optional settings.
	 * @param  callback - The command result callback.
	 */
	function distinct(key:String, query:MongoDocument, options:ReadOption, callback:ResultCallback<MongoDocument>) : Void;

	/**
	 * Drop the collection from the database, removing it permanently. New accesses will create a new collection.
	 * @param  callback - The command result callback.
	 */
	function drop(callback:ResultCallback<MongoResult>) : Void;

	/**
	 * Drops an index from this collection.
	 * @param  indexName - Name of the index to drop.
	 * @param  options  - Optional settings.
	 * @param  callback - The command result callback.
	 */
	function dropIndex(indexName:String, options:WriteOption, callback:ResultCallback<MongoResult>) : Void;

	/**
	 * Drops all indexes from this collection.
	 * @param  callback - The command result callback.
	 */
	function dropIndexes(callback:ResultCallback<MongoResult>) : Void;

	/**
	 * Creates a cursor for a query that can be used to iterate over results from MongoDB.
	 * @param  query - The cursor query object.
	 */
	function find(query:MongoDocument) : MongoCursor;

	/**
	 * Fetches the first document that matches the query.
	 * @param  query    - The query for find operation.
	 * @param  options  - Optional settings.
	 * @param  callback - The command result callback.
	 */
	function findOne(query:MongoDocument, options:FindOneOptions, callback:ResultCallback<MongoDocument>) : Void;

	/**
	 * Find a document and delete it in one atomic operation, requires a write lock for the duration of the operation.
	 * @param  filter   - Document selection filter.
	 * @param  options  - Optional settings.
	 * @param  callback - The command result callback.
	 */
	function findOneAndDelete(filter:MongoDocument, options:FindOneAndDeleteOptions, callback:ResultCallback<MongoResult>) : Void;

	/**
	 * Find a document and replace it in one atomic operation, requires a write lock for the duration of the operation.
	 * @param  filter       - Document selection filter.
	 * @param  replacement  - Document replacing the matching document.
	 * @param  options      - Optional settings.
	 * @param  callback     - The command result callback.
	 */
	function findOneAndReplace(filter:MongoDocument, replacement:MongoDocument, options:FineOneAndUpdateOptions, callback:ResultCallback<MongoResult>) : Void;

	/**
	 * Find a document and replace it in one atomic operation, requires a write lock for the duration of the operation.
	 * @param  filter       - Document selection filter.
	 * @param  update       - Update operations to be performed on the document.
	 * @param  options      - Optional settings.
	 * @param  callback     - The command result callback.
	 */
	function findOneAndUpdate(filter:MongoDocument, update:MongoDocument, options:FineOneAndUpdateOptions, callback:ResultCallback<MongoResult>) : Void;

	/**
	 * Execute a geo search using a geo haystack index on a collection.
	 * @param  x            - Point to search on the x axis, ensure the indexes are ordered in the same order.
	 * @param  y            - Point to search on the y axis, ensure the indexes are ordered in the same order.
	 * @param  options      - Optional settings.
	 * @param  callback     - The command result callback.
	 */
	function geoHaystackSearch(x:Float, y:Float, options:GeoHaystackSearchOptions, callback:ResultCallback<MongoDocument>) : Void;

	/**
	 * Execute the geoNear command to search for items in the collection.
	 * @param  x            - Point to search on the x axis, ensure the indexes are ordered in the same order.
	 * @param  y            - Point to search on the y axis, ensure the indexes are ordered in the same order.
	 * @param  options      - Optional settings.
	 * @param  callback     - The command result callback.
	 */
	function geoNear(x:Float, y:Float, options:GeoNearOptions, callback:ResultCallback<MongoDocument>) : Void;

	/**
	 * Run a group command across a collection.
	 * @param  keys      - An object, array or code expressing the keys to group by.    
	 * @param  condition - An optional condition that must be true for a row to be considered.
	 * @param  initial   - Initial value of the aggregation counter object.
	 * @param  reduce    - The reduce code aggregates (reduces) the objects iterated
	 * @param  finalize  - Optional code to be run on each item in the result set just before the item is returned.
	 * @param  command   - Specify if you wish to run using the internal group command or using eval, default is true.
	 * @param  options      - Optional settings.
	 * @param  callback     - The command result callback.
	 */
	function group(keys:EitherType<MongoDocument,EitherType<Array<MongoDocument>,Code>>, condition:MongoDocument, initial:MongoDocument,
		           reduce:Code, finalize:Code, command:Bool, options:ReadOption, callback:ResultCallback<MongoDocument>) : Void;

	/**
	 * Retrieve all the indexes on the collection.
	 * @param  callback     - The command result callback.
	 */
	function indexes(callback:ResultCallback<MongoDocument>) : Void;

	/**
	 * Checks if one or more indexes exist on the collection, fails on first non-existing index.
	 * @param  indexes  - One or more index names to check.
	 * @param  callback     - The command result callback.
	 */
	function indexExists(indexes:EitherType<String,Array<String>>, callback:ResultCallback<MongoResult>) : Void;

	/**
	 * Retrieves this collections index info.
	 * @param  options      - Optional settings.
	 * @param  callback     - The command result callback.
	 */
	function indexInformation(options:IndexInfoOptions, callback:ResultCallback<MongoDocument>) : Void;

	/**
	 * Initiate an In order bulk write operation, operations will be serially executed in the order they are added, 
	 * creating a new operation for each switch in types.
	 * @param  options      - Optional settings.
	 * @param  callback     - The command result callback.
	 */
	function initializeOrderedBulkOp(options:WriteOption, callback:ResultCallback<OrderedBulkOperation>) : Void;

	/**
	 * Initiate a Out of order batch write operation. All operations will be buffered into insert/update/remove commands 
	 * executed out of order.
	 * @param  options      - Optional settings.
	 * @param  callback     - The command result callback.
	 */
	function initializeUnorderedBulkOp(options:WriteOption, callback:ResultCallback<js.node.mongodb.UnorderedBulkOperation>) : Void;

	/**
	 * Inserts an array of documents into MongoDB.
	 * @param  docs     - Documents to insert.
	 * @param  options      - Optional settings.
	 * @param  callback     - The command result callback.
	 */
	function insertMany(docs:Array<MongoDocument>, options:InsertOptions, callback:ResultCallback<WriteOpResult>) : Void;

	/**
	 * Inserts a single document into MongoDB.
	 * @param  doc     		- Document to insert.
	 * @param  options      - Optional settings.
	 * @param  callback     - The command result callback.
	 */
	function insertOne(doc:MongoDocument, options:InsertOptions, callback:ResultCallback<WriteOpResult>) : Void;

	/**
	 * Returns if the collection is a capped collection.
	 * @param  callback     - The command result callback.
	 */
	function isCapped(callback:ResultCallback<MongoResult>) : Void;

// TODO
	function listIndexes(options:BatchOptions) : js.node.mongodb.CommandCursor;


	var insert:Dynamic;
	var update:Dynamic;
	var remove:Dynamic;


} // End of MongoCollection class

//
// Additional types.
//

typedef CollectionWriteConcern = WriteSyncOption;


typedef WriteOption =
{
	/**
	 *  { Number / String, > -1 || ‘majority’ || tag name } the write concern for the operation where <1 
	 *  is no acknowlegement of write and w >= 1, w = ‘majority’ or tag acknowledges the write
	 */
	@:optional var w : EitherType<String,Int>;
	
	/** Set the timeout for waiting for write concern to finish (combines with w option). */
	@:optional var wtimeout : Int;
	
	/** Write waits for journal sync before returning. */
	@:optional var j : Bool;
}


typedef WriteSyncOption =
{
	>WriteOption,

	/** Specify a file sync write concern. */
	@:optional var fsync : Bool;
}


typedef ReadOption =
{
	/** 
	 * The preferred read preference (ReadPreference.PRIMARY, ReadPreference.PRIMARY_PREFERRED, 
	 * ReadPreference.SECONDARY, ReadPreference.SECONDARY_PREFERRED, ReadPreference.NEAREST).
	 */
	@:optional var readPreference : EitherType<String,ReadPreference>;
}


typedef AggregateOptions =
{
	>ReadOption,

	/** 
	 * Return the query as cursor, on 2.6 > it returns as a real cursor 
	 * on pre 2.6 it returns as an emulated cursor.  Can be null.
	 */
	@:optional var cursor : BatchOptions;
	
	/** Explain returns the aggregation execution plan (requires mongodb 2.6 >). */
	@:optional var explain : Bool;
	
	/** 
	 * Lets the server know if it can use disk to store temporary results for the 
	 * aggregation (requires mongodb 2.6 >).
	 */
	@:optional var allowDiskUse : Bool;

	/** 
	 * Specifies a cumulative time limit in milliseconds for processing operations 
	 * on the cursor. MongoDB interrupts the operation at the earliest following 
	 * interrupt point.
	 */
	@:optional var maxTimeMS : Int;
}


typedef BatchOptions = 
{
	/** The batchSize for the cursor */
	@:optional var batchSize : Int;
}


typedef BulkWriteOptions =
{
	>WriteOption,

	/** Serialize functions on the document. */
	@:optional var serializeFunctions 	: Bool;	
}


typedef CountOptions = 
{
	>ReadOption,

	/** The limit of documents to count. */
	@:optional var limit : Int;

	/** The number of documents to skip for the count. */
	@:optional var skip : Int;

	/** An index name hint for the query. */
	@:optional var hint : String;
}


typedef IndexOptions = 
{	
	>WriteOption,

	/** Creates an unique index. */
	@:optional var unique : Bool; 

	/** Creates a sparse index.	 */
	@:optional var sparse : Bool; 
	
	/** Creates the index in the background, yielding whenever possible. */
	@:optional var background : Bool; 

	/**
	 * A unique index cannot be created on a key that has pre-existing duplicate values.  If you would like to 
	 * create the index anyway, keeping the first document the database indexes and deleting all subsequent 
	 * documents that have duplicate value	
	 */
	@:optional var dropDups : Bool; 
	
	/** For geospatial indexes set the lower bound for the co-ordinates. */
	@:optional var min : Int; 

	/** for geospatial indexes set the high bound for the co-ordinates.	*/
	@:optional var max : Int; 
	
	/** Specify the format version of the indexes. */
	@:optional var v : Int; 

	/** Allows you to expire data on indexes applied to a data (MongoDB 2.2 or higher). */
	@:optional var expireAfterSeconds : Int; 

	/** Override the autogenerated index name (useful if the resulting name is larger than 128 bytes). */
	@:optional var name : String; 
}


typedef FindOneOptions =
{
	>ReadOption,

	/** Sets the limit of documents returned in the query. */
	@:optional var limit : Int;

	/** Set to sort the documents coming back from the query. Array of indexes, [['a', 1]] etc. */
	@:optional var sort : EitherType<MongoDocument,Array<MongoDocument>>;

	/** The fields to return in the query. Object of fields to include or exclude (not both), {'a':1} */
	@:optional var fields : MongoDocument;

	/** Set to skip N documents ahead in your query (useful for pagination). */
	@:optional var skip : Int;

	/** Tell the query to use specific indexes in the query. Object of indexes to use, {'_id':1} */
	@:optional var hint : MongoDocument;

	/** Explain the query instead of returning the data. */
	@:optional var explain : Bool;

	/** Snapshot query. */
	@:optional var snapshot : Bool;

	/** Specific if the cursor can timeout. */
	@:optional var timeout : Bool;

	/** Specify if the cursor is tailable. */
	@:optional var tailable : Bool;

	/** Set the batchSize for the getMoreCommand when iterating over the query results. */
	@:optional var batchSize : Int;

	/** Only return the index key. */
	@:optional var returnKey : Bool;

	/** Limit the number of items to scan. */
	@:optional var maxScan : Int;

	/** Set index bounds. */
	@:optional var min : Int;

	/** Set index bounds. */
	@:optional var max : Int;

	/** Show disk location of results. */
	@:optional var showDiskLoc : Bool;

	/** You can put a $comment field on a query to make looking in the profiler logs simpler. */
	@:optional var comment : String;

	/** Return all BSON documents as Raw Buffer documents. */
	@:optional var raw : Bool;

	/** Specify if the cursor should return partial results when querying against a sharded system. */
	@:optional var partial : Bool;

	/** Number of miliseconds to wait before aborting the query. */
	@:optional var maxTimeMS : Int;

} // End of FindOneOptions


typedef FindOneAndDeleteOptions =
{
	/** Limits the fields to return for all matching documents. */
	@:optional var projection : MongoDocument;

	/** Determines which document the operation modifies if the query selects multiple documents. */
	@:optional var sort : MongoDocument;

	/** The maximum amount of time to allow the query to run. */
	@:optional var maxTimeMS : Int;
}


typedef FineOneAndUpdateOptions = 
{
	>FindOneAndDeleteOptions,

	/** Upsert the document if it does not exist. */
	@:optional var upsert : Bool;	

	/** When false, returns the updated document rather than the original. The default is true. */
	@:optional var returnOriginal : Bool;
}


typedef GeoHaystackSearchOptions = 
{
	>ReadOption,

	/** Include results up to maxDistance from the point. */
	@:optional var maxDistance : Int;

	/** Filter the results by a query. */
	@:optional var search : MongoDocument;

	/** Max number of results to return. */
	@:optional var limit : Int;
}


typedef GeoNearOptions =
{
	>ReadOption,

	/** Max number of results to return. */
	@:optional var num : Int;

	/** Include results starting at minDistance from a point (2.6 or higher) */
	@:optional var minDistance : Int;

	/** Include results up to maxDistance from the point. */
	@:optional var maxDistance : Int;

	/** Include a value to multiply the distances with allowing for range conversions. */
	@:optional var distanceMultiplier : Int;

	/** Filter the results by a query. */
	@:optional var query : MongoDocument;

	/** Perform query using a spherical model. */
	@:optional var spherical : Bool;

	/** The closest location in a document to the center of the search region will always be returned MongoDB > 2.X. */
	@:optional var uniqueDocs : Bool;

	/** Include the location data fields in the top level of the results MongoDB > 2.X. */
	@:optional var includeDocs : Bool;
}


typedef IndexInfoOptions =
{
	/** Returns the full raw index information. */
	@:optional var full : Bool;
}


typedef InsertOptions =
{
	>WriteOption,

	/** Serialize functions on any object. */
	@:optional var serializeFunctions : Bool;

	/** Force server to assign _id values instead of driver. */
	@:optional var forceServerObjectId : Bool;
}


typedef MapReduceOptions =
{
	>ReadOption,

	/**
	 * Sets the output target for the map reduce job. 
	 * {inline:1} | {replace:'collectionName'} | {merge:'collectionName'} | {reduce:'collectionName'}
	 */
	@:optional var out : MongoDocument;	

	/** Query filter object. */
	@:optional var query : MongoDocument;

	/** Sorts the input objects using this key. Useful for optimization, like sorting by the emit key for fewer reduces. */
	@:optional var sort : MongoDocument;

	/** Number of objects to return from collection. */
	@:optional var limit : Int;

	/** Keep temporary data. */
	@:optional var keeptemp : Bool;

	/** Finalize function. */
	@:optional var finalize : Bool;

	/** Can pass in variables that can be access from map/reduce/finalize. */
	@:optional var scope : MongoDocument;

	/** It is possible to make the execution stay in JS. Provided in MongoDB > 2.0.X. */
	@:optional var jsMode : Bool;

	/** Provide statistics on job execution time. */
	@:optional var verbose : Bool;
}


typedef ParallelCollectionScanOptions =
{
	>ReadOption,
	>BatchOptions,

	/** 
	 * The maximum number of parallel command cursors to return (the number of returned cursors 
	 * will be in the range 1:numCursors).
	 */
	@:optional var numCursors : Int;

	/** Return all BSON documents as Raw Buffer documents. */
	@:optional var raw : Bool;
}


typedef RenameOptions =
{
	/** Drop the target name collection if it previously exists. */
	@:optional var dropTarget : Bool;
}


typedef ReplaceOneOptions = 
{
	>WriteOption,

	/** Update operation is an upsert. */
	@:optional var upsert : Bool;
}


typedef StatsOptions = 
{
	/** Divide the returned sizes by scale value. */
	@:optional var scale : Int;
}


typedef UpdateOptions = ReplaceOneOptions;


/**
 * Result object returned by several Collection methods.
 */
extern class BulkWriteOpResult
{
	/** Number of documents inserted. */
	var insertCount(default,null) : Int; 

	/** Number of documents matched for update. */
	var matchedCount(default,null) : Int; 

	/** Number of documents modified. */
	var modifiedCount(default,null) : Int; 

	/** Number of documents deleted. */
	var deletedCount(default,null) : Int;

	/** Number of documents upserted. */
	var upsertedCount(default,null) : Int;

	/** Inserted document generated Id's, hash key is the index of the originating operation. */
	var insertedIds(default,null) : Dynamic;
	
	/** Upserted document generated Id's, hash key is the index of the originating operation. */
	var upsertedIds(default,null) : Dynamic; 

	/** The command result object. */
	var result(default,null) : MongoResult;
}

/**
 * Result object returned by several Collection methods.
 */
extern class WriteOpResult
{
	/**
	 * All the documents inserted using insertOne/insertMany/replaceOne. 
	 * Documents contain the _id field if forceServerObjectId == false for insertOne/insertMany.
	 */
	var ops(default,null) : Array<MongoDocument>;

	/** The connection object used for the operation. */
	var connection(default,null) : Dynamic;

	/** The command result object. */
	var result(default,null) : MongoResult;
}