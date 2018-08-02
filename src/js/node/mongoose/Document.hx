package js.node.mongoose;

import js.node.events.EventEmitter;
import haxe.Constraints.Function;

@:jsRequire("mongoose", "Document")
extern class Document extends EventEmitter<Document>
{
	/**
	 * The documents schema.
	 *
	 * @api public
	 * @property schema
	 */
	public var schema(default,null) : Schema;
	
	/**
	 * Boolean flag specifying if the document is new.
	 *
	 * @api public
	 * @property isNew
	 */	 
	public var isNew(default,null) : Bool;
	
	/**
	 * The string version of this documents _id.
	 *
	 * ####Note:
	 *
	 * This getter exists on all documents by default. The getter can be disabled by setting the `id` [option](/docs/guide.html#id) of its `Schema` to false at construction time.
	 *
	 *     new Schema({ name: String }, { id: false });
	 *
	 * @api public
	 * @see Schema options /docs/guide.html#options
	 * @property id
	 */
	public var id(default,null) : String;

	/**
	 * Hash containing current validation errors.
	 *
	 * @api public
	 * @property errors
	 */
	public var errors(default,null) : {};		 

	/**
	 * Sends an update command with this document `_id` as the query selector.
	 *
	 * ####Example:
	 *
	 *     weirdCar.update({$inc: {wheels:1}}, { w: 1 }, callback);
	 *
	 * ####Valid options:
	 *
	 *  - same as in [Model.update](#model_Model.update)
	 *
	 * @see Model.update #model_Model.update
	 * @param {Object} doc
	 * @param {Object} options
	 * @param {Function} callback
	 * @return {Query}
	 * @api public
	 */
	public function update(doc:{}, options:{}, callback:Error->{}->Void) : Query;

	/**
	 * Sets the value of a path, or many paths.
	 *
	 * ####Example:
	 *
	 *     // path, value
	 *     doc.set(path, value)
	 *
	 *     // object
	 *     doc.set({
	 *         path  : value
	 *       , path2 : {
	 *            path  : value
	 *         }
	 *     })
	 *
	 *     // on-the-fly cast to number
	 *     doc.set(path, value, Number)
	 *
	 *     // on-the-fly cast to string
	 *     doc.set(path, value, String)
	 *
	 *     // changing strict mode behavior
	 *     doc.set(path, value, { strict: false });
	 *
	 * @param {String|Object} path path or object of key/vals to set
	 * @param {Any} val the value to set
	 * @param {Schema|String|Number|Buffer|etc..} [type] optionally specify a type for "on-the-fly" attributes
	 * @param {Object} [options] optionally specify options that modify the behavior of the set
	 * @api public
	 */
	@:overload(function(path:{}, val:Dynamic, ?type:Dynamic, ?options:{}) : Document {})
	public function set(path:String, val:Dynamic, ?type:Dynamic, ?options:{}) : Document;

	/**
	 * Returns the value of a path.
	 *
	 * ####Example
	 *
	 *     // path
	 *     doc.get('age') // 47
	 *
	 *     // dynamic casting to a string
	 *     doc.get('age', String) // "47"
	 *
	 * @param {String} path
	 * @param {Schema|String|Number|Buffer|etc..} [type] optionally specify a type for on-the-fly attributes
	 * @api public
	 */
	public function get(path:String, ?type:Dynamic) : Dynamic;

	/**
	 * Marks the path as having pending changes to write to the db.
	 *
	 * _Very helpful when using [Mixed](./schematypes.html#mixed) types._
	 *
	 * ####Example:
	 *
	 *     doc.mixed.type = 'changed';
	 *     doc.markModified('mixed.type');
	 *     doc.save() // changes to mixed.type are now persisted
	 *
	 * @param {String} path the path to mark modified
	 * @api public
	 */
	public function markModified(path:String) : Void;

	/**
	 * Returns the list of paths that have been modified.
	 *
	 * @return {Array}
	 * @api public
	 */
	public function modifiedPaths() : Array<String>;

	/**
	 * Returns true if this document was modified, else false.
	 *
	 * If `path` is given, checks if a path or any full path containing `path` as part of its path chain has been modified.
	 *
	 * ####Example
	 *
	 *     doc.set('documents.0.title', 'changed');
	 *     doc.isModified()                    // true
	 *     doc.isModified('documents')         // true
	 *     doc.isModified('documents.0.title') // true
	 *     doc.isDirectModified('documents')   // false
	 *
	 * @param {String} [path] optional
	 * @return {Boolean}
	 * @api public
	 */
	public function isModified(?path:String) : Bool;

	/**
	 * Checks if a path is set to its default.
	 *
	 * ####Example
	 *
	 *     MyModel = mongoose.model('test', { name: { type: String, default: 'Val '} });
	 *     var m = new MyModel();
	 *     m.$isDefault('name');               // true
	 *
	 * @param {String} [path]
	 * @return {Boolean}
	 * @method $isDefault
	 * @api public
	 */
	public inline function _isDefault(?path:String) : Bool
	{
		return untyped this['$isDefault'](path);
	}

	/**
	 * Returns true if `path` was directly set and modified, else false.
	 *
	 * ####Example
	 *
	 *     doc.set('documents.0.title', 'changed');
	 *     doc.isDirectModified('documents.0.title') // true
	 *     doc.isDirectModified('documents') // false
	 *
	 * @param {String} path
	 * @return {Boolean}
	 * @api public
	 */
	public function isDirectModified(path:String) : Bool;

	/**
	 * Checks if `path` was initialized.
	 *
	 * @param {String} path
	 * @return {Boolean}
	 * @api public
	 */
	public function isInit(path:String) : Bool;

	/**
	 * Checks if `path` was selected in the source query which initialized this document.
	 *
	 * ####Example
	 *
	 *     Thing.findOne().select('name').exec(function (err, doc) {
	 *        doc.isSelected('name') // true
	 *        doc.isSelected('age')  // false
	 *     })
	 *
	 * @param {String} path
	 * @return {Boolean}
	 * @api public
	 */
	public function isSelected(path:String) : Bool;

	/**
	 * Executes registered validation rules for this document.
	 *
	 * ####Note:
	 *
	 * This method is called `pre` save and if a validation rule is violated, 
	 * [save](#model_Model-save) is aborted and the error is returned to your `callback`.
	 *
	 * ####Example:
	 *
	 *     doc.validate(function (err) {
	 *       if (err) handleError(err);
	 *       else // validation passed
	 *     });
	 *
	 * @param {Function} optional callback called after validation completes, passing an error if one occurred
	 * @return {Promise} Promise
	 * @api public
	 */
	public function validate(?callback:Error->Void) : Promise;

	/**
	 * Executes registered validation rules (skipping asynchronous validators) for this document.
	 *
	 * ####Note:
	 *
	 * This method is useful if you need synchronous validation.
	 *
	 * ####Example:
	 *
	 *     var err = doc.validateSync();
	 *     if ( err ){
	 *       handleError( err );
	 *     } else {
	 *       // validation passed
	 *     }
	 *
	 * @param {Array|string} pathsToValidate only validate the given paths
	 * @return {MongooseError|undefined} MongooseError if there are errors during validation, or undefined if there is no error.
	 * @api public
	 */
	@:overload(function(pathsToValidate:Array<String>) : Error {})
	public function validateSync(pathsToValidate:String) : Error;

	/**
	 * Marks a path as invalid, causing validation to fail.
	 *
	 * The `errorMsg` argument will become the message of the `ValidationError`.
	 *
	 * The `value` argument (if passed) will be available through the `ValidationError.value` property.
	 *
	 *     doc.invalidate('size', 'must be less than 20', 14);
	 *     doc.validate(function (err) {
	 *       console.log(err)
	 *       // prints
	 *       { message: 'Validation failed',
	 *         name: 'ValidationError',
	 *         errors:
	 *          { size:
	 *             { message: 'must be less than 20',
	 *               name: 'ValidatorError',
	 *               path: 'size',
	 *               type: 'user defined',
	 *               value: 14 } } }
	 *     })
	 *
	 * @param {String} path the field to invalidate
	 * @param {String|Error} errorMsg the error which states the reason `path` was invalid
	 * @param {Object|String|Number|any} value optional invalid value
	 * @api public
	 */
	@:overload(function(path:String, err:Error, val:Dynamic) : Void {})
	public function invalidate(path:String, err:String, val:Dynamic) : Void;

	/**
	 * Converts this document into a plain javascript object, ready for storage in MongoDB.
	 *
	 * Buffers are converted to instances of 
	 * [mongodb.Binary](http://mongodb.github.com/node-mongodb-native/api-bson-generated/binary.html) for proper storage.
	 *
	 * ####Options:
	 *
	 * - `getters` apply all getters (path and virtual getters)
	 * - `virtuals` apply virtual getters (can override `getters` option)
	 * - `minimize` remove empty objects (defaults to true)
	 * - `transform` a transform function to apply to the resulting document before returning
	 * - `depopulate` depopulate any populated paths, replacing them with their original refs (defaults to false)
	 * - `versionKey` whether to include the version key (defaults to true)
	 * - `retainKeyOrder` keep the order of object keys. If this is set to true, 
	 * `Object.keys(new Doc({ a: 1, b: 2}).toObject())` will always produce `['a', 'b']` (defaults to false)
	 *
	 * ####Getters/Virtuals
	 *
	 * Example of only applying path getters
	 *
	 *     doc.toObject({ getters: true, virtuals: false })
	 *
	 * Example of only applying virtual getters
	 *
	 *     doc.toObject({ virtuals: true })
	 *
	 * Example of applying both path and virtual getters
	 *
	 *     doc.toObject({ getters: true })
	 *
	 * To apply these options to every document of your schema by default, 
	 * set your [schemas](#schema_Schema) `toObject` option to the same argument.
	 *
	 *     schema.set('toObject', { virtuals: true })
	 *
	 * ####Transform
	 *
	 * We may need to perform a transformation of the resulting object based on some criteria, 
	 * say to remove some sensitive information or return a custom object. In this case we set the optional `transform` function.
	 *
	 * Transform functions receive three arguments
	 *
	 *     function (doc, ret, options) {}
	 *
	 * - `doc` The mongoose document which is being converted
	 * - `ret` The plain object representation which has been converted
	 * - `options` The options in use (either schema options or the options passed inline)
	 *
	 * ####Example
	 *
	 *     // specify the transform schema option
	 *     if (!schema.options.toObject) schema.options.toObject = {};
	 *     schema.options.toObject.transform = function (doc, ret, options) {
	 *       // remove the _id of every document before returning the result
	 *       delete ret._id;
	 *     }
	 *
	 *     // without the transformation in the schema
	 *     doc.toObject(); // { _id: 'anId', name: 'Wreck-it Ralph' }
	 *
	 *     // with the transformation
	 *     doc.toObject(); // { name: 'Wreck-it Ralph' }
	 *
	 * With transformations we can do a lot more than remove properties. We can even return completely new customized objects:
	 *
	 *     if (!schema.options.toObject) schema.options.toObject = {};
	 *     schema.options.toObject.transform = function (doc, ret, options) {
	 *       return { movie: ret.name }
	 *     }
	 *
	 *     // without the transformation in the schema
	 *     doc.toObject(); // { _id: 'anId', name: 'Wreck-it Ralph' }
	 *
	 *     // with the transformation
	 *     doc.toObject(); // { movie: 'Wreck-it Ralph' }
	 *
	 * _Note: if a transform function returns `undefined`, the return value will be ignored._
	 *
	 * Transformations may also be applied inline, overridding any transform set in the options:
	 *
	 *     function xform (doc, ret, options) {
	 *       return { inline: ret.name, custom: true }
	 *     }
	 *
	 *     // pass the transform as an inline option
	 *     doc.toObject({ transform: xform }); // { inline: 'Wreck-it Ralph', custom: true }
	 *
	 * _Note: if you call `toObject` and pass any options, the transform declared in your schema options 
	 * will __not__ be applied. To force its application pass `transform: true`_
	 *
	 *     if (!schema.options.toObject) schema.options.toObject = {};
	 *     schema.options.toObject.hide = '_id';
	 *     schema.options.toObject.transform = function (doc, ret, options) {
	 *       if (options.hide) {
	 *         options.hide.split(' ').forEach(function (prop) {
	 *           delete ret[prop];
	 *         });
	 *       }
	 *     }
	 *
	 *     var doc = new Doc({ _id: 'anId', secret: 47, name: 'Wreck-it Ralph' });
	 *     doc.toObject();                                        // { secret: 47, name: 'Wreck-it Ralph' }
	 *     doc.toObject({ hide: 'secret _id' });                  // { _id: 'anId', secret: 47, name: 'Wreck-it Ralph' }
	 *     doc.toObject({ hide: 'secret _id', transform: true }); // { name: 'Wreck-it Ralph' }
	 *
	 * Transforms are applied _only to the document and are not applied to sub-documents_.
	 *
	 * Transforms, like all of these options, are also available for `toJSON`.
	 *
	 * See [schema options](/docs/guide.html#toObject) for some more details.
	 *
	 * _During save, no custom options are applied to the document before being sent to the database._
	 *
	 * @param {Object} [options]
	 * @return {Object} js object
	 * @see mongodb.Binary http://mongodb.github.com/node-mongodb-native/api-bson-generated/binary.html
	 * @api public
	 */
	public function toObject(?options:{}) : {};

	/**
	 * Helper for console.log
	 *
	 * @api public
	 * @method toString
	 */
	public function toString() : String;

	/**
	 * Returns true if the Document stores the same data as doc.
	 *
	 * Documents are considered equal when they have matching `_id`s, unless neither
	 * document has an `_id`, in which case this function falls back to using
	 * `deepEqual()`.
	 *
	 * @param {Document} doc a document to compare
	 * @return {Boolean}
	 * @api public
	 */
	public function equals(doc:Document) : Bool;

	/**
	 * Populates document references, executing the `callback` when complete.
	 *
	 * ####Example:
	 *
	 *     doc
	 *     .populate('company')
	 *     .populate({
	 *       path: 'notes',
	 *       match: /airline/,
	 *       select: 'text',
	 *       model: 'modelName'
	 *       options: opts
	 *     }, function (err, user) {
	 *       assert(doc._id == user._id) // the document itself is passed
	 *     })
	 *
	 *     // summary
	 *     doc.populate(path)               // not executed
	 *     doc.populate(options);           // not executed
	 *     doc.populate(path, callback)     // executed
	 *     doc.populate(options, callback); // executed
	 *     doc.populate(callback);          // executed
	 *
	 *
	 * ####NOTE:
	 *
	 * Population does not occur unless a `callback` is passed *or* you explicitly
	 * call `execPopulate()`.
	 * Passing the same path a second time will overwrite the previous path options.
	 * See [Model.populate()](#model_Model.populate) for explaination of options.
	 *
	 * @see Model.populate #model_Model.populate
	 * @param {String|Object} [path] The path to populate or an options object
	 * @param {Function} [callback] When passed, population is invoked
	 * @api public
	 * @return {Document} this
	 */
	@:overload(function(path:String) : Document {}) 
	@:overload(function(options:{}, callback:Error->{}->Void) : Document {}) 
	@:overload(function(options:{}) : Document {}) 
	public function populate(path:String, callback:Error->{}->Void) : Document;

	/**
	 * Explicitly executes population and returns a promise. Useful for ES6
	 * integration.
	 *
	 * ####Example:
	 *
	 *     var promise = doc.
	 *       populate('company').
	 *       populate({
	 *         path: 'notes',
	 *         match: /airline/,
	 *         select: 'text',
	 *         model: 'modelName'
	 *         options: opts
	 *       }).
	 *       execPopulate();
	 *
	 *     // summary
	 *     doc.execPopulate()
	 *
	 *
	 * ####NOTE:
	 *
	 * Population does not occur unless a `callback` is passed.
	 * Passing the same path a second time will overwrite the previous path options.
	 * See [Model.populate()](#model_Model.populate) for explaination of options.
	 *
	 * @see Document.populate #Document_model.populate
	 * @api public
	 * @return {Promise} promise that resolves to the document when population is done
	 */
	public function execPopulate() : Promise;

	/**
	 * Gets _id(s) used during population of the given `path`.
	 *
	 * ####Example:
	 *
	 *     Model.findOne().populate('author').exec(function (err, doc) {
	 *       console.log(doc.author.name)         // Dr.Seuss
	 *       console.log(doc.populated('author')) // '5144cf8050f071d979c118a7'
	 *     })
	 *
	 * If the path was not populated, undefined is returned.
	 *
	 * @param {String} path
	 * @return {Array|ObjectId|Number|Buffer|String|undefined}
	 * @api public
	 */

	public function populated(path:String) : Dynamic;

} // End of Document class
