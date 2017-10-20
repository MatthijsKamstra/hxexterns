package js.npm;

import js.node.events.EventEmitter;
import js.npm.AST;

// @:native('ws')
extern class SlackClient
implements npm.Package.Require<"slack-client","^1.4.1">
extends EventEmitter 
{
	public var host : String;

	public function new( token : String, autoReconnect : Bool = true, autoMark : Bool = true ) : Void;
	

	public function login () : Dynamic;
	public function connect () : Dynamic;
	public function disconnect () : Bool;
	public function reconnect () : Dynamic;

	public function joinChannel (name:String, callback:Dynamic) : Dynamic;
	public function openDM (user_id:String, callback:Dynamic) : Dynamic;

	public function createGroup (name:String, callback:Dynamic) : Dynamic;

	/**
	 * `away` or `active`
	 * @param presence [description]
	 * @param callback [description]
	 */
	public function setPresence (presence:String, callback:Dynamic): Void;

	public function setActive (callback:Dynamic): Void;
	public function setStatus (status:String, callback:Dynamic): Void;


	public var token : String;
	public var autoReconnect : Bool;
	public var autoMark : Bool;
	public var authenticated : Bool;
	public var connected : Bool;
	public var socketUrl : String;

	// public var data : Dynamic;
	public var data : AST.RespondsRtmStart;

	// public var data(get_data, set_data):AST.RespondsRtmStart;
	// private var _data:AST.RespondsRtmStart;
	
	// function get_data():AST.RespondsRtmStart {
	// 	return _data;
	// }
	// function set_data(value:AST.RespondsRtmStart):AST.RespondsRtmStart {
	// 	return _data = value;
	// }


	public var self : Dynamic; // null
	// public var self : Self; // null
	public var team : Dynamic; // null;
	public var channels : Dynamic; // {};
	// public var channels : Array<Channel>; // {};
	public var dms : Dynamic; // {};
	public var groups : Dynamic;  //{};
	public var users : Dynamic; // {};
	public var bots : Dynamic; // {};


	public function getUserByID (id:String) : Dynamic;
	public function getUserByName (name:String) : Dynamic;

	public function getChannelByID (id:String) : Channel;
	public function getChannelByName (name:String) : Channel;

	public function getDMByID (id:String) : Dynamic;
	public function getDMByName (name:String) : Dynamic;

	public function getGroupByID (id:String) : Dynamic;
	public function getGroupByName (name:String) : Dynamic;

	public function getChannelGroupOrDMByID (id:String) : Dynamic;
	public function getChannelGroupOrDMByName (name:String) : Dynamic;

	public function getUnreadCount () : Int;
	public function getChannelsWithUnreads () : Dynamic;

	public function onStarAdded (data:String) : Dynamic;
	public function onStarRemoved (data:String) : Dynamic;

	public function onMessage (message:String) : Dynamic;

}