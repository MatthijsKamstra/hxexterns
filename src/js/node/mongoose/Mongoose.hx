package js.node.mongoose;

@:jsRequire("mongoose", "Mongoose")
extern class Mongoose
{
	public var connection (default,null) : Connection;
	public var connections (default,null) : Array<Connection>;
	public var version (default,null) : String;

	/**
	 * Mongoose constructor.
	 *
	 * The exports object of the `mongoose` module is an instance of this class.
	 * Most apps will only use this one instance.
	 *
	 * @api public
	 */
	public function new(): Void;

	/**
	 * Sets mongoose options
	 *
	 * ####Example:
	 *
	 *     mongoose.set('test', value) // sets the 'test' option to `value`
	 *
	 *     mongoose.set('debug', true) // enable logging collection methods + arguments to the console
	 *
	 * @param {String} key
	 * @param {String} value
	 * @api public
	 */
	public function set(key:String, value:String) : Mongoose;


	/**
	 * Gets mongoose options
	 *
	 * ####Example:
	 *
	 *     mongoose.get('test') // returns the 'test' value
	 *
	 * @param {String} key
	 * @method get
	 * @api public
	 */
	public function get(key:String) : String;

	/**
	 * Creates a Connection instance.
	 *
	 * Each `connection` instance maps to a single database. This method is helpful when mangaging multiple db connections.
	 *
	 * If arguments are passed, they are proxied to either [Connection#open](#connection_Connection-open) or 
	 * [Connection#openSet](#connection_Connection-openSet) appropriately. This means we can pass `db`, `server`, 
	 * and `replset` options to the driver. _Note that the `safe` option specified in your schema will overwrite the 
	 * `safe` db option specified here unless you set your schemas `safe` option to `undefined`. 
	 * See [this](/docs/guide.html#safe) for more information._
	 *
	 * _Options passed take precedence over options included in connection strings._
	 *
	 * ####Example:
	 *
	 *     // with mongodb:// URI
	 *     db = mongoose.createConnection('mongodb://user:pass@localhost:port/database');
	 *
	 *     // and options
	 *     var opts = { db: { native_parser: true }}
	 *     db = mongoose.createConnection('mongodb://user:pass@localhost:port/database', opts);
	 *
	 *     // replica sets
	 *     db = mongoose.createConnection('mongodb://user:pass@localhost:port,anotherhost:port,yetanother:port/database');
	 *
	 *     // and options
	 *     var opts = { replset: { strategy: 'ping', rs_name: 'testSet' }}
	 *     db = mongoose.createConnection('mongodb://user:pass@localhost:port,anotherhost:port,yetanother:port/database', opts);
	 *
	 *     // with [host, database_name[, port] signature
	 *     db = mongoose.createConnection('localhost', 'database', port)
	 *
	 *     // and options
	 *     var opts = { server: { auto_reconnect: false }, user: 'username', pass: 'mypassword' }
	 *     db = mongoose.createConnection('localhost', 'database', port, opts)
	 *
	 *     // initialize now, connect later
	 *     db = mongoose.createConnection();
	 *     db.open('localhost', 'database', port, [opts]);
	 *
	 * @param {String} [uri] a mongodb:// URI
	 * @param {Object} [options] options to pass to the driver
	 * @see Connection#open #connection_Connection-open
	 * @see Connection#openSet #connection_Connection-openSet
	 * @return {Connection} the created Connection object
	 * @api public
	 */
	@:overload(function(uri:String, ?options:{}) : Connection {})
	@:overload(function(host:String, database_name:String, ?iPort:Int, options:{}) : Connection {})
	public function createConnection() : Connection;

	/**
	 * Opens the default mongoose connection.
	 *
	 * If arguments are passed, they are proxied to either [Connection#open](#connection_Connection-open) or 
	 * [Connection#openSet](#connection_Connection-openSet) appropriately.
	 *
	 * _Options passed take precedence over options included in connection strings._
	 *
	 * ####Example:
	 *
	 *     mongoose.connect('mongodb://user:pass@localhost:port/database');
	 *
	 *     // replica sets
	 *     var uri = 'mongodb://user:pass@localhost:port/database,mongodb://anotherhost:port,mongodb://yetanother:port';
	 *     mongoose.connect(uri);
	 *
	 *     // with options
	 *     mongoose.connect(uri, options);
	 *
	 *     // connecting to multiple mongos
	 *     var uri = 'mongodb://hostA:27501,hostB:27501';
	 *     var opts = { mongos: true };
	 *     mongoose.connect(uri, opts);
	 *
	 * @param {String} uri(s)
	 * @param {Object} [options]
	 * @param {Function} [callback]
	 * @see Mongoose#createConnection #index_Mongoose-createConnection
	 * @api public
	 * @return {Mongoose} this
	 */
	public function connect(uri:String, ?options:{}, ?fn:Error->Void) : Mongoose;

	/**
	 * Disconnects all connections.
	 *
	 * @param {Function} [fn] called after all connection close.
	 * @return {Mongoose} this
	 * @api public
	 */
	 public function disconnect(?fn:Error->Void) : Mongoose;

	/**
	 * Defines a model or retrieves it.
	 *
	 * Models defined on the `mongoose` instance are available to all connection created by the same `mongoose` instance.
	 *
	 * ####Example:
	 *
	 *     var mongoose = require('mongoose');
	 *
	 *     // define an Actor model with this mongoose instance
	 *     mongoose.model('Actor', new Schema({ name: String }));
	 *
	 *     // create a new connection
	 *     var conn = mongoose.createConnection(..);
	 *
	 *     // retrieve the Actor model
	 *     var Actor = conn.model('Actor');
	 *
	 * _When no `collection` argument is passed, Mongoose produces a collection name by passing the model `name` to the 
	 * [utils.toCollectionName](#utils_exports.toCollectionName) method. This method pluralizes the name. If you don't like 
	 * this behavior, either pass a collection name or set your schemas collection name option._
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
	 *     var M = mongoose.model('Actor', schema, collectionName)
	 *
	 * @param {String} name model name
	 * @param {Schema} [schema]
	 * @param {String} [collection] name (optional, induced from model name)
	 * @param {Boolean} [skipInit] whether to skip initialization (defaults to false)
	 * @api public
	 */
	 public function model(name:String, schema:Schema, ?collection:String, ?skipInit:Bool) : Model;

	/**
	 * Returns an array of model names created on this instance of Mongoose.
	 *
	 * ####Note:
	 *
	 * _Does not include names of models created using `connection.model()`._
	 *
	 * @api public
	 * @return {Array}
	 */
	 public function modelNames() : Array<String>;

	/**
	 * Declares a global plugin executed on all Schemas.
	 *
	 * Equivalent to calling `.plugin(fn)` on each Schema you create.
	 *
	 * @param {Function} fn plugin callback
	 * @param {Object} [opts] optional options
	 * @return {Mongoose} this
	 * @see plugins ./plugins.html
	 * @api public
	 */
	 public function plugin(fn:Error->Void, ?options:{}) : Mongoose;


} // End of Mongoose class
