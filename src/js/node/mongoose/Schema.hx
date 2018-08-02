package js.node.mongoose;

import haxe.Constraints.Function;
import js.node.events.EventEmitter;

typedef SchemaOptions = {
	?strict : Bool,
	?bufferCommands : Bool,
	?capped : Bool, // { size, max, autoIndexId }
	?versionKey : String,
	?discriminatorKey : String,
	?minimize : Bool,
	?autoIndex : Bool,
	?shardKey : Bool,
	?read : js.node.mongodb.ReadPreference,
	?validateBeforeSave : Bool,
	// the following are only applied at construction time
	?_id : Bool,
	?id : Bool
}


@:jsRequire("mongoose", "Schema")
extern class Schema extends EventEmitter<Schema>
{
	public var indexTypes(default,null) : Array<String>;


	/**
	 * Schema constructor.
	 *
	 * ####Example:
	 *
	 *     var child = new Schema({ name: String });
	 *     var schema = new Schema({ name: String, age: Number, children: [child] });
	 *     var Tree = mongoose.model('Tree', schema);
	 *
	 *     // setting schema options
	 *     new Schema({ name: String }, { _id: false, autoIndex: false })
	 *
	 * ####Options:
	 *
	 * - [autoIndex](/docs/guide.html#autoIndex): bool - defaults to null (which means use the connection's autoIndex option)
	 * - [bufferCommands](/docs/guide.html#bufferCommands): bool - defaults to true
	 * - [capped](/docs/guide.html#capped): bool - defaults to false
	 * - [collection](/docs/guide.html#collection): string - no default
	 * - [id](/docs/guide.html#id): bool - defaults to true
	 * - [_id](/docs/guide.html#_id): bool - defaults to true
	 * - `minimize`: bool - controls [document#toObject](#document_Document-toObject) behavior when called manually - defaults to true
	 * - [read](/docs/guide.html#read): string
	 * - [safe](/docs/guide.html#safe): bool - defaults to true.
	 * - [shardKey](/docs/guide.html#shardKey): bool - defaults to `null`
	 * - [strict](/docs/guide.html#strict): bool - defaults to true
	 * - [toJSON](/docs/guide.html#toJSON) - object - no default
	 * - [toObject](/docs/guide.html#toObject) - object - no default
	 * - [validateBeforeSave](/docs/guide.html#validateBeforeSave) - bool - defaults to `true`
	 * - [versionKey](/docs/guide.html#versionKey): bool - defaults to "__v"
	 *
	 * ####Note:
	 *
	 * _When nesting schemas, (`children` in the example above), always declare the child schema first before passing it into its parent._
	 *
	 * @param {Object} definition
	 * @inherits NodeJS EventEmitter http://nodejs.org/api/events.html#events_class_events_eventemitter
	 * @event `init`: Emitted after the schema is compiled into a `Model`.
	 * @api public
	 */
	public function new(definition:{}, ?options:SchemaOptions);

	/**
	 * Returns default options for this schema, merged with `options`.
	 *
	 * @param {Object} options
	 * @return {Object}
	 * @api private
	 */
	 public function defaultOptions(?options:SchemaOptions) : SchemaOptions;

	/**
	 * Adds key path / schema type pairs to this schema.
	 *
	 * ####Example:
	 *
	 *     var ToySchema = new Schema;
	 *     ToySchema.add({ name: 'string', color: 'string', price: 'number' });
	 *
	 * @param {Object} obj
	 * @param {String} prefix
	 * @api public
	 */

	public function add(obj:{}, ?prefix:String) : Void;	 

	/**
	 * Gets/sets schema paths.
	 *
	 * Sets a path (if arity 2)
	 * Gets a path (if arity 1)
	 *
	 * ####Example
	 *
	 *     schema.path('name') // returns a SchemaType
	 *     schema.path('name', Number) // changes the schemaType of `name` to Number
	 *
	 * @param {String} path
	 * @param {Object} constructor
	 * @api public
	 */
	@:overload(function (path:String) : SchemaType {})
	public function path(path:String, obj:{}) : Schema;


	/**
	 * Iterates the schemas paths similar to Array#forEach.
	 *
	 * The callback is passed the pathname and schemaType as arguments on each iteration.
	 *
	 * @param {Function} fn callback function
	 * @return {Schema} this
	 * @api public
	 */
	public function eachPath(fn:String->SchemaType->Void) : Schema;

	/**
	 * Returns an Array of path strings that are required by this schema.
	 *
	 * @api public
	 * @param {Boolean} invalidate refresh the cache
	 * @return {Array}
	 */
	public function requiredPaths(invalidate:Bool) : Array<String>;

	/**
	 * Returns the pathType of `path` for this schema.
	 *
	 * Given a path, returns whether it is a real, virtual, nested, or ad-hoc/undefined path.
	 *
	 * @param {String} path
	 * @return {String}
	 * @api public
	 */
	public function pathType(path:String) : String;

	/**
	 * Adds a method call to the queue.
	 *
	 * @param {String} name name of the document method to call later
	 * @param {Array} args arguments to pass to the method
	 * @api public
	 */
	public function queue(name:String, args:Array<Dynamic>) : Schema;

	/**
	 * Defines a pre hook for the document.
	 *
	 * ####Example
	 *
	 *     var toySchema = new Schema(..);
	 *
	 *     toySchema.pre('save', function (next) {
	 *       if (!this.created) this.created = new Date;
	 *       next();
	 *     })
	 *
	 *     toySchema.pre('validate', function (next) {
	 *       if (this.name != 'Woody') this.name = 'Woody';
	 *       next();
	 *     })
	 *
	 * @param {String} method
	 * @param {Function} callback
	 * @see hooks.js https://github.com/bnoguchi/hooks-js/tree/31ec571cef0332e21121ee7157e0cf9728572cc3
	 * @api public
	 */

	public function pre(method:String, callback:Function) : Schema;

	/**
	 * Defines a post hook for the document
	 *
	 * Post hooks fire `on` the event emitted from document instances of Models compiled from this schema.
	 *
	 *     var schema = new Schema(..);
	 *     schema.post('save', function (doc) {
	 *       console.log('this fired after a document was saved');
	 *     });
	 *
	 *     var Model = mongoose.model('Model', schema);
	 *
	 *     var m = new Model(..);
	 *     m.save(function (err) {
	 *       console.log('this fires after the `post` hook');
	 *     });
	 *
	 * @param {String} method name of the method to hook
	 * @param {Function} fn callback
	 * @see hooks.js https://github.com/bnoguchi/hooks-js/tree/31ec571cef0332e21121ee7157e0cf9728572cc3
	 * @api public
	 */
	public function post(method:String, fn:Function) : Schema;

	/**
	 * Registers a plugin for this schema.
	 *
	 * @param {Function} plugin callback
	 * @param {Object} [opts]
	 * @see plugins
	 * @api public
	 */
	public function plugin(fn:Function, opts:{}) : Schema;

	/**
	 * Adds an instance method to documents constructed from Models compiled from this schema.
	 *
	 * ####Example
	 *
	 *     var schema = kittySchema = new Schema(..);
	 *
	 *     schema.method('meow', function () {
	 *       console.log('meeeeeoooooooooooow');
	 *     })
	 *
	 *     var Kitty = mongoose.model('Kitty', schema);
	 *
	 *     var fizz = new Kitty;
	 *     fizz.meow(); // meeeeeooooooooooooow
	 *
	 * If a hash of name/fn pairs is passed as the only argument, each name/fn pair will be added as methods.
	 *
	 *     schema.method({
	 *         purr: function () {}
	 *       , scratch: function () {}
	 *     });
	 *
	 *     // later
	 *     fizz.purr();
	 *     fizz.scratch();
	 *
	 * @param {String|Object} method name
	 * @param {Function} [fn]
	 * @api public
	 */
	@:overload(function(map:{}) : Schema {})
	public function method(name:String, fn:Function) : Schema;

	/**
	 * Adds static "class" methods to Models compiled from this schema.
	 *
	 * ####Example
	 *
	 *     var schema = new Schema(..);
	 *     schema.static('findByName', function (name, callback) {
	 *       return this.find({ name: name }, callback);
	 *     });
	 *
	 *     var Drink = mongoose.model('Drink', schema);
	 *     Drink.findByName('sanpellegrino', function (err, drinks) {
	 *       //
	 *     });
	 *
	 * If a hash of name/fn pairs is passed as the only argument, each name/fn pair will be added as statics.
	 *
	 * @param {String} name
	 * @param {Function} fn
	 * @api public
	 */
	@:overload(function(map:{}) : Schema {})
	public inline function static_(name:String, fn:Function) : Schema
	{
		return untyped this['static'].apply(this, arguments);
	}

	/**
	 * Defines an index (most likely compound) for this schema.
	 *
	 * ####Example
	 *
	 *     schema.index({ first: 1, last: -1 })
	 *
	 * @param {Object} fields
	 * @param {Object} [options]
	 * @api public
	 */
	public function index(fields:{}, ?options:{}) : Schema;

	/**
	 * Sets/gets a schema option.
	 *
	 * @param {String} key option name
	 * @param {Object} [value] if not passed, the current option value is returned
	 * @api public
	 */
	@:overload(function(key:String) : Dynamic {})
	public function set(key:String, value:Dynamic) : Schema;

	/**
	 * Gets a schema option.
	 *
	 * @param {String} key option name
	 * @api public
	 */
	public function get(key:String) : Dynamic;
 
	/**
	 * Compiles indexes from fields and schema-level indexes
	 *
	 * @api public
	 */
	public function indexes() : Array<Array<Dynamic>>;

	/**
	 * Removes the given `path` (or [`paths`]).
	 *
	 * @param {String|Array} path
	 *
	 * @api public
	 */
	public function remove(path:String) : Void;

} // End of Schema class
