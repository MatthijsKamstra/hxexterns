package js.node.mongodb;
import haxe.extern.EitherType;
import js.node.Buffer;

/**
 * A class representation of the BSON Binary type.
 */
@:jsRequire("mongodb", "Binary")
extern class Binary
{
	/**
	 * 0	Default BSON type
	 */
	static var SUBTYPE_DEFAULT			:Int;
	
	/**
	 * 1	Function BSON type
	 */
	static var SUBTYPE_FUNCTION			:Int;
	
	/**
	 * 2	Byte Array BSON type
	 */
	static var SUBTYPE_BYTE_ARRAY		:Int;
	
	/**
	 * 3	OLD UUID BSON type
	 */
	static var SUBTYPE_UUID_OLD			:Int;
	
	/**
	 * 4	UUID BSON type
	 */
	static var SUBTYPE_UUID				:Int;
	
	/**
	 * 5	MD5 BSON type
	 */
	static var SUBTYPE_MD5				:Int;
	
	/**
	 * 128	User BSON type
	 */
	static var SUBTYPE_USER_DEFINED		:Int; 

	/**
	 * The length of the binary.
	 * @return Int
	 */
	function length() : Int;
	
	/**
	 * Updates this binary with byte_value.
	 * @param	byte_value - a single byte we wish to write.
	 */
	function put(byte_value:EitherType<String,Int>) : Void;
	
	/**
	 * Writes a buffer or string to the binary.
	 * @param	position - read from the given position in the Binary.
	 * @param	length - the number of bytes to read.
	 * @return js.node.Buffer
	 */
	function read(position:Int, length:Int) : Buffer;
	
	/**
	 * Returns the value of this binary as a string.
	 * @return String
	 */
	function value() : String;
	
	/**
	 * Writes a buffer or string to the binary.
	 * @param	value - a string or buffer to be written to the Binary BSON object.
	 * @param	offset - specify where to write the content.
	 */
	function write(value:EitherType<String,Buffer>, offset:Int):Void;
	
} // End of Binary class