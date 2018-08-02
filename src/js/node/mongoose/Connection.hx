package js.node.mongoose;

import js.node.events.EventEmitter;

@:jsRequire("mongoose", "Connection")
extern class Connection extends EventEmitter<Connection>
{
	/**
	 * Connection constructor
	 *
	 * For practical reasons, a Connection equals a Db.
	 *
	 * @param {Mongoose} base a mongoose instance
	 * @inherits NodeJS EventEmitter http://nodejs.org/api/events.html#events_class_events_eventemitter
	 * @event `connecting`: Emitted when `connection.{open,openSet}()` is executed on this connection.
	 * @event `connected`: Emitted when this connection successfully connects to the db. May be emitted _multiple_ times in `reconnected` scenarios.
	 * @event `open`: Emitted after we `connected` and `onOpen` is executed on all of this connections models.
	 * @event `disconnecting`: Emitted when `connection.close()` was executed.
	 * @event `disconnected`: Emitted after getting disconnected from the db.
	 * @event `close`: Emitted after we `disconnected` and `onClose` executed on all of this connections models.
	 * @event `reconnected`: Emitted after we `connected` and subsequently `disconnected`, followed by successfully another successfull connection.
	 * @event `error`: Emitted when an error occurs on this connection.
	 * @event `fullsetup`: Emitted in a replica-set scenario, when all nodes specified in the connection string are connected.
	 * @api public
	 */
	public function new(base:Mongoose);

	
	/**
	 * Opens the connection to MongoDB.
	 *
	 * `options` is a hash with the following possible properties:
	 *
	 *     config  - passed to the connection config instance
	 *     db      - passed to the connection db instance
	 *     server  - passed to the connection server instance(s)
	 *     replset - passed to the connection ReplSet instance
	 *     user    - username for authentication
	 *     pass    - password for authentication
	 *     auth    - options for authentication (see http://mongodb.github.com/node-mongodb-native/api-generated/db.html#authenticate)
	 *
	 * ####Notes:
	 *
	 * Mongoose forces the db option `forceServerObjectId` false and cannot be overridden.
	 * Mongoose defaults the server `auto_reconnect` options to true which can be overridden.
	 * See the node-mongodb-native driver instance for options that it understands.
	 *
	 * _Options passed take precedence over options included in connection strings._
	 *
	 * @param {String} connection_string mongodb://uri or the host to which you are connecting
	 * @param {String} [database] database name
	 * @param {Number} [port] database port
	 * @param {Object} [options] options
	 * @param {Function} [callback]
	 * @see node-mongodb-native https://github.com/mongodb/node-mongodb-native
	 * @see http://mongodb.github.com/node-mongodb-native/api-generated/db.html#authenticate
	 * @api public
	 */
	public function open(host:String, ?database:String, ?port:Int, ?options:Dynamic, ?callback:Error->Void) : Connection;

	/**
	 * Opens the connection to a replica set.
	 *
	 * ####Example:
	 *
	 *     var db = mongoose.createConnection();
	 *     db.openSet("mongodb://user:pwd@localhost:27020/testing,mongodb://example.com:27020,mongodb://localhost:27019");
	 *
	 * The database name and/or auth need only be included in one URI.
	 * The `options` is a hash which is passed to the internal driver connection object.
	 *
	 * Valid `options`
	 *
	 *     db      - passed to the connection db instance
	 *     server  - passed to the connection server instance(s)
	 *     replset - passed to the connection ReplSetServer instance
	 *     user    - username for authentication
	 *     pass    - password for authentication
	 *     auth    - options for authentication (see http://mongodb.github.com/node-mongodb-native/api-generated/db.html#authenticate)
	 *     mongos  - Boolean - if true, enables High Availability support for mongos
	 *
	 * _Options passed take precedence over options included in connection strings._
	 *
	 * ####Notes:
	 *
	 * _If connecting to multiple mongos servers, set the `mongos` option to true._
	 *
	 *     conn.open('mongodb://mongosA:27501,mongosB:27501', { mongos: true }, cb);
	 *
	 * Mongoose forces the db option `forceServerObjectId` false and cannot be overridden.
	 * Mongoose defaults the server `auto_reconnect` options to true which can be overridden.
	 * See the node-mongodb-native driver instance for options that it understands.
	 *
	 * _Options passed take precedence over options included in connection strings._
	 *
	 * @param {String} uris comma-separated mongodb:// `URI`s
	 * @param {String} [database] database name if not included in `uris`
	 * @param {Object} [options] passed to the internal driver
	 * @param {Function} [callback]
	 * @see node-mongodb-native https://github.com/mongodb/node-mongodb-native
	 * @see http://mongodb.github.com/node-mongodb-native/api-generated/db.html#authenticate
	 * @api public
	 */
	public function openSet(uris:String, ?database:String, ?options:Dynamic, ?callback:Error->Void) : Connection;

	/**
	 * Closes the connection
	 *
	 * @param {Function} [callback] optional
	 * @return {Connection} self
	 * @api public
	 */
	public function close(?callback:Error->Void) : Connection;

	/**
	 * Defines or retrieves a model.
	 *
	 *     var mongoose = require('mongoose');
	 *     var db = mongoose.createConnection(..);
	 *     db.model('Venue', new Schema(..));
	 *     var Ticket = db.model('Ticket', new Schema(..));
	 *     var Venue = db.model('Venue');
	 *
	 * _When no `collection` argument is passed, Mongoose produces a collection name by passing the model `name` to the [utils.toCollectionName](#utils_exports.toCollectionName) method. This method pluralizes the name. If you don't like this behavior, either pass a collection name or set your schemas collection name option._
	 *
	 * ####Example:
	 *
	 *     var schema = new Schema({ name: String }, { collection: 'actor' });
	 *
	 *     // or
	 *
	 *     schema.set('collection', 'actor');
	 *
	 *     // or
	 *
	 *     var collectionName = 'actor'
	 *     var M = conn.model('Actor', schema, collectionName)
	 *
	 * @param {String} name the model name
	 * @param {Schema} [schema] a schema. necessary when defining a model
	 * @param {String} [collection] name of mongodb collection (optional) if not given it will be induced from model name
	 * @see Mongoose#model #index_Mongoose-model
	 * @return {Model} The compiled model
	 * @api public
	 */
	public function model(name:String, ?schema:Schema, ?collection:String) : Model;

	/**
	 * Returns an array of model names created on this connection.
	 * @api public
	 * @return {Array}
	 */
	public function modelNames() : Array<String>;

} // End of Connection class