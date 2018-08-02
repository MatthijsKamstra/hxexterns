package js.node.mongodb;
import js.node.events.EventEmitter;

/**
 * Container class for ReadStreamEvent types.
 */
class CursorStreamEvent
{
	/**
	 * {function(item) { }} the data event triggers when a document is ready.
	 */
	static public var Data  : String = "data";  	
	/**
	 * {function() {}} the close event triggers when the stream is closed.
	 */
	static public var Close : String = "close"; 
	/**
	 * {function(err) {}} the error event triggers if an error happens.
	 */
	static public var Error : String = "error"; 
}

/**
 * Stream interface for a cursor.
 * @author Eduardo Pons - eduardo@thelaborat.org
 */
@:jsRequire("mongodb", "CursorStream")
extern class CursorStream extends EventEmitter<CursorStream>
{
	
	/**
	 * Creates stream interface for the cursor.
	 * @param	p_cursor
	 */
	function new(p_cursor:MongoCursor):Void;
	
	
}