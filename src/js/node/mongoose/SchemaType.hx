package js.node.mongoose;

import haxe.Constraints.Function;

@:jsRequire("mongoose", "SchemaType")
extern class SchemaType
{
	/**
	 * SchemaType constructor
	 *
	 * @param {String} path
	 * @param {Object} [options]
	 * @param {String} [instance]
	 * @api public
	 */
	public function new(path:String, ?options:{}, ?instance:String);

	/**
	 * Sets a default value for this SchemaType.
	 *
	 * ####Example:
	 *
	 *     var schema = new Schema({ n: { type: Number, default: 10 })
	 *     var M = db.model('M', schema)
	 *     var m = new M;
	 *     console.log(m.n) // 10
	 *
	 * Defaults can be either `functions` which return the value to use as the default or the literal value itself. 
	 * Either way, the value will be cast based on its schema type before being set during document creation.
	 *
	 * ####Example:
	 *
	 *     // values are cast:
	 *     var schema = new Schema({ aNumber: { type: Number, default: 4.815162342 }})
	 *     var M = db.model('M', schema)
	 *     var m = new M;
	 *     console.log(m.aNumber) // 4.815162342
	 *
	 *     // default unique objects for Mixed types:
	 *     var schema = new Schema({ mixed: Schema.Types.Mixed });
	 *     schema.path('mixed').default(function () {
	 *       return {};
	 *     });
	 *
	 *     // if we don't use a function to return object literals for Mixed defaults,
	 *     // each document will receive a reference to the same object literal creating
	 *     // a "shared" object instance:
	 *     var schema = new Schema({ mixed: Schema.Types.Mixed });
	 *     schema.path('mixed').default({});
	 *     var M = db.model('M', schema);
	 *     var m1 = new M;
	 *     m1.mixed.added = 1;
	 *     console.log(m1.mixed); // { added: 1 }
	 *     var m2 = new M;
	 *     console.log(m2.mixed); // { added: 1 }
	 *
	 * @param {Function|any} val the default value
	 * @return {defaultValue}
	 * @api public
	 */
	@:overload(function(val:Void->Dynamic) : SchemaType {})
	public inline function default_(val:Dynamic) : SchemaType
	{
		return untyped this['default'].apply(this, arguments);
	}	

	/**
	 * Declares the index options for this schematype.
	 *
	 * ####Example:
	 *
	 *     var s = new Schema({ name: { type: String, index: true })
	 *     var s = new Schema({ loc: { type: [Number], index: 'hashed' })
	 *     var s = new Schema({ loc: { type: [Number], index: '2d', sparse: true })
	 *     var s = new Schema({ loc: { type: [Number], index: { type: '2dsphere', sparse: true }})
	 *     var s = new Schema({ date: { type: Date, index: { unique: true, expires: '1d' }})
	 *     Schema.path('my.path').index(true);
	 *     Schema.path('my.date').index({ expires: 60 });
	 *     Schema.path('my.path').index({ unique: true, sparse: true });
	 *
	 * ####NOTE:
	 *
	 * _Indexes are created in the background by default. Specify `background: false` to override._
	 *
	 * [Direction doesn't matter for single key indexes](http://www.mongodb.org/display/DOCS/Indexes#Indexes-CompoundKeysIndexes)
	 *
	 * @param {Object|Boolean|String} options
	 * @return {SchemaType} this
	 * @api public
	 */
	@:overload(function(options:String) : SchemaType {})
	@:overload(function(options:Bool) : SchemaType {})
	public function index(options:{}) : SchemaType;

	/**
	 * Declares an unique index.
	 *
	 * ####Example:
	 *
	 *     var s = new Schema({ name: { type: String, unique: true }});
	 *     Schema.path('name').index({ unique: true });
	 *
	 * _NOTE: violating the constraint returns an `E11000` error from MongoDB when saving, not a Mongoose validation error._
	 *
	 * @param {Boolean} bool
	 * @return {SchemaType} this
	 * @api public
	 */
	public function unique(bool:Bool) : SchemaType;

	/**
	 * Declares a full text index.
	 *
	 * ###Example:
	 *
	 *      var s = new Schema({name : {type: String, text : true })
	 *      Schema.path('name').index({text : true});
	 * @param bool
	 * @return {SchemaType} this
	 * @api public
	 */
	public function text(bool:Bool) : SchemaType;

	/**
	 * Declares a sparse index.
	 *
	 * ####Example:
	 *
	 *     var s = new Schema({ name: { type: String, sparse: true })
	 *     Schema.path('name').index({ sparse: true });
	 *
	 * @param {Boolean} bool
	 * @return {SchemaType} this
	 * @api public
	 */
	public function sparse(bool:Bool) : SchemaType;

	/**
	 * Adds a setter to this schematype.
	 *
	 * ####Example:
	 *
	 *     function capitalize (val) {
	 *       if ('string' != typeof val) val = '';
	 *       return val.charAt(0).toUpperCase() + val.substring(1);
	 *     }
	 *
	 *     // defining within the schema
	 *     var s = new Schema({ name: { type: String, set: capitalize }})
	 *
	 *     // or by retreiving its SchemaType
	 *     var s = new Schema({ name: String })
	 *     s.path('name').set(capitalize)
	 *
	 * Setters allow you to transform the data before it gets to the raw mongodb document and is set as 
	 * a value on an actual key.
	 *
	 * Suppose you are implementing user registration for a website. Users provide an email and password, 
	 * which gets saved to mongodb. The email is a string that you will want to normalize to lower case, 
	 * in order to avoid one email having more than one account -- e.g., otherwise, avenue@q.com can be 
	 * registered for 2 accounts via avenue@q.com and AvEnUe@Q.CoM.
	 *
	 * You can set up email lower case normalization easily via a Mongoose setter.
	 *
	 *     function toLower (v) {
	 *       return v.toLowerCase();
	 *     }
	 *
	 *     var UserSchema = new Schema({
	 *       email: { type: String, set: toLower }
	 *     })
	 *
	 *     var User = db.model('User', UserSchema)
	 *
	 *     var user = new User({email: 'AVENUE@Q.COM'})
	 *     console.log(user.email); // 'avenue@q.com'
	 *
	 *     // or
	 *     var user = new User
	 *     user.email = 'Avenue@Q.com'
	 *     console.log(user.email) // 'avenue@q.com'
	 *
	 * As you can see above, setters allow you to transform the data before it gets to the raw mongodb document 
	 * and is set as a value on an actual key.
	 *
	 * _NOTE: we could have also just used the built-in `lowercase: true` SchemaType option instead of defining 
	 *        our own function._
	 *
	 *     new Schema({ email: { type: String, lowercase: true }})
	 *
	 * Setters are also passed a second argument, the schematype on which the setter was defined. This allows for 
	 * tailored behavior based on options passed in the schema.
	 *
	 *     function inspector (val, schematype) {
	 *       if (schematype.options.required) {
	 *         return schematype.path + ' is required';
	 *       } else {
	 *         return val;
	 *       }
	 *     }
	 *
	 *     var VirusSchema = new Schema({
	 *       name: { type: String, required: true, set: inspector },
	 *       taxonomy: { type: String, set: inspector }
	 *     })
	 *
	 *     var Virus = db.model('Virus', VirusSchema);
	 *     var v = new Virus({ name: 'Parvoviridae', taxonomy: 'Parvovirinae' });
	 *
	 *     console.log(v.name);     // name is required
	 *     console.log(v.taxonomy); // Parvovirinae
	 *
	 * @param {Function} fn
	 * @return {SchemaType} this
	 * @api public
	 */
	public function set(fn:Dynamic->SchemaType->Dynamic) : SchemaType;

	/**
	 * Adds a getter to this schematype.
	 *
	 * ####Example:
	 *
	 *     function dob (val) {
	 *       if (!val) return val;
	 *       return (val.getMonth() + 1) + "/" + val.getDate() + "/" + val.getFullYear();
	 *     }
	 *
	 *     // defining within the schema
	 *     var s = new Schema({ born: { type: Date, get: dob })
	 *
	 *     // or by retreiving its SchemaType
	 *     var s = new Schema({ born: Date })
	 *     s.path('born').get(dob)
	 *
	 * Getters allow you to transform the representation of the data as it travels from the raw 
	 * mongodb document to the value that you see.
	 *
	 * Suppose you are storing credit card numbers and you want to hide everything except the 
	 * last 4 digits to the mongoose user. You can do so by defining a getter in the following way:
	 *
	 *     function obfuscate (cc) {
	 *       return '****-****-****-' + cc.slice(cc.length-4, cc.length);
	 *     }
	 *
	 *     var AccountSchema = new Schema({
	 *       creditCardNumber: { type: String, get: obfuscate }
	 *     });
	 *
	 *     var Account = db.model('Account', AccountSchema);
	 *
	 *     Account.findById(id, function (err, found) {
	 *       console.log(found.creditCardNumber); // '****-****-****-1234'
	 *     });
	 *
	 * Getters are also passed a second argument, the schematype on which the getter was defined. 
	 * This allows for tailored behavior based on options passed in the schema.
	 *
	 *     function inspector (val, schematype) {
	 *       if (schematype.options.required) {
	 *         return schematype.path + ' is required';
	 *       } else {
	 *         return schematype.path + ' is not';
	 *       }
	 *     }
	 *
	 *     var VirusSchema = new Schema({
	 *       name: { type: String, required: true, get: inspector },
	 *       taxonomy: { type: String, get: inspector }
	 *     })
	 *
	 *     var Virus = db.model('Virus', VirusSchema);
	 *
	 *     Virus.findById(id, function (err, virus) {
	 *       console.log(virus.name);     // name is required
	 *       console.log(virus.taxonomy); // taxonomy is not
	 *     })
	 *
	 * @param {Function} fn
	 * @return {SchemaType} this
	 * @api public
	 */
	public function get(fn:Dynamic->SchemaType->Dynamic) : SchemaType;


	/**
	 * Adds validator(s) for this document path.
	 *
	 * Validators always receive the value to validate as their first argument and must return `Boolean`. 
	 * Returning `false` means validation failed.
	 *
	 * The error message argument is optional. If not passed, the 
	 * [default generic error message template](#error_messages_MongooseError-messages) will be used.
	 *
	 * ####Examples:
	 *
	 *     // make sure every value is equal to "something"
	 *     function validator (val) {
	 *       return val == 'something';
	 *     }
	 *     new Schema({ name: { type: String, validate: validator }});
	 *
	 *     // with a custom error message
	 *
	 *     var custom = [validator, 'Uh oh, {PATH} does not equal "something".']
	 *     new Schema({ name: { type: String, validate: custom }});
	 *
	 *     // adding many validators at a time
	 *
	 *     var many = [
	 *         { validator: validator, msg: 'uh oh' }
	 *       , { validator: anotherValidator, msg: 'failed' }
	 *     ]
	 *     new Schema({ name: { type: String, validate: many }});
	 *
	 *     // or utilizing SchemaType methods directly:
	 *
	 *     var schema = new Schema({ name: 'string' });
	 *     schema.path('name').validate(validator, 'validation of `{PATH}` failed with value `{VALUE}`');
	 *
	 * ####Error message templates:
	 *
	 * From the examples above, you may have noticed that error messages support baseic templating. 
	 * There are a few other template keywords besides `{PATH}` and `{VALUE}` too. To find out more, 
	 * details are available [here](#error_messages_MongooseError-messages)
	 *
	 * ####Asynchronous validation:
	 *
	 * Passing a validator function that receives two arguments tells mongoose that the validator is 
	 * an asynchronous validator. The first argument passed to the validator function is the value being 
	 * validated. The second argument is a callback function that must called when you finish validating 
	 * the value and passed either `true` or `false` to communicate either success or failure respectively.
	 *
	 *     schema.path('name').validate(function (value, respond) {
	 *       doStuff(value, function () {
	 *         ...
	 *         respond(false); // validation failed
	 *       })
	*      }, '{PATH} failed validation.');
	*
	 * You might use asynchronous validators to retreive other documents from the database to validate 
	 * against or to meet other I/O bound validation needs.
	 *
	 * Validation occurs `pre('save')` or whenever you manually execute [document#validate](#document_Document-validate).
	 *
	 * If validation fails during `pre('save')` and no callback was passed to receive the error, 
	 * an `error` event will be emitted on your Models associated db [connection](#connection_Connection), 
	 * passing the validation error object along.
	 *
	 *     var conn = mongoose.createConnection(..);
	 *     conn.on('error', handleError);
	 *
	 *     var Product = conn.model('Product', yourSchema);
	 *     var dvd = new Product(..);
	 *     dvd.save(); // emits error on the `conn` above
	 *
	 * If you desire handling these errors at the Model level, attach an `error` listener to your Model 
	 * and the event will instead be emitted there.
	 *
	 *     // registering an error listener on the Model lets us handle errors more locally
	 *     Product.on('error', handleError);
	 *
	 * @param {RegExp|Function|Object} obj validator
	 * @param {String} [errorMsg] optional error message
	 * @param {String} [type] optional validator type
	 * @return {SchemaType} this
	 * @api public
	 */
	@:overload(function(obj:Function, message:String, type:String) : SchemaType {}) 
	@:overload(function(obj:Function, message:String) : SchemaType {}) 
	@:overload(function(obj:Function, type:String) : SchemaType {}) 
	@:overload(function(obj:{}, message:String) : SchemaType {}) 
	@:overload(function(obj:{}, type:String) : SchemaType {}) 
	public function validate(obj:{}, message:String, type:String) : SchemaType;

	/**
	 * Adds a required validator to this schematype. The required validator is added
	 * to the front of the validators array using `unshift()`.
	 *
	 * ####Example:
	 *
	 *     var s = new Schema({ born: { type: Date, required: true })
	 *
	 *     // or with custom error message
	 *
	 *     var s = new Schema({ born: { type: Date, required: '{PATH} is required!' })
	 *
	 *     // or through the path API
	 *
	 *     Schema.path('name').required(true);
	 *
	 *     // with custom error messaging
	 *
	 *     Schema.path('name').required(true, 'grrr :( ');
	 *
	 *
	 * @param {Boolean} required enable/disable the validator
	 * @param {String} [message] optional custom error message
	 * @return {SchemaType} this
	 * @see Customized Error Messages #error_messages_MongooseError-messages
	 * @api public
	 */
	public function required(required:Bool, ?message:String) : SchemaType;

	/**
	 * Sets default `select()` behavior for this path.
	 *
	 * Set to `true` if this path should always be included in the results, 
	 * `false` if it should be excluded by default. This setting can be overridden at the query level.
	 *
	 * ####Example:
	 *
	 *     T = db.model('T', new Schema({ x: { type: String, select: true }}));
	 *     T.find(..); // field x will always be selected ..
	 *     // .. unless overridden;
	 *     T.find().select('-x').exec(callback);
	 *
	 * @param {Boolean} val
	 * @return {SchemaType} this
	 * @api public
	 */
	public function select(val:Bool) : SchemaType;

} // End of SchemaType class
