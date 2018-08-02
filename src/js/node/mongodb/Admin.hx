package js.node.mongodb;

import haxe.extern.EitherType;
import js.node.mongodb.MongoCallback.ResultCallback;
import js.node.mongodb.MongoDocument.MongoResult;
import js.node.mongodb.MongoError;

/**
 * Allows the user to access the admin functionality of MongoDB
 */
@:jsRequire("mongodb", "Admin")
extern class Admin
{
	/**
	 * Add a user to the database.
	 * @param username - the user name
	 * @param password - the password
	 * @param options - MongoAddUserOption struct
	 * @param callback - callback of type ResultCallback
	 */
	function addUser(username:String, password:String, options:AddUserOptions, callback:ResultCallback<MongoResult>) : Void;

	/**
	 * Authenticate a user against the server.
	 * @param username - the user name
	 * @param password - the password
	 * @param callback - callback of type ResultCallback
	 */
	function authenticate(username:String, password:String, callback:ResultCallback<MongoResult>) : Void;

	/**
	 * Retrieve the server information for the current instance of the db client.
	 * @param callback - callback of type ResultCallback
	 */
	function buildInfo(callback:ResultCallback<MongoResult>) : Void;

	/**
	 * Execute a command.
	 * @param command - the command hash
	 * @param options - MongoCommandOption struct
	 * @param callback - callback of type ResultCallback
	 */
	function command(command:Dynamic, options:CommandOptions, callback:ResultCallback<MongoResult>) : Void;
	
	/**
	 * List the available databases.
	 * @param callback - callback of type ResultCallback
	 */
	function listDatabases(callback:ResultCallback<MongoResult>) : Void;

	/**
	 * Logout user from server, fire off on all connections and remove all auth info.
	 * @param callback - callback of type ResultCallback
	 */
	function logout(callback:ResultCallback<MongoResult>) : Void;

	/**
	 * Ping the MongoDB server and retrieve results.
	 * @param callback - callback of type ResultCallback
	 */
	function ping(callback:ResultCallback<MongoResult>) : Void;

	/**
	 * Retrieve the current profiling information for MongoDB.
	 * @param callback - callback of type ResultCallback
	 */
	function profilingInfo(callback:ResultCallback<MongoResult>) : Void;

	/**
	 * Retrieve the current profiling Level for MongoDB.
	 * @param callback - callback of type ResultCallback
	 */
	function profilingLevel(callback:ResultCallback<MongoResult>) : Void;

	/**
	 * Remove a user from a database.
	 * @param username - the user name
	 * @param options - MongoRemoveUserOption struct
	 * @param callback - callback of type ResultCallback
	 */
	function removeUser(username:String, options:RemoveUserOptions, callback:ResultCallback<MongoResult>) : Void;

	/**
	 * Get ReplicaSet status.
	 * @param callback - callback of type ResultCallback
	 */
	function replSetGetStatus(callback:ResultCallback<MongoResult>) : Void;

	/**
	 * Retrieve the server information for the current instance of the db client.
	 * @param callback - callback of type ResultCallback
	 */
	function serverInfo(callback:ResultCallback<MongoResult>) : Void;

	/**
	 * Retrieve this db's server status.
	 * @param callback - callback of type ResultCallback
	 */
	function serverStatus(callback:ResultCallback<MongoResult>) : Void;

	/**
	 * Set the current profiling level of MongoDB.
	 * @param level    - The new profiling level ('off', 'slow_only', 'all').
	 * @param callback - callback of type ResultCallback
	 */
	function setProfilingLevel(level:String, callback:ResultCallback<MongoResult>) : Void;

	/**
	 * Validate an existing collection.
	 * @param  collectionName - The name of the collection to validate.
	 * @param  options        - Optional settings.
	 * @param callback - callback of type ResultCallback
	 */
	function validateCollection(collectionName:String, options:Dynamic, callback:ResultCallback<MongoResult>) : Void;
	
} // End of Admin class

//
// Additional types
//

typedef AddUserOptions =
{
	>js.node.mongodb.MongoCollection.WriteSyncOption,

	/** Custom data associated with the user (only Mongodb 2.6 or higher). */
	@:optional var customData(default,default)	: Dynamic;			

	/** Roles associated with the created user (only Mongodb 2.6 or higher). */
	@:optional var roles(default,default) : Array<Dynamic>;	
}


typedef CommandOptions =
{
	>js.node.mongodb.MongoCollection.ReadOption,

	/**
	 * {Number}, number of milliseconds to wait before aborting the query.
	 */
	@:optional var maxTimeMS : Int;	
}


typedef RemoveUserOptions = js.node.mongodb.MongoCollection.WriteSyncOption;

