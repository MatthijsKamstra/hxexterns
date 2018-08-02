package js.node.mongodb;

import js.node.events.EventEmitter;
import js.node.mongodb.MongoCallback.ResultCallback;
import js.node.mongodb.MongoCallback.ToArrayResultCallback;
import js.node.mongodb.MongoDocument;
import js.node.mongodb.MongoDocument.MongoResult;
import js.node.mongodb.MongoError;
import js.node.stream.Readable;



/**
 * The **AggregationCursor** class is an internal class that embodies an aggregation cursor on MongoDB
 * allowing for iteration over the results returned from the underlying query. It supports
 * one by one document iteration, conversion to an array or can be iterated as a Node 0.10.X 
 * or higher stream
 */
extern class AggregationCursor extends Readable<AggregationCursor>
{
	/**
	 * Set the batch size for the cursor.
	 * @param  value - The batchSize for the cursor.
	 * @return this
	 */
	function batchSize(value:Int) : AggregationCursor;

	/**
	 * Clone the cursor.
	 * @return AggregationCursor
	 */
	function clone() : AggregationCursor;

	/**
	 * Close the cursor, sending a AggregationCursor command and emitting close.
	 * @param  callback - callback of type ResultCallback
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
	 * @param  callback - callback of type ResultCallback
	 */
	function each(callback:ResultCallback<MongoResult>) : Void;

	/**
	 * Execute the explain for the cursor.
	 * @param  callback - callback of type ResultCallback
	 */
	function explain(callback:ResultCallback<MongoResult>) : Void;

	/**
	 * Add a geoNear stage to the aggregation pipeline.
	 * @param  document - a document struct
	 * @return this
	 */
	function geoNear(document:MongoDocument) : AggregationCursor;

	/**
	 * Add a group stage to the aggregation pipeline.
	 * @param  document - a document struct
	 * @return this
	 */
	function group(document:MongoDocument) : AggregationCursor;

	/**
	 * Is the cursor closed.
	 * @return Bool
	 */
	function isClosed() : Bool;

	/**
	 * Add a limit stage to the aggregation pipeline.
	 * @param  value - the state limit value.
	 * @return this
	 */
	function limit(value:Int) : AggregationCursor;

	/**
	 * Add a match stage to the aggregation pipeline.
	 * @param  document - a document struct
	 * @return this
	 */
	function match(document:MongoDocument) : AggregationCursor;

	/**
	 * Add a maxTimeMS stage to the aggregation pipeline.
	 * @param  value - The state maxTimeMS value.
	 * @return this
	 */
	function maxTimeMS(value:Int) : AggregationCursor;

	/**
	 * Get the next available document from the cursor, returns null if no more documents are available.
	 * @param  callback - callback of type ResultCallback
	 */
	function next(callback:ResultCallback<MongoResult>) : Void;

	/**
	 * Add a out stage to the aggregation pipeline.
	 * @param  destination - the destination name.
	 * @return this
	 */
	function out(destination:String) : AggregationCursor;

	/**
	 * Add a project stage to the aggregation pipeline
	 * @param  document - the project stage document.
	 * @return this
	 */
	function project(document:MongoDocument) : AggregationCursor;

	/**
	 * Add a redact stage to the aggregation pipeline
	 * @param  document - the redact stage document.
	 * @return this
	 */
	function redact(document:MongoDocument) : AggregationCursor;

	/**
	 * Resets the cursor.
	 */
	function rewind() : Void;

	/**
	 * Set the new batchSize of the cursor.
	 * @param value - the new batchSize for the cursor
	 */
	function setBatchSize(value:Int) : Void;

	/**
	 * Add a skip stage to the aggregation pipeline.
	 * @param  value - the state skip value
	 * @return this
	 */
	function skip(value:Int) : AggregationCursor;

	/**
	 * Add a sort stage to the aggregation pipeline.
	 * @param  document - the sort stage document
	 * @return this
	 */
	function sort(document:MongoDocument) : AggregationCursor;

	/**
	 * Returns an array of documents. The caller is responsible 
	 * for making sure that there is enough memory to store the 
	 * results. Note that the array only contain partial results 
	 * when this cursor had been previouly accessed. In that case, 
	 * cursor.rewind() can be used to reset the cursor.
	 * 
	 * @param  callback - callback of type ToArrayCallback<MongoDocument>
	 */
	function toArray(callback:ToArrayResultCallback<MongoDocument>) : Void;

	/**
	 * Add a unwind stage to the aggregation pipeline.
	 * @param  field - the unwind field name
	 * @return this
	 */
	function unwind(field:String) : AggregationCursor;

} // End of AggregationCursor class