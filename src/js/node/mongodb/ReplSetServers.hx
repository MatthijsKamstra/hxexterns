package js.node.mongodb;
import js.node.http.Server;
import js.node.mongodb.MongoOption.MongoReplSetOption;
import js.node.mongodb.MongoOption.MongoServerOption;

/**
 * Set of Replica Servers.
 * @author Eduardo Pons - eduardo@thelaborat.org
 */
@:jsRequire("mongodb", "ReplSetServers")
extern class ReplSetServers
{

	/**
	 * ReplSet constructor provides replicaset functionality
	 */
	@:overload(function(p_list:Array<Server>):Void{})
	function new(p_list : Array<Server>,p_option:MongoReplSetOption);
	
	/**
	 * Creates a new server for the <code>replset</code> based on <code>host</code>.
	 * @param	p_host
	 * @param	p_replset
	 * @return
	 */
	function createServer(p_host : String,p_replset : ReplSetServers):Server;
}