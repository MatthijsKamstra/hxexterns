package js.node.mongodb;

import haxe.extern.EitherType;
import js.node.events.EventEmitter;
import js.node.mongodb.MongoCallback.ResultCallback;
import js.node.mongodb.MongoCallback.ToArrayResultCallback;
import js.node.mongodb.MongoDocument.MongoDocument;
import js.node.mongodb.MongoDocument.MongoResult;
import js.node.stream.Readable.IReadable;
import js.node.stream.Writable.IWritable;

/**
 * The CommandCursor class is an internal class that embodies a  generalized 
 * cursor based on a MongoDB command allowing for iteration over the results 
 * returned. It supports one by one document iteration, conversion to an 
 * array or can be iterated as a Node 0.10.X or higher stream.
 */
@:jsRequire("mongodb", "CommandCursor")
extern class CommandCursor extends EventEmitter<CommandCursor> implements IReadable
{
	/**
	 * Set the batch size for the cursor.
	 * @param  value - The batchSize for the cursor.
	 * @return this
	 */
	function batchSize(value:Int) : CommandCursor;

	/**
	 * Clone the cursor.
	 * @return CommandCursor
	 */
	function clone() : CommandCursor;

	/**
	 * Close the cursor, sending a KillCursor command and emitting close.
	 * @param  callback - The command result callback.
	 */
	function close(callback:ResultCallback<MongoResult>) : Void;

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
	function maxTimeMS(value:Int) : CommandCursor;

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

} // End of CommandCursor class

