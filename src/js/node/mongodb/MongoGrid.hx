package js.node.mongodb;

/**
 * A class representation of a simple Grid interface.
 * @author Eduardo Pons - eduardo@thelaborat.org
 */
@:jsRequire("mongodb", "Grid")
extern class MongoGrid
{
	
	/**
	 * Creates a new Grid.
	 * @param	p_database
	 * @param	p_fs_name
	 */
	function new(p_database:MongoDatabase,p_fs_name:String):Void;

	var put		: Dynamic;
	var get     : Dynamic;
	var delete  : Dynamic;
	
	
}