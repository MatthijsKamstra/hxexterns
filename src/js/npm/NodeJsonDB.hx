package js.npm;

import haxe.extern.EitherType;
import haxe.Constraints.Function;

/**
 * source: https://github.com/Belphemur/node-json-db
 * version: "0.7.3",
 */

@:native('JsonDB')
@:jsRequire("node-json-db")
extern class NodeJsonDB {

	/**
	 * [new description]
	 * @param  path            [description]
	 * @param  isAutoSave      [description] (default true)
	 * @param  isHumanReadable [description] (default false)
	 * @return                 [description]
	 */
	function new(path:String, isAutoSave:Bool = true, isHumanReadable:Bool = false):Void;

	/**
	 * [push description]
	 * @param  path       [description]
	 * @param  value      [description]
	 * @param  isOverride [description]  (default false)
	 * @return            [description]
	 */
	@:overload(function(path:String, value:String, isOverride:Bool = true):Void { })
	@:overload(function(path:String, value:Float, isOverride:Bool = true):Void { })
	function push(path:String, value:Dynamic, isOverride:Bool = true):Void;

	// From a particular DataPath
	/**
	 * [getData description]
	 * @param  path [description]
	 * @return      [description]
	 */
	function getData(path:String):Dynamic;

	// Deleting data
	/**
	 * [delete description]
	 * @param  path [description]
	 * @return      [description]
	 */
    function delete(path:String):Void;

    // Save the data (useful if you disable the saveOnPush)
    /**
     * [save description]
     * @return [description]
     */
    function save():Void;

    // In case you have a exterior change to the databse file and want to reload it
    // use this method
    /**
     * [reload description]
     * @return [description]
     */
    function reload():Void;
}

@:native('JsonDB')
@:jsRequire("node-json-db")
extern class JsonDB extends NodeJsonDB { }