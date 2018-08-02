package js.node.mongoose;

import haxe.extern.EitherType;
import js.node.mongodb.MongoCollection;

typedef Id = EitherType<String,EitherType<Int,{}>>;

@:jsRequire("mongoose", "Model")
extern class Model
{
	public var db(default,null) : Connection;
	public var collection(default,null) : MongoCollection;
	public var modelName(default,null) : String;
	public var schema(default,null) : Schema;
	public var base(default,null) : Mongoose;

	/**
	 * Model constructor
	 *
	 * Provides the interface to MongoDB collections as well as creates document instances.
	 *
	 * @param {Object} doc values with which to create the document
	 * @inherits Document
	 * @event `error`: If listening to this event, it is emitted when a document was saved without passing a callback and an `error` occurred. If not listening, the event bubbles to the connection used to create this Model.
	 * @event `index`: Emitted after `Model#ensureIndexes` completes. If an error occurred it is passed with the event.
	 * @api public
	 */
	public function new(doc:{}, fields:{}, skipId:Bool);

	/**
	 * Saves this document.
	 *
	 * ####Example:
	 *
	 *     product.sold = Date.now();
	 *     product.save(function (err, product, numberAffected) {
	 *       if (err) ..
	 *     })
	 *
	 * The callback will receive three parameters, `err` if an error occurred, `product` which is the saved `product`, and `numberAffected` which will be 1 when the document was found and updated in the database, otherwise 0.
	 *
	 * The `fn` callback is optional. If no `fn` is passed and validation fails, the validation error will be emitted on the connection used to create this model.
	 * ####Example:
	 *     var db = mongoose.createConnection(..);
	 *     var schema = new Schema(..);
	 *     var Product = db.model('Product', schema);
	 *
	 *     db.on('error', handleError);
	 *
	 * However, if you desire more local error handling you can add an `error` listener to the model and handle errors there instead.
	 * ####Example:
	 *     Product.on('error', handleError);
	 *
	 * As an extra measure of flow control, save will return a Promise (bound to `fn` if passed) so it could be chained, or hook to recive errors
	 * ####Example:
	 *     product.save().then(function (product, numberAffected) {
	 *        ...
	 *     }).onRejected(function (err) {
	 *        assert.ok(err)
	 *     })
	 *
	 * For legacy reasons, mongoose stores object keys in reverse order on initial save. That is, `{ a: 1, b: 2 }` will be saved as `{ b: 2, a: 1 }` in MongoDB. To override this behavior, set [the `toObject.retainKeyOrder` option](http://mongoosejs.com/docs/api.html#document_Document-toObject) to true on your schema.
	 *
	 * @param {Object} [options] options set `options.safe` to override [schema's safe option](http://mongoosejs.com//docs/guide.html#safe)
	 * @param {function(err, document, Number)} [fn] optional callback
	 * @return {Promise} Promise
	 * @api public
	 * @see middleware http://mongoosejs.com/docs/middleware.html
	 */
	@:overload(function (options:{}) : Promise {})
	@:overload(function (fn:Error->Model->Int->Void) : Promise {})
	@:overload(function () : Promise {})
	public function save(options:{}, fn:Error->Model->Int->Void) : Promise;

	/**
	 * Signal that we desire an increment of this documents version.
	 *
	 * ####Example:
	 *
	 *     Model.findById(id, function (err, doc) {
	 *       doc.increment();
	 *       doc.save(function (err) { .. })
	 *     })
	 *
	 * @see versionKeys http://mongoosejs.com/docs/guide.html#versionKey
	 * @api public
	 */
	public function increment() : Model;

	/**
	 * Removes this document from the db.
	 *
	 * ####Example:
	 *     product.remove(function (err, product) {
	 *       if (err) return handleError(err);
	 *       Product.findById(product._id, function (err, product) {
	 *         console.log(product) // null
	 *       })
	 *     })
	 *
	 *
	 * As an extra measure of flow control, remove will return a Promise (bound to `fn` if passed) so it could be chained, or hooked to recive errors
	 *
	 * ####Example:
	 *     product.remove().then(function (product) {
	 *        ...
	 *     }).onRejected(function (err) {
	 *        assert.ok(err)
	 *     })
	 *
	 * @param {function(err,product)} [fn] optional callback
	 * @return {Promise} Promise
	 * @api public
	 */
	@:overload(function (options:{}) : Promise {})
	@:overload(function (fn:Error->{}->Void) : Promise {})
	@:overload(function () : Promise {})
	public function remove(options:{}, fn:Error->{}->Void) : Promise;

	/**
	 * Returns another Model instance.
	 *
	 * ####Example:
	 *
	 *     var doc = new Tank;
	 *     doc.model('User').findById(id, callback);
	 *
	 * @param {String} name model name
	 * @api public
	 */
	public function model(name:String) : Model;

	/**
	 * Adds a discriminator type.
	 *
	 * ####Example:
	 *
	 *     function BaseSchema() {
	 *       Schema.apply(this, arguments);
	 *
	 *       this.add({
	 *         name: String,
	 *         createdAt: Date
	 *       });
	 *     }
	 *     util.inherits(BaseSchema, Schema);
	 *
	 *     var PersonSchema = new BaseSchema();
	 *     var BossSchema = new BaseSchema({ department: String });
	 *
	 *     var Person = mongoose.model('Person', PersonSchema);
	 *     var Boss = Person.discriminator('Boss', BossSchema);
	 *
	 * @param {String} name   discriminator model name
	 * @param {Schema} schema discriminator model schema
	 * @api public
	 */

	public function discriminator(name:String, schema:Schema) : Model;

	/**
	 * Sends `ensureIndex` commands to mongo for each index declared in the schema.
	 *
	 * ####Example:
	 *
	 *     Event.ensureIndexes(function (err) {
	 *       if (err) return handleError(err);
	 *     });
	 *
	 * After completion, an `index` event is emitted on this `Model` passing an error if one occurred.
	 *
	 * ####Example:
	 *
	 *     var eventSchema = new Schema({ thing: { type: 'string', unique: true }})
	 *     var Event = mongoose.model('Event', eventSchema);
	 *
	 *     Event.on('index', function (err) {
	 *       if (err) console.error(err); // error occurred during index creation
	 *     })
	 *
	 * _NOTE: It is not recommended that you run this in production. Index creation may impact database performance depending on your load. Use with caution._
	 *
	 * The `ensureIndex` commands are not sent in parallel. This is to avoid the `MongoError: cannot add index with a background operation in progress` error. See [this ticket](https://github.com/Automattic/mongoose/issues/1365) for more information.
	 *
	 * @param {Function} [cb] optional callback
	 * @return {Promise}
	 * @api public
	 */
	@:overload(function () : Promise {})
	public function ensureIndexes(cb:Error->Void) : Promise;

	/**
	 * Finds documents
	 *
	 * The `conditions` are cast to their respective SchemaTypes before the command is sent.
	 *
	 * ####Examples:
	 *
	 *     // named john and at least 18
	 *     MyModel.find({ name: 'john', age: { $gte: 18 }});
	 *
	 *     // executes immediately, passing results to callback
	 *     MyModel.find({ name: 'john', age: { $gte: 18 }}, function (err, docs) {});
	 *
	 *     // name LIKE john and only selecting the "name" and "friends" fields, executing immediately
	 *     MyModel.find({ name: /john/i }, 'name friends', function (err, docs) { })
	 *
	 *     // passing options
	 *     MyModel.find({ name: /john/i }, null, { skip: 10 })
	 *
	 *     // passing options and executing immediately
	 *     MyModel.find({ name: /john/i }, null, { skip: 10 }, function (err, docs) {});
	 *
	 *     // executing a query explicitly
	 *     var query = MyModel.find({ name: /john/i }, null, { skip: 10 })
	 *     query.exec(function (err, docs) {});
	 *
	 *     // using the promise returned from executing a query
	 *     var query = MyModel.find({ name: /john/i }, null, { skip: 10 });
	 *     var promise = query.exec();
	 *     promise.addBack(function (err, docs) {});
	 *
	 * @param {Object} conditions
	 * @param {Object} [projection] optional fields to return (http://bit.ly/1HotzBo)
	 * @param {Object} [options] optional
	 * @param {Function} [callback]
	 * @return {Query}
	 * @see field selection #query_Query-select
	 * @see promise #promise-js
	 * @api public
	 */
	@:overload(function (conditions:{}) : Query {})
	@:overload(function (conditions:{}, projection:{}) : Query {})
	@:overload(function (conditions:{}, projection:{}, options:{}) : Query {})
	@:overload(function (conditions:{}, projection:{}, callback:Error->{}) : Query {})
	@:overload(function (conditions:{}, callback:Error->{}) : Query {})
	public function find(conditions:{}, projection:{}, options:{}, callback:Error->{}->Void) : Query;

	/**
	 * Finds a single document by its _id field. `findById(id)` is equivalent to
	 * `findOne({ _id: id })`.
	 *
	 * The `id` is cast based on the Schema before sending the command.
	 *
	 * ####Example:
	 *
	 *     // find adventure by id and execute immediately
	 *     Adventure.findById(id, function (err, adventure) {});
	 *
	 *     // same as above
	 *     Adventure.findById(id).exec(callback);
	 *
	 *     // select only the adventures name and length
	 *     Adventure.findById(id, 'name length', function (err, adventure) {});
	 *
	 *     // same as above
	 *     Adventure.findById(id, 'name length').exec(callback);
	 *
	 *     // include all properties except for `length`
	 *     Adventure.findById(id, '-length').exec(function (err, adventure) {});
	 *
	 *     // passing options (in this case return the raw js objects, not mongoose documents by passing `lean`
	 *     Adventure.findById(id, 'name', { lean: true }, function (err, doc) {});
	 *
	 *     // same as above
	 *     Adventure.findById(id, 'name').lean().exec(function (err, doc) {});
	 *
	 * @param {Object|String|Number} id value of `_id` to query by
	 * @param {Object} [projection] optional fields to return (http://bit.ly/1HotzBo)
	 * @param {Object} [options] optional
	 * @param {Function} [callback]
	 * @return {Query}
	 * @see field selection #query_Query-select
	 * @see lean queries #query_Query-lean
	 * @api public
	 */
	@:overload(function (id:Id) : Query {})
	@:overload(function (id:Id, projection:{}) : Query {})
	@:overload(function (id:Id, projection:{}, options:{}) : Query {})
	@:overload(function (id:Id, projection:{}, callback:Error->{}) : Query {})
	@:overload(function (id:Id, callback:Error->{}) : Query {})
	public function findById(id:Id, projection:{}, options:{}, callback:Error->{}->Void) : Query;

	/**
	 * Finds one document.
	 *
	 * The `conditions` are cast to their respective SchemaTypes before the command is sent.
	 *
	 * ####Example:
	 *
	 *     // find one iphone adventures - iphone adventures??
	 *     Adventure.findOne({ type: 'iphone' }, function (err, adventure) {});
	 *
	 *     // same as above
	 *     Adventure.findOne({ type: 'iphone' }).exec(function (err, adventure) {});
	 *
	 *     // select only the adventures name
	 *     Adventure.findOne({ type: 'iphone' }, 'name', function (err, adventure) {});
	 *
	 *     // same as above
	 *     Adventure.findOne({ type: 'iphone' }, 'name').exec(function (err, adventure) {});
	 *
	 *     // specify options, in this case lean
	 *     Adventure.findOne({ type: 'iphone' }, 'name', { lean: true }, callback);
	 *
	 *     // same as above
	 *     Adventure.findOne({ type: 'iphone' }, 'name', { lean: true }).exec(callback);
	 *
	 *     // chaining findOne queries (same as above)
	 *     Adventure.findOne({ type: 'iphone' }).select('name').lean().exec(callback);
	 *
	 * @param {Object} [conditions]
	 * @param {Object} [projection] optional fields to return (http://bit.ly/1HotzBo)
	 * @param {Object} [options] optional
	 * @param {Function} [callback]
	 * @return {Query}
	 * @see field selection #query_Query-select
	 * @see lean queries #query_Query-lean
	 * @api public
	 */
	@:overload(function (conditions:{}) : Query {})
	@:overload(function (conditions:{}, projection:{}) : Query {})
	@:overload(function (conditions:{}, projection:{}, options:{}) : Query {})
	@:overload(function (conditions:{}, projection:{}, callback:Error->{}) : Query {})
	@:overload(function (conditions:{}, callback:Error->{}) : Query {})
	public function findOne(conditions:{}, projection:{}, options:{}, callback:Error->{}->Void) : Query;

	/**
	 * Counts number of matching documents in a database collection.
	 *
	 * ####Example:
	 *
	 *     Adventure.count({ type: 'jungle' }, function (err, count) {
	 *       if (err) ..
	 *       console.log('there are %d jungle adventures', count);
	 *     });
	 *
	 * @param {Object} conditions
	 * @param {Function} [callback]
	 * @return {Query}
	 * @api public
	 */
	@:overload(function (conditions:{}) : Query {})
	@:overload(function (callback:Error->Int->Void) : Query {})
	@:overload(function () : Query {})
	public function count(conditions:{}, callback:Error->Int->Void) : Query;

	/**
	 * Creates a Query for a `distinct` operation.
	 *
	 * Passing a `callback` immediately executes the query.
	 *
	 * ####Example
	 *
	 *     Link.distinct('url', { clicks: {$gt: 100}}, function (err, result) {
	 *       if (err) return handleError(err);
	 *
	 *       assert(Array.isArray(result));
	 *       console.log('unique urls with more than 100 clicks', result);
	 *     })
	 *
	 *     var query = Link.distinct('url');
	 *     query.exec(callback);
	 *
	 * @param {String} field
	 * @param {Object} [conditions] optional
	 * @param {Function} [callback]
	 * @return {Query}
	 * @api public
	 */
	@:overload(function (field:String, conditions:{}) : Query {})
	@:overload(function (field:String, callback:Error->Array<{}>->Void) : Query {})
	@:overload(function (field:String) : Query {})
	public function distinct(field:String, conditions:{}, callback:Error->Array<{}>->Void) : Query;

	/**
	 * Creates a Query, applies the passed conditions, and returns the Query.
	 *
	 * For example, instead of writing:
	 *
	 *     User.find({age: {$gte: 21, $lte: 65}}, callback);
	 *
	 * we can instead write:
	 *
	 *     User.where('age').gte(21).lte(65).exec(callback);
	 *
	 * Since the Query class also supports `where` you can continue chaining
	 *
	 *     User
	 *     .where('age').gte(21).lte(65)
	 *     .where('name', /^b/i)
	 *     ... etc
	 *
	 * @param {String} path
	 * @param {Object} [val] optional value
	 * @return {Query}
	 * @api public
	 */
	@:overload(function (path:String) : Query {})
	public function where(path:String, val:Dynamic) : Query;

	/**
	 * Issues a mongodb findAndModify update command.
	 *
	 * Finds a matching document, updates it according to the `update` arg, passing any `options`, and returns the found document (if any) to the callback. 
	 * The query executes immediately if `callback` is passed else a Query object is returned.
	 *
	 * ####Options:
	 *
	 * - `new`: bool - if true, return the modified document rather than the original. defaults to false (changed in 4.0)
	 * - `upsert`: bool - creates the object if it doesn't exist. defaults to false.
	 * - `sort`: if multiple docs are found by the conditions, sets the sort order to choose which doc to update
	 * - `select`: sets the document fields to return
	 *
	 * ####Examples:
	 *
	 *     A.findOneAndUpdate(conditions, update, options, callback) // executes
	 *     A.findOneAndUpdate(conditions, update, options)  // returns Query
	 *     A.findOneAndUpdate(conditions, update, callback) // executes
	 *     A.findOneAndUpdate(conditions, update)           // returns Query
	 *     A.findOneAndUpdate()                             // returns Query
	 *
	 * ####Note:
	 *
	 * All top level update keys which are not `atomic` operation names are treated as set operations:
	 *
	 * ####Example:
	 *
	 *     var query = { name: 'borne' };
	 *     Model.findOneAndUpdate(query, { name: 'jason borne' }, options, callback)
	 *
	 *     // is sent as
	 *     Model.findOneAndUpdate(query, { $set: { name: 'jason borne' }}, options, callback)
	 *
	 * This helps prevent accidentally overwriting your document with `{ name: 'jason borne' }`.
	 *
	 * ####Note:
	 *
	 * Although values are cast to their appropriate types when using the findAndModify helpers, the following are *not* applied:
	 *
	 * - defaults
	 * - setters
	 * - validators
	 * - middleware
	 *
	 * If you need those features, use the traditional approach of first retrieving the document.
	 *
	 *     Model.findOne({ name: 'borne' }, function (err, doc) {
	 *       if (err) ..
	 *       doc.name = 'jason borne';
	 *       doc.save(callback);
	 *     })
	 *
	 * @param {Object} [conditions]
	 * @param {Object} [update]
	 * @param {Object} [options]
	 * @param {Function} [callback]
	 * @return {Query}
	 * @see mongodb http://www.mongodb.org/display/DOCS/findAndModify+Command
	 * @api public
	 */
	@:overload(function (conditions:{}, update:{}, options:{}) : Query {})
	@:overload(function (conditions:{}, update:{}, callback:Error->{}->Void) : Query {})
	@:overload(function (conditions:{}, update:{}) : Query {})
	public function findOneAndUpdate(conditions:{}, update:{}, options:{}, callback:Error->{}->Void) : Query;

	/**
	 * Issues a mongodb findAndModify update command by a document's _id field. `findByIdAndUpdate(id, ...)` is equivalent to `findOneAndUpdate({ _id: id }, ...)`.
	 *
	 * Finds a matching document, updates it according to the `update` arg, passing any `options`, and returns the found document (if any) to the callback. The query executes immediately if `callback` is passed else a Query object is returned.
	 *
	 * ####Options:
	 *
	 * - `new`: bool - true to return the modified document rather than the original. defaults to false
	 * - `upsert`: bool - creates the object if it doesn't exist. defaults to false.
	 * - `sort`: if multiple docs are found by the conditions, sets the sort order to choose which doc to update
	 * - `select`: sets the document fields to return
	 *
	 * ####Examples:
	 *
	 *     A.findByIdAndUpdate(id, update, options, callback) // executes
	 *     A.findByIdAndUpdate(id, update, options)  // returns Query
	 *     A.findByIdAndUpdate(id, update, callback) // executes
	 *     A.findByIdAndUpdate(id, update)           // returns Query
	 *     A.findByIdAndUpdate()                     // returns Query
	 *
	 * ####Note:
	 *
	 * All top level update keys which are not `atomic` operation names are treated as set operations:
	 *
	 * ####Example:
	 *
	 *     Model.findByIdAndUpdate(id, { name: 'jason borne' }, options, callback)
	 *
	 *     // is sent as
	 *     Model.findByIdAndUpdate(id, { $set: { name: 'jason borne' }}, options, callback)
	 *
	 * This helps prevent accidentally overwriting your document with `{ name: 'jason borne' }`.
	 *
	 * ####Note:
	 *
	 * Although values are cast to their appropriate types when using the findAndModify helpers, the following are *not* applied:
	 *
	 * - defaults
	 * - setters
	 * - validators
	 * - middleware
	 *
	 * If you need those features, use the traditional approach of first retrieving the document.
	 *
	 *     Model.findById(id, function (err, doc) {
	 *       if (err) ..
	 *       doc.name = 'jason borne';
	 *       doc.save(callback);
	 *     })
	 *
	 * @param {Object|Number|String} id value of `_id` to query by
	 * @param {Object} [update]
	 * @param {Object} [options]
	 * @param {Function} [callback]
	 * @return {Query}
	 * @see Model.findOneAndUpdate #model_Model.findOneAndUpdate
	 * @see mongodb http://www.mongodb.org/display/DOCS/findAndModify+Command
	 * @api public
	 */
	@:overload(function (id:Id, update:{}, options:{}) : Query {})
	@:overload(function (id:Id, update:{}, callback:Error->{}->Void) : Query {})
	@:overload(function (id:Id, update:{}) : Query {})
	public function findByIdAndUpdate(id:Id, update:{}, options:{}, callback:Error->{}->Void) : Query;

	/**
	 * Issue a mongodb findAndModify remove command.
	 *
	 * Finds a matching document, removes it, passing the found document (if any) to the callback.
	 *
	 * Executes immediately if `callback` is passed else a Query object is returned.
	 *
	 * ####Options:
	 *
	 * - `sort`: if multiple docs are found by the conditions, sets the sort order to choose which doc to update
	 * - `select`: sets the document fields to return
	 *
	 * ####Examples:
	 *
	 *     A.findOneAndRemove(conditions, options, callback) // executes
	 *     A.findOneAndRemove(conditions, options)  // return Query
	 *     A.findOneAndRemove(conditions, callback) // executes
	 *     A.findOneAndRemove(conditions) // returns Query
	 *     A.findOneAndRemove()           // returns Query
	 *
	 * Although values are cast to their appropriate types when using the findAndModify helpers, the following are *not* applied:
	 *
	 * - defaults
	 * - setters
	 * - validators
	 * - middleware
	 *
	 * If you need those features, use the traditional approach of first retrieving the document.
	 *
	 *     Model.findById(id, function (err, doc) {
	 *       if (err) ..
	 *       doc.remove(callback);
	 *     })
	 *
	 * @param {Object} conditions
	 * @param {Object} [options]
	 * @param {Function} [callback]
	 * @return {Query}
	 * @see mongodb http://www.mongodb.org/display/DOCS/findAndModify+Command
	 * @api public
	 */
	@:overload(function (conditions:{}, options:{}) : Query {})
	@:overload(function (conditions:{}, callback:Error->{}->Void) : Query {})
	@:overload(function (conditions:{}) : Query {})
	public function findOneAndRemove(conditions:{}, options:{}, callback:Error->{}->Void) : Query;

	/**
	 * Issue a mongodb findAndModify remove command by a document's _id field. `findByIdAndRemove(id, ...)` is equivalent to `findOneAndRemove({ _id: id }, ...)`.
	 *
	 * Finds a matching document, removes it, passing the found document (if any) to the callback.
	 *
	 * Executes immediately if `callback` is passed, else a `Query` object is returned.
	 *
	 * ####Options:
	 *
	 * - `sort`: if multiple docs are found by the conditions, sets the sort order to choose which doc to update
	 * - `select`: sets the document fields to return
	 *
	 * ####Examples:
	 *
	 *     A.findByIdAndRemove(id, options, callback) // executes
	 *     A.findByIdAndRemove(id, options)  // return Query
	 *     A.findByIdAndRemove(id, callback) // executes
	 *     A.findByIdAndRemove(id) // returns Query
	 *     A.findByIdAndRemove()           // returns Query
	 *
	 * @param {Object|Number|String} id value of `_id` to query by
	 * @param {Object} [options]
	 * @param {Function} [callback]
	 * @return {Query}
	 * @see Model.findOneAndRemove #model_Model.findOneAndRemove
	 * @see mongodb http://www.mongodb.org/display/DOCS/findAndModify+Command
	 */
	@:overload(function (id:Id, options:{}) : Query {})
	@:overload(function (id:Id, callback:Error->{}->Void) : Query {})
	@:overload(function (id:Id) : Query {})
	public function findByIdAndRemove(id:Id, options:{}, callback:Error->{}->Void) : Query;

	/**
	 * Shortcut for creating a new Document that is automatically saved to the db if valid.
	 *
	 * ####Example:
	 *
	 *     // pass individual docs
	 *     Candy.create({ type: 'jelly bean' }, { type: 'snickers' }, function (err, jellybean, snickers) {
	 *       if (err) // ...
	 *     });
	 *
	 *     // pass an array
	 *     var array = [{ type: 'jelly bean' }, { type: 'snickers' }];
	 *     Candy.create(array, function (err, candies) {
	 *       if (err) // ...
	 *
	 *       var jellybean = candies[0];
	 *       var snickers = candies[1];
	 *       // ...
	 *     });
	 *
	 *     // callback is optional; use the returned promise if you like:
	 *     var promise = Candy.create({ type: 'jawbreaker' });
	 *     promise.then(function (jawbreaker) {
	 *       // ...
	 *     })
	 *
	 * @param {Array|Object...} doc(s)
	 * @param {Function} [fn] callback
	 * @return {Promise}
	 * @api public
	 */
	@:overload(function (doc:{}) : Promise {})
	@:overload(function (doc:Array<{}>, fn:Error->Array<{}>->Void) : Promise {})
	@:overload(function (doc:Array<{}>) : Promise {})
	public function create(doc:{}, fn:Error->{}->Void) : Promise;

	/**
	 * Shortcut for creating a new Document from existing raw data, pre-saved in the DB.
	 * The document returned has no paths marked as modified initially.
	 *
	 * ####Example:
	 *
	 *     // hydrate previous data into a Mongoose document
	 *     var mongooseCandy = Candy.hydrate({ _id: '54108337212ffb6d459f854c', type: 'jelly bean' });
	 *
	 * @param {Object} obj
	 * @return {Document}
	 * @api public
	 */
	public function hydrate(obj:{}) : Model;

	/**
	 * Updates documents in the database without returning them.
	 *
	 * ####Examples:
	 *
	 *     MyModel.update({ age: { $gt: 18 } }, { oldEnough: true }, fn);
	 *     MyModel.update({ name: 'Tobi' }, { ferret: true }, { multi: true }, function (err, raw) {
	 *       if (err) return handleError(err);
	 *       console.log('The raw response from Mongo was ', raw);
	 *     });
	 *
	 * ####Valid options:
	 *
	 *  - `safe` (boolean) safe mode (defaults to value set in schema (true))
	 *  - `upsert` (boolean) whether to create the doc if it doesn't match (false)
	 *  - `multi` (boolean) whether multiple documents should be updated (false)
	 *  - `strict` (boolean) overrides the `strict` option for this update
	 *  - `overwrite` (boolean) disables update-only mode, allowing you to overwrite the doc (false)
	 *
	 * All `update` values are cast to their appropriate SchemaTypes before being sent.
	 *
	 * The `callback` function receives `(err, rawResponse)`.
	 *
	 * - `err` is the error if any occurred
	 * - `rawResponse` is the full response from Mongo
	 *
	 * ####Note:
	 *
	 * All top level keys which are not `atomic` operation names are treated as set operations:
	 *
	 * ####Example:
	 *
	 *     var query = { name: 'borne' };
	 *     Model.update(query, { name: 'jason borne' }, options, callback)
	 *
	 *     // is sent as
	 *     Model.update(query, { $set: { name: 'jason borne' }}, options, callback)
	 *     // if overwrite option is false. If overwrite is true, sent without the $set wrapper.
	 *
	 * This helps prevent accidentally overwriting all documents in your collection with `{ name: 'jason borne' }`.
	 *
	 * ####Note:
	 *
	 * Be careful to not use an existing model instance for the update clause (this won't work and can cause weird behavior like infinite loops). Also, ensure that the update clause does not have an _id property, which causes Mongo to return a "Mod on _id not allowed" error.
	 *
	 * ####Note:
	 *
	 * To update documents without waiting for a response from MongoDB, do not pass a `callback`, then call `exec` on the returned [Query](#query-js):
	 *
	 *     Comment.update({ _id: id }, { $set: { text: 'changed' }}).exec();
	 *
	 * ####Note:
	 *
	 * Although values are casted to their appropriate types when using update, the following are *not* applied:
	 *
	 * - defaults
	 * - setters
	 * - validators
	 * - middleware
	 *
	 * If you need those features, use the traditional approach of first retrieving the document.
	 *
	 *     Model.findOne({ name: 'borne' }, function (err, doc) {
	 *       if (err) ..
	 *       doc.name = 'jason borne';
	 *       doc.save(callback);
	 *     })
	 *
	 * @see strict http://mongoosejs.com/docs/guide.html#strict
	 * @see response http://docs.mongodb.org/v2.6/reference/command/update/#output
	 * @param {Object} conditions
	 * @param {Object} doc
	 * @param {Object} [options]
	 * @param {Function} [callback]
	 * @return {Query}
	 * @api public
	 */
	@:overload(function (conditions:{}, doc:{}, options:{}) : Query {})
	@:overload(function (conditions:{}, doc:{}, callback:Error->{}->Void) : Query {})
	public function update(conditions:{}, doc:{}, options:{}, callback:Error->{}->Void) : Query;

	/**
	 * Executes a mapReduce command.
	 *
	 * `o` is an object specifying all mapReduce options as well as the map and reduce functions. All options are delegated to the driver implementation. See [node-mongodb-native mapReduce() documentation](http://mongodb.github.io/node-mongodb-native/api-generated/collection.html#mapreduce) for more detail about options.
	 *
	 * ####Example:
	 *
	 *     var o = {};
	 *     o.map = function () { emit(this.name, 1) }
	 *     o.reduce = function (k, vals) { return vals.length }
	 *     User.mapReduce(o, function (err, results) {
	 *       console.log(results)
	 *     })
	 *
	 * ####Other options:
	 *
	 * - `query` {Object} query filter object.
	 * - `sort` {Object} sort input objects using this key
	 * - `limit` {Number} max number of documents
	 * - `keeptemp` {Boolean, default:false} keep temporary data
	 * - `finalize` {Function} finalize function
	 * - `scope` {Object} scope variables exposed to map/reduce/finalize during execution
	 * - `jsMode` {Boolean, default:false} it is possible to make the execution stay in JS. Provided in MongoDB > 2.0.X
	 * - `verbose` {Boolean, default:false} provide statistics on job execution time.
	 * - `readPreference` {String}
	 * - `out*` {Object, default: {inline:1}} sets the output target for the map reduce job.
	 *
	 * ####* out options:
	 *
	 * - `{inline:1}` the results are returned in an array
	 * - `{replace: 'collectionName'}` add the results to collectionName: the results replace the collection
	 * - `{reduce: 'collectionName'}` add the results to collectionName: if dups are detected, uses the reducer / finalize functions
	 * - `{merge: 'collectionName'}` add the results to collectionName: if dups exist the new docs overwrite the old
	 *
	 * If `options.out` is set to `replace`, `merge`, or `reduce`, a Model instance is returned that can be used for further querying. Queries run against this model are all executed with the `lean` option; meaning only the js object is returned and no Mongoose magic is applied (getters, setters, etc).
	 *
	 * ####Example:
	 *
	 *     var o = {};
	 *     o.map = function () { emit(this.name, 1) }
	 *     o.reduce = function (k, vals) { return vals.length }
	 *     o.out = { replace: 'createdCollectionNameForResults' }
	 *     o.verbose = true;
	 *
	 *     User.mapReduce(o, function (err, model, stats) {
	 *       console.log('map reduce took %d ms', stats.processtime)
	 *       model.find().where('value').gt(10).exec(function (err, docs) {
	 *         console.log(docs);
	 *       });
	 *     })
	 *
	 *     // a promise is returned so you may instead write
	 *     var promise = User.mapReduce(o);
	 *     promise.then(function (model, stats) {
	 *       console.log('map reduce took %d ms', stats.processtime)
	 *       return model.find().where('value').gt(10).exec();
	 *     }).then(function (docs) {
	 *        console.log(docs);
	 *     }).then(null, handleError).end()
	 *
	 * @param {Object} o an object specifying map-reduce options
	 * @param {Function} [callback] optional callback
	 * @see http://www.mongodb.org/display/DOCS/MapReduce
	 * @return {Promise}
	 * @api public
	 */
	@:overload(function (o:{}) : Promise {}) 
	public function mapReduce(o:{}, callback:Error->{}->Void) : Promise;

	/**
	 * geoNear support for Mongoose
	 *
	 * ####Options:
	 * - `lean` {Boolean} return the raw object
	 * - All options supported by the driver are also supported
	 *
	 * ####Example:
	 *
	 *     // Legacy point
	 *     Model.geoNear([1,3], { maxDistance : 5, spherical : true }, function(err, results, stats) {
	 *        console.log(results);
	 *     });
	 *
	 *     // geoJson
	 *     var point = { type : "Point", coordinates : [9,9] };
	 *     Model.geoNear(point, { maxDistance : 5, spherical : true }, function(err, results, stats) {
	 *        console.log(results);
	 *     });
	 *
	 * @param {Object/Array} GeoJSON point or legacy coordinate pair [x,y] to search near
	 * @param {Object} options for the qurery
	 * @param {Function} [callback] optional callback for the query
	 * @return {Promise}
	 * @see http://docs.mongodb.org/manual/core/2dsphere/
	 * @see http://mongodb.github.io/node-mongodb-native/api-generated/collection.html?highlight=geonear#geoNear
	 * @api public
	 */
	@:overload(function (near:{}, options:{}) : Promise {})
	public function geoNear(near:{}, options:{}, callback:Error->{}->{}->Void) : Promise;

	/**
	 * Performs [aggregations](http://docs.mongodb.org/manual/applications/aggregation/) on the models collection.
	 *
	 * If a `callback` is passed, the `aggregate` is executed and a `Promise` is returned. If a callback is not passed, the `aggregate` itself is returned.
	 *
	 * ####Example:
	 *
	 *     // Find the max balance of all accounts
	 *     Users.aggregate(
	 *         { $group: { _id: null, maxBalance: { $max: '$balance' }}}
	 *       , { $project: { _id: 0, maxBalance: 1 }}
	 *       , function (err, res) {
	 *       if (err) return handleError(err);
	 *       console.log(res); // [ { maxBalance: 98000 } ]
	 *     });
	 *
	 *     // Or use the aggregation pipeline builder.
	 *     Users.aggregate()
	 *       .group({ _id: null, maxBalance: { $max: '$balance' } })
	 *       .select('-id maxBalance')
	 *       .exec(function (err, res) {
	 *         if (err) return handleError(err);
	 *         console.log(res); // [ { maxBalance: 98 } ]
	 *     });
	 *
	 * ####NOTE:
	 *
	 * - Arguments are not cast to the model's schema because `$project` operators allow redefining the "shape" of the documents at any stage of the pipeline, which may leave documents in an incompatible format.
	 * - The documents returned are plain javascript objects, not mongoose documents (since any shape of document can be returned).
	 * - Requires MongoDB >= 2.1
	 *
	 * @see Aggregate #aggregate_Aggregate
	 * @see MongoDB http://docs.mongodb.org/manual/applications/aggregation/
	 * @param {Object|Array} [...] aggregation pipeline operator(s) or operator array
	 * @param {Function} [callback]
	 * @return {Aggregate|Promise}
	 * @api public
	 */
	@:overload(function (op:Array<{}>, callback:Error->{}->Void) : Promise {})
	@:overload(function (op:{}) : {} {})
	@:overload(function (op:Array<{}>) : {} {})
	public function aggregate(op:{}, callback:Error->{}->Void) : Promise;

	/**
	 * Implements `$geoSearch` functionality for Mongoose
	 *
	 * ####Example:
	 *
	 *     var options = { near: [10, 10], maxDistance: 5 };
	 *     Locations.geoSearch({ type : "house" }, options, function(err, res) {
	 *       console.log(res);
	 *     });
	 *
	 * ####Options:
	 * - `near` {Array} x,y point to search for
	 * - `maxDistance` {Number} the maximum distance from the point near that a result can be
	 * - `limit` {Number} The maximum number of results to return
	 * - `lean` {Boolean} return the raw object instead of the Mongoose Model
	 *
	 * @param {Object} condition an object that specifies the match condition (required)
	 * @param {Object} options for the geoSearch, some (near, maxDistance) are required
	 * @param {Function} [callback] optional callback
	 * @return {Promise}
	 * @see http://docs.mongodb.org/manual/reference/command/geoSearch/
	 * @see http://docs.mongodb.org/manual/core/geohaystack/
	 * @api public
	 */
	@:overload(function (conditions:{}, options:{}) : Promise {})
	public function geoSearch(conditions:{}, options:{}, callback:Error->{}->Void) : Promise;

	/**
	 * Populates document references.
	 *
	 * ####Available options:
	 *
	 * - path: space delimited path(s) to populate
	 * - select: optional fields to select
	 * - match: optional query conditions to match
	 * - model: optional name of the model to use for population
	 * - options: optional query options like sort, limit, etc
	 *
	 * ####Examples:
	 *
	 *     // populates a single object
	 *     User.findById(id, function (err, user) {
	 *       var opts = [
	 *           { path: 'company', match: { x: 1 }, select: 'name' }
	 *         , { path: 'notes', options: { limit: 10 }, model: 'override' }
	 *       ]
	 *
	 *       User.populate(user, opts, function (err, user) {
	 *         console.log(user);
	 *       })
	 *     })
	 *
	 *     // populates an array of objects
	 *     User.find(match, function (err, users) {
	 *       var opts = [{ path: 'company', match: { x: 1 }, select: 'name' }]
	 *
	 *       var promise = User.populate(users, opts);
	 *       promise.then(console.log).end();
	 *     })
	 *
	 *     // imagine a Weapon model exists with two saved documents:
	 *     //   { _id: 389, name: 'whip' }
	 *     //   { _id: 8921, name: 'boomerang' }
	 *
	 *     var user = { name: 'Indiana Jones', weapon: 389 }
	 *     Weapon.populate(user, { path: 'weapon', model: 'Weapon' }, function (err, user) {
	 *       console.log(user.weapon.name) // whip
	 *     })
	 *
	 *     // populate many plain objects
	 *     var users = [{ name: 'Indiana Jones', weapon: 389 }]
	 *     users.push({ name: 'Batman', weapon: 8921 })
	 *     Weapon.populate(users, { path: 'weapon' }, function (err, users) {
	 *       users.forEach(function (user) {
	 *         console.log('%s uses a %s', users.name, user.weapon.name)
	 *         // Indiana Jones uses a whip
	 *         // Batman uses a boomerang
	 *       })
	 *     })
	 *     // Note that we didn't need to specify the Weapon model because
	 *     // we were already using it's populate() method.
	 *
	 * @param {Document|Array} docs Either a single document or array of documents to populate.
	 * @param {Object} options A hash of key/val (path, options) used for population.
	 * @param {Function} [cb(err,doc)] Optional callback, executed upon completion. Receives `err` and the `doc(s)`.
	 * @return {Promise}
	 * @api public
	 */
	@:overload(function (docs:Array<{}>, paths:{}, cb:Error->Array<{}>->Void) : Promise {})
	@:overload(function (docs:Array<{}>, paths:{}) : Promise {})
	@:overload(function (docs:{}, paths:{}) : Promise {})
	public function populate(docs:{}, paths:{}, cb:Error->{}->Void) : Promise;

} // End of Model class