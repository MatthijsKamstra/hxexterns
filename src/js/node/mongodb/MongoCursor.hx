package js.node.mongodb;

import haxe.extern.EitherType;
import js.node.events.EventEmitter;
import js.node.mongodb.MongoCallback.CountResultCallback;
import js.node.mongodb.MongoCallback.ResultCallback;
import js.node.mongodb.MongoCallback.ToArrayResultCallback;
import js.node.mongodb.MongoDocument.MongoResult;
import js.node.mongodb.MongoCollection.CountOptions;
import js.node.mongodb.ReadPreference;
import js.node.stream.Readable;
import js.node.stream.Writable.IWritable;

/**
 * The **Cursor** class is an internal class that embodies a cursor on MongoDB
 * allowing for iteration over the results returned from the underlying query. It supports
 * one by one document iteration, conversion to an array or can be iterated as a Node 0.10.X
 * or higher stream.
 */
@:jsRequire("mongodb", "Cursor")
extern class MongoCursor extends EventEmitter<MongoCursor> implements IReadable
{
	/** Cursor query sort setting. */
	var sortValue(default,null) : String;

	/** Is Cursor able to time out. */
	var timeout(default,null) : Bool;

	/** Get cursor ReadPreference. */
	var readPreference(default,null) : ReadPreference;

	/**
	 * Add a cursor flag to the cursor.
	 * @param flag  - The flag to set, must be one of following:
	 *                ['tailable', 'oplogReplay', 'noCursorTimeout', 'awaitData', 'exhaust', 'partial'].
	 * @param value - the flag's boolean value.
	 * @return this
	 */
	function addCursorFlag(flag:String, value:Bool) : MongoCursor;

	/**
	 * Add a query modifier to the cursor query.
	 * @param name  - The query modifier (must start with $, such as $orderby etc).
	 * @param value - The flag boolean value.
	 * @return this
	 */
	function addQueryModifier(name:String, value:Bool) : MongoCursor;

	/**
	 * Set the batch size for the cursor.
	 * @param  value - The batchSize for the cursor.
	 * @return this
	 */
	function batchSize(value:Int) : MongoCursor;

	/**
	 * Clone the cursor.
	 * @return MongoCursor
	 */
	function clone() : MongoCursor;

	/**
	 * Close the cursor, sending a KillCursor command and emitting close.
	 * @param  callback - The command result callback.
	 */
	function close(callback:ResultCallback<MongoResult>) : Void;

	/**
	 * Add a comment to the cursor query allowing for tracking the comment in the log.
	 * @param  value - The comment attached to this query.
	 * @return this
	 */
	function comment(value:String) : MongoCursor;

	/**
	 * Get the count of documents for this cursor.
	 * @param  applySkipLimit - Should the count command apply limit and skip settings on the
	 *                          cursor or in the passed in options.
	 * @param  options        - Optional settings.
	 * @param  callback       - the result callback.
	 */
	function count(applySkipLimit:Bool, options:CursorCountOptions, callback:CountResultCallback) : Void;

	/**
	 * [cursorLimit description] xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	 * @param  value [description]
	 * @return       [description]
	 */
	function cursorLimit(value:Int) : Void;



	/**
	 * Iterates over all the documents for this cursor. As with {cursor.toArray},
	 * not all of the elements will be iterated if this cursor had been previouly
	 * accessed. In that case, {cursor.rewind} can be used to reset the cursor.
	 * However, unlike {cursor.toArray}, the cursor will only hold a maximum of
	 * batch size elements at any given time if batch size is specified. Otherwise,
	 * the caller is responsible for making sure that the entire result can fit in
	 * memory.
	 *
	 * @param  callback - The command result callback.
	 */
	function each(callback:ResultCallback<MongoDocument>) : Void;

	/**
	 * Is the cursor closed.
	 * @return Bool
	 */
	function isClosed() : Bool;

	/**
	 * Add a maxTimeMS stage to the aggregation pipeline.
	 * @param  value - The state maxTimeMS value.
	 * @return this
	 */
	function maxTimeMS(value:Int) : MongoCursor;

	/**
	 * Get the next available document from the cursor, returns null if no more
	 * documents are available.
	 *
	 * @param  callback - The command result callback.
	 */
	function next(callback:ResultCallback<MongoDocument>) : Void;

	/**
	 * Resets the cursor.
	 * @return this
	 */
	function rewind() : CommandCursor;

	/**
	 * Set the new batch size of the cursor.
	 * @param value - the new batch size for the cursor.
	 */
	function setBatchSize(value:Int) : Void;

	/**
	 * Returns an array of documents. The caller is responsible for making sure
	 * that there is enough memory to store the results. Note that the array only
	 * contain partial results when this cursor had been previouly accessed.
	 *
	 * @param  callback - The command result callback.
	 */
	function toArray(callback:ToArrayResultCallback<MongoDocument>) : Void;

	//
	// IReadable.
	//
    function read(?size:Int):Null<EitherType<String,Buffer>>;
    function setEncoding(encoding:String):Void;
    function resume():Void;
    function pause():Void;
    function pipe<T:IWritable>(destination:T, ?options:{?end:Bool}):T;
    @:overload(function():Void {})
    function unpipe(destination:IWritable):Void;
    @:overload(function(chunk:Buffer):Void {})
    function unshift(chunk:String):Void;
    function wrap(stream:Dynamic):IReadable;

} // End of MongoCursor class

//
// Additional types.
//

typedef CursorCountOptions =
{
	>CountOptions,

	/** Number of miliseconds to wait before aborting the query. */
	maxTimeMS : Int
}
