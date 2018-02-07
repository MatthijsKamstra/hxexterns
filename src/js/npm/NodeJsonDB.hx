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
     * Create the JSON database
     * @param filename where to save the data base
     * @param saveOnPush saving on modification of the data
     * @param humanReadable is the json file humand readable
     * @returns {JsonDB}
     */
	function new(filename:String, saveOnPush:Bool = true, humanReadable:Bool = false):Void;

    /**
     * Pushing data into the database
     * @param dataPath path leading to the data
     * @param data data to push
     * @param isOverride overriding or not the data, if not, it will merge them
     */
	@:overload(function(dataPath:String, data:String, isOverride:Bool = true):Void { })
	@:overload(function(dataPath:String, data:Float, isOverride:Bool = true):Void { })
	function push(dataPath:String, data:Dynamic, isOverride:Bool = true):Void;

	// From a particular Datafilename
    /**
     * Get the deta stored in the data base
     * @param dataPath path leading to the data
     * @returns {*}
     */
	function getData(dataPath:String):Dynamic;

	// Deleting data
    /**
     * Delete the data
     * @param dataPath path leading to the data
     */
    function delete(dataPath:String):Void;

    // Save the data (useful if you disable the saveOnPush)
    /**
     * Manually save the database
     * By default you can't save the database if it's not loaded
     * @param force force the save of the database
     */
    function save():Void;

    // In case you have a exterior change to the databse file and want to reload it
    // use this method
    /**
     * Reload the database from the file
     * @returns {*}
     */
    function reload():Void;

        /**
     * Manually load the database
     * It is automatically called when the first getData is done
     */
    function load ():Void;
}

@:native('JsonDB')
@:jsRequire("node-json-db")
extern class JsonDB extends NodeJsonDB { }