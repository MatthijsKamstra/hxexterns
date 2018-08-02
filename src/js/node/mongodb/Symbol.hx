package js.node.mongodb;

/**
 * A class representation of the BSON Symbol type.
 * @author Eduardo Pons - eduardo@thelaborat.org
 */
@:jsRequire("mongodb", "Symbol")
extern class Symbol
{
	
	/**
	 * A class representation of the BSON Symbol type.
	 * @param	v
	 */
	function new(v:String):Void;
	
	/**
	 * Access the wrapped string value.
	 * @return
	 */
	function valueOf():String;
	
	
}