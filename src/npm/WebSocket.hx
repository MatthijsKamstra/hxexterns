package js.npm;

import js.node.events.EventEmitter;

/**
 * https://github.com/websockets/ws/blob/master/lib/WebSocket.js
 *
 * http://einaros.github.io/ws/
 *
 *	var WebSocket = require('ws')
  		, ws = new WebSocket('ws://www.host.com/path');
	ws.on('open', function() {
		ws.send('something');
	});
	ws.on('message', function(message) {
		console.log('received: %s', message);
	});
 * 
 */


// @:native('ws')
extern class WebSocket
implements npm.Package.Require<"ws","^0.4.31">
extends EventEmitter 
{
	public function new (url:String);
	// public function on (event : String, err : Dynamic -> Void) : Void;


	/**
	 * Sends a piece of data
	 *
	 * @param {Object} data to be sent to the server
	 * @param {Object} Members - mask: boolean, binary: boolean, compress: boolean
	 * @param {function} Optional callback which is executed after the send completes
	 * @api public
	 */
	public function send (data:Dynamic, ?options:SendOptions, ?cb:Dynamic):Void;

}

typedef SendOptions = 
{
	@:optional var mask: Bool;
	@:optional var binary: Bool;
	@:optional var compress: Bool;
}