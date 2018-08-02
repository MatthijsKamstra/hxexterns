package js.node.mongoose;

import haxe.Constraints.Function;
import haxe.extern.EitherType;
import haxe.extern.Rest;
import js.node.mongodb.ReadPreference;
import js.node.mongoose.Promise.Reason;
import js.node.stream.Readable;

typedef Number = EitherType<Int,Float>;
typedef Geometry = {type:String, coordinates:Array<Number>};
typedef QueryInfo = {collectionName:String, conditions:{}, options:{}, doc:{}};
typedef TraceFuncCallback = Error->Dynamic->Float;
typedef TraceFunc = {}->QueryInfo->{}->TraceFuncCallback;


@:jsRequire("mongoose", "Query")
extern class Query
{
	/**
	 * Converts this query to a customized, reusable query constructor with all arguments and options retained.
	 *
	 * ####Example
	 *
	 *     // Create a query for adventure movies and read from the primary
	 *     // node in the replica-set unless it is down, in which case we'll
	 *     // read from a secondary node.
	 *     var query = Movie.find({ tags: 'adventure' }).read('primaryPreferred');
	 *
	 *     // create a custom Query constructor based off these settings
	 *     var Adventure = query.toConstructor();
	 *
	 *     // Adventure is now a subclass of mongoose.Query and works the same way but with the
	 *     // default query parameters and options set.
	 *     Adventure().exec(callback)
	 *
	 *     // further narrow down our query results while still using the previous settings
	 *     Adventure().where({ name: /^Life/ }).exec(callback);
	 *
	 *     // since Adventure is a stand-alone constructor we can also add our own
	 *     // helper methods and getters without impacting global queries
	 *     Adventure.prototype.startsWith = function (prefix) {
	 *       this.where({ name: new RegExp('^' + prefix) })
	 *       return this;
	 *     }
	 *     Object.defineProperty(Adventure.prototype, 'highlyRated', {
	 *       get: function () {
	 *         this.where({ rating: { $gt: 4.5 }});
	 *         return this;
	 *       }
	 *     })
	 *     Adventure().highlyRated.startsWith('Life').exec(callback)
	 *
	 * New in 3.7.3
	 *
	 * @return {Query} subclass-of-Query
	 * @api public
	 */	
	public function toConstructor() : Query;

	/**
	 * Sets query options.
	 *
	 * ####Options:
	 *
	 * - [tailable](http://www.mongodb.org/display/DOCS/Tailable+Cursors) *
	 * - [sort](http://www.mongodb.org/display/DOCS/Advanced+Queries#AdvancedQueries-%7B%7Bsort(\)%7D%7D) *
	 * - [limit](http://www.mongodb.org/display/DOCS/Advanced+Queries#AdvancedQueries-%7B%7Blimit%28%29%7D%7D) *
	 * - [skip](http://www.mongodb.org/display/DOCS/Advanced+Queries#AdvancedQueries-%7B%7Bskip%28%29%7D%7D) *
	 * - [maxScan](http://www.mongodb.org/display/DOCS/Advanced+Queries#AdvancedQueries-%24maxScan) *
	 * - [maxTime](http://docs.mongodb.org/manual/reference/operator/meta/maxTimeMS/#op._S_maxTimeMS) *
	 * - [batchSize](http://www.mongodb.org/display/DOCS/Advanced+Queries#AdvancedQueries-%7B%7BbatchSize%28%29%7D%7D) *
	 * - [comment](http://www.mongodb.org/display/DOCS/Advanced+Queries#AdvancedQueries-%24comment) *
	 * - [snapshot](http://www.mongodb.org/display/DOCS/Advanced+Queries#AdvancedQueries-%7B%7Bsnapshot%28%29%7D%7D) *
	 * - [hint](http://www.mongodb.org/display/DOCS/Advanced+Queries#AdvancedQueries-%24hint) *
	 * - [slaveOk](http://docs.mongodb.org/manual/applications/replication/#read-preference) *
	 * - [safe](http://www.mongodb.org/display/DOCS/getLastError+Command)
	 * - collection the collection to query against
	 *
	 * _* denotes a query helper method is also available_
	 *
	 * @param {Object} options
	 * @return {this}
	 * @api public
	 */
	public function setOptions(options:{}) : Query;

	/**
	 * Specifies a `$where` condition
	 *
	 * Use `$where` when you need to select documents using a JavaScript expression.
	 *
	 * ####Example
	 *
	 *     query.$where('this.comments.length > 10 || this.name.length > 5')
	 *
	 *     query.$where(function () {
	 *       return this.comments.length > 10 || this.name.length > 5;
	 *     })
	 *
	 * @param {String|Function} js javascript string or function
	 * @return {Query} this
	 * @memberOf Query
	 * @method $where
	 * @api public
	 */
	@:overload(function (js:Function) : Query {})
	public inline function _where(js:String) : Query
	{
		return untyped this["$where"](js);
	}

	/**
	 * Specifies a `path` for use with chaining.
	 *
	 * ####Example
	 *
	 *     // instead of writing:
	 *     User.find({age: {$gte: 21, $lte: 65}}, callback);
	 *
	 *     // we can instead write:
	 *     User.where('age').gte(21).lte(65);
	 *
	 *     // passing query conditions is permitted
	 *     User.find().where({ name: 'vonderful' })
	 *
	 *     // chaining
	 *     User
	 *     .where('age').gte(21).lte(65)
	 *     .where('name', /^vonderful/i)
	 *     .where('friends').slice(10)
	 *     .exec(callback)
	 *
	 * @param {String} [path]
	 * @param {Object} [val]
	 * @return {Query} this
	 * @api public
	 */
	@:overload(function (val:{}) : Query {})
	public function where(path:String, val:Rest<Dynamic>) : Query;

	/**
	 * Specifies the complementary comparison value for paths specified with `where()`
	 *
	 * ####Example
	 *
	 *     User.where('age').equals(49);
	 *
	 *     // is the same as
	 *
	 *     User.where('age', 49);
	 *
	 * @param {Object} val
	 * @return {Query} this
	 * @api public
	 */
	public function equals(val:Dynamic) : Query;

	/**
	 * Specifies arguments for an `$or` condition.
	 *
	 * ####Example
	 *
	 *     query.or([{ color: 'red' }, { status: 'emergency' }])
	 *
	 * @param {Array} array array of conditions
	 * @return {Query} this
	 * @api public
	 */
	public function or(array:Array<{}>) : Query;

	/**
	 * Specifies arguments for a `$nor` condition.
	 *
	 * ####Example
	 *
	 *     query.nor([{ color: 'green' }, { status: 'ok' }])
	 *
	 * @param {Array} array array of conditions
	 * @return {Query} this
	 * @api public
	 */
	public function nor(array:Array<{}>) : Query;	

	/**
	 * Specifies arguments for a `$and` condition.
	 *
	 * ####Example
	 *
	 *     query.and([{ color: 'green' }, { status: 'ok' }])
	 *
	 * @see $and http://docs.mongodb.org/manual/reference/operator/and/
	 * @param {Array} array array of conditions
	 * @return {Query} this
	 * @api public
	 */
	public function and(array:Array<{}>) : Query;

	/**
	 * Specifies a $gt query condition.
	 *
	 * When called with one argument, the most recent path passed to `where()` is used.
	 *
	 * ####Example
	 *
	 *     Thing.find().where('age').gt(21)
	 *
	 *     // or
	 *     Thing.find().gt('age', 21)
	 *
	 * @method gt
	 * @memberOf Query
	 * @param {String} [path]
	 * @param {Number} val
	 * @api public
	 */
	 public function gt(?path:String, val:Number) : Query;

	/**
	 * Specifies a $gte query condition.
	 *
	 * When called with one argument, the most recent path passed to `where()` is used.
	 *
	 * @method gte
	 * @memberOf Query
	 * @param {String} [path]
	 * @param {Number} val
	 * @api public
	 */
	public function gte(?path:String, val:Number) : Query;

	/**
	 * Specifies a $lt query condition.
	 *
	 * When called with one argument, the most recent path passed to `where()` is used.
	 *
	 * @method lt
	 * @memberOf Query
	 * @param {String} [path]
	 * @param {Number} val
	 * @api public
	 */
	public function lt(?path:String, val:Number) : Query;

	/**
	 * Specifies a $lte query condition.
	 *
	 * When called with one argument, the most recent path passed to `where()` is used.
	 *
	 * @method lte
	 * @memberOf Query
	 * @param {String} [path]
	 * @param {Number} val
	 * @api public
	 */
	public function lte(?path:String, val:Number) : Query;

	/**
	 * Specifies a $ne query condition.
	 *
	 * When called with one argument, the most recent path passed to `where()` is used.
	 *
	 * @method ne
	 * @memberOf Query
	 * @param {String} [path]
	 * @param {Number} val
	 * @api public
	 */
	public function ne(?path:String, val:Dynamic) : Query;

	/**
	 * Specifies an $in query condition.
	 *
	 * When called with one argument, the most recent path passed to `where()` is used.
	 *
	 * @method in
	 * @memberOf Query
	 * @param {String} [path]
	 * @param {Number} val
	 * @api public
	 */
	public inline function in_(?path:String, val:Dynamic) : Query
	{
		if(path == null)
		{
			return untyped this["in"](val);
		}
		else 
		{
			return untyped this["in"](path,val);
		}
	}

	/**
	 * Specifies an $nin query condition.
	 *
	 * When called with one argument, the most recent path passed to `where()` is used.
	 *
	 * @method nin
	 * @memberOf Query
	 * @param {String} [path]
	 * @param {Number} val
	 * @api public
	 */
	public function nin(?path:String, val:Dynamic) : Query;

	/**
	 * Specifies an $all query condition.
	 *
	 * When called with one argument, the most recent path passed to `where()` is used.
	 *
	 * @method all
	 * @memberOf Query
	 * @param {String} [path]
	 * @param {Number} val
	 * @api public
	 */
	public function all(?path:String, val:Dynamic) : Query;

	/**
	 * Specifies a $size query condition.
	 *
	 * When called with one argument, the most recent path passed to `where()` is used.
	 *
	 * @method size
	 * @memberOf Query
	 * @param {String} [path]
	 * @param {Number} val
	 * @api public
	 */
	public function size(?path:String, val:Dynamic) : Query;

	/**
	 * Specifies a $regex query condition.
	 *
	 * When called with one argument, the most recent path passed to `where()` is used.
	 *
	 * @method regex
	 * @memberOf Query
	 * @param {String} [path]
	 * @param {Number} val
	 * @api public
	 */
	public function regex(?path:String, val:Dynamic) : Query;

	/**
	 * Specifies a $maxDistance query condition.
	 *
	 * When called with one argument, the most recent path passed to `where()` is used.
	 *
	 * @method maxDistance
	 * @memberOf Query
	 * @param {String} [path]
	 * @param {Number} val
	 * @api public
	 */
	public function maxDistance(?path:String, val:Dynamic) : Query;

	/**
	 * Specifies a `$mod` condition
	 *
	 * @param {String} [path]
	 * @param {Number} val
	 * @return {Query} this
	 * @api public
	 */
	@:overload(function (?path:String, val:Array<Number>) : Query {})
	public function mod(?path:String, val:Number) : Query;

	/**
	 * Specifies an `$exists` condition
	 *
	 * ####Example
	 *
	 *     // { name: { $exists: true }}
	 *     Thing.where('name').exists()
	 *     Thing.where('name').exists(true)
	 *     Thing.find().exists('name')
	 *
	 *     // { name: { $exists: false }}
	 *     Thing.where('name').exists(false);
	 *     Thing.find().exists('name', false);
	 *
	 * @param {String} [path]
	 * @param {Number} val
	 * @return {Query} this
	 * @api public
	 */
	public function exists(?path:String, val:Bool) : Query;

	/**
	 * Specifies an `$elemMatch` condition
	 *
	 * ####Example
	 *
	 *     query.elemMatch('comment', { author: 'autobot', votes: {$gte: 5}})
	 *
	 *     query.where('comment').elemMatch({ author: 'autobot', votes: {$gte: 5}})
	 *
	 *     query.elemMatch('comment', function (elem) {
	 *       elem.where('author').equals('autobot');
	 *       elem.where('votes').gte(5);
	 *     })
	 *
	 *     query.where('comment').elemMatch(function (elem) {
	 *       elem.where({ author: 'autobot' });
	 *       elem.where('votes').gte(5);
	 *     })
	 *
	 * @param {String|Object|Function} path
	 * @param {Object|Function} criteria
	 * @return {Query} this
	 * @api public
	 */
	@:overload(function (path:Function, fn:Function) : Query {})
	@:overload(function (path:Function, criteria:{}) : Query {})
	@:overload(function (path:{}, fn:Function) : Query {})
	@:overload(function (path:{}, criteria:{}) : Query {})
	@:overload(function (path:String, fn:Function) : Query {})
	public function elemMatch(path:String, criteria:{}) : Query;	

	/**
	 * Sugar for geo-spatial queries.
	 *
	 * ####Example
	 *
	 *     query.within().box()
	 *     query.within().circle()
	 *     query.within().geometry()
	 *
	 *     query.where('loc').within({ center: [50,50], radius: 10, unique: true, spherical: true });
	 *     query.where('loc').within({ box: [[40.73, -73.9], [40.7, -73.988]] });
	 *     query.where('loc').within({ polygon: [[],[],[],[]] });
	 *
	 *     query.where('loc').within([], [], []) // polygon
	 *     query.where('loc').within([], []) // box
	 *     query.where('loc').within({ type: 'LineString', coordinates: [...] }); // geometry
	 *
	 * ####NOTE:
	 *
	 * Must be used after `where()`.
	 *
	 * @memberOf Query
	 * @return {Query} this
	 * @api public
	 */
	@:overload(function () : Query {})
	@:overload(function (area:Rest<Array<Number>>) : Query {})
	public function within(area:{}) : Query;

	/**
	 * Specifies a $box condition
	 *
	 * ####Example
	 *
	 *     var lowerLeft = [40.73083, -73.99756]
	 *     var upperRight= [40.741404,  -73.988135]
	 *
	 *     query.where('loc').within().box(lowerLeft, upperRight)
	 *     query.box('loc', lowerLeft, upperRight )
	 *
	 * @see http://www.mongodb.org/display/DOCS/Geospatial+Indexing
	 * @see Query#within #query_Query-within
	 * @param {String} path
	 * @param {Object} val
	 * @return {Query} this
	 * @api public
	 */
	@:overload(function (lowerLeft:Array<Number>, upperRight:Array<Number>) : Query {})
	public function box(path:String, lowerLeft:Array<Number>, upperRight:Array<Number>) : Query;

	/**
	 * Specifies a $polygon condition
	 *
	 * ####Example
	 *
	 *     query.where('loc').within().polygon([10,20], [13, 25], [7,15])
	 *     query.polygon('loc', [10,20], [13, 25], [7,15])
	 *
	 * @param {String|Array} [path]
	 * @param {Array|Object} [val]
	 * @return {Query} this
	 * @see http://www.mongodb.org/display/DOCS/Geospatial+Indexing
	 * @api public
	 */
	@:overload(function (val:Rest<Array<Number>>) : Query {})
	public function polygon(path:String, val:Rest<Array<Number>>) : Query;

	/**
	 * Specifies a $center or $centerSphere condition.
	 *
	 * ####Example
	 *
	 *     var area = { center: [50, 50], radius: 10, unique: true }
	 *     query.where('loc').within().circle(area)
	 *     query.center('loc', area);
	 *
	 *     // for spherical calculations
	 *     var area = { center: [50, 50], radius: 10, unique: true, spherical: true }
	 *     query.where('loc').within().circle(area)
	 *     query.center('loc', area);
	 *
	 * @param {String} [path]
	 * @param {Object} area
	 * @return {Query} this
	 * @see http://www.mongodb.org/display/DOCS/Geospatial+Indexing
	 * @api public
	 */
	@:overload(function (area:{}) : Query {}) 
	public function circle(path:String, area:{}) : Query;

	/**
	 * Specifies a `$near` or `$nearSphere` condition
	 *
	 * These operators return documents sorted by distance.
	 *
	 * ####Example
	 *
	 *     query.where('loc').near({ center: [10, 10] });
	 *     query.where('loc').near({ center: [10, 10], maxDistance: 5 });
	 *     query.where('loc').near({ center: [10, 10], maxDistance: 5, spherical: true });
	 *     query.near('loc', { center: [10, 10], maxDistance: 5 });
	 *     query.near({ center: { type: 'Point', coordinates: [..] }})
	 *     query.near().geometry({ type: 'Point', coordinates: [..] })
	 *
	 * @param {String} [path]
	 * @param {Object} val
	 * @return {Query} this
	 * @see http://www.mongodb.org/display/DOCS/Geospatial+Indexing
	 * @api public
	 */
	@:overload(function (val:{}) : Query {})
	public function near(path:String, val:{}) : Query;

	/**
	 * Declares an intersects query for `geometry()`.
	 *
	 * ####Example
	 *
	 *     query.where('path').intersects().geometry({
	 *         type: 'LineString'
	 *       , coordinates: [[180.0, 11.0], [180, 9.0]]
	 *     })
	 *
	 *     query.where('path').intersects({
	 *         type: 'LineString'
	 *       , coordinates: [[180.0, 11.0], [180, 9.0]]
	 *     })
	 *
	 * @param {Object} [arg]
	 * @return {Query} this
	 * @api public
	 */
	public function intersects(?arg:{}) : Query;

	/**
	 * Specifies a `$geometry` condition
	 *
	 * ####Example
	 *
	 *     var polyA = [[[ 10, 20 ], [ 10, 40 ], [ 30, 40 ], [ 30, 20 ]]]
	 *     query.where('loc').within().geometry({ type: 'Polygon', coordinates: polyA })
	 *
	 *     // or
	 *     var polyB = [[ 0, 0 ], [ 1, 1 ]]
	 *     query.where('loc').within().geometry({ type: 'LineString', coordinates: polyB })
	 *
	 *     // or
	 *     var polyC = [ 0, 0 ]
	 *     query.where('loc').within().geometry({ type: 'Point', coordinates: polyC })
	 *
	 *     // or
	 *     query.where('loc').intersects().geometry({ type: 'Point', coordinates: polyC })
	 *
	 * ####NOTE:
	 *
	 * `geometry()` **must** come after either `intersects()` or `within()`.
	 *
	 * The `object` argument must contain `type` and `coordinates` properties.
	 * - type {String}
	 * - coordinates {Array}
	 *
	 * The most recent path passed to `where()` is used.
	 *
	 * @param {Object} object Must contain a `type` property which is a String and a `coordinates` property which is an Array. See the examples.
	 * @return {Query} this
	 * @see http://docs.mongodb.org/manual/release-notes/2.4/#new-geospatial-indexes-with-geojson-and-improved-spherical-geometry
	 * @see http://www.mongodb.org/display/DOCS/Geospatial+Indexing
	 * @see $geometry http://docs.mongodb.org/manual/reference/operator/geometry/
	 * @api public
	 */
	public function geometry(geom:Geometry) : Query;

	/**
	 * Specifies which document fields to include or exclude
	 *
	 * ####String syntax
	 *
	 * When passing a string, prefixing a path with `-` will flag that path as excluded. When a path does not have the `-` prefix, it is included.
	 *
	 * ####Example
	 *
	 *     // include a and b, exclude c
	 *     query.select('a b -c');
	 *
	 *     // or you may use object notation, useful when
	 *     // you have keys already prefixed with a "-"
	 *     query.select({a: 1, b: 1, c: 0});
	 *
	 * ####Note
	 *
	 * Cannot be used with `distinct()`
	 *
	 * @param {Object|String} arg
	 * @return {Query} this
	 * @see SchemaType
	 * @api public
	 */
	@:overload(function (arg:String) : Query {})
	public function select(arg:{}) : Query;

	/**
	 * Specifies a $slice condition for a `path`
	 *
	 * ####Example
	 *
	 *     query.slice('comments', 5)
	 *     query.slice('comments', -5)
	 *     query.slice('comments', [10, 5])
	 *     query.where('comments').slice(5)
	 *     query.where('comments').slice([-10, 5])
	 *
	 * @param {String} [path]
	 * @param {Number} val number/range of elements to slice
	 * @return {Query} this
	 * @see mongodb http://www.mongodb.org/display/DOCS/Retrieving+a+Subset+of+Fields#RetrievingaSubsetofFields-RetrievingaSubrangeofArrayElements
	 * @api public
	 */
	@:overload(function (val:Int) : Query {})
	@:overload(function (val:Array<Int>) : Query {})
	@:overload(function (path:String, val:Array<Int>) : Query {})
	public function slice(path:String, val:Int) : Query;

	/**
	 * Sets the sort order
	 *
	 * If an object is passed, values allowed are 'asc', 'desc', 'ascending', 'descending', 1, and -1.
	 *
	 * If a string is passed, it must be a space delimited list of path names. The sort order of each path is ascending unless the path name is prefixed with `-` which will be treated as descending.
	 *
	 * ####Example
	 *
	 *     // these are equivalent
	 *     query.sort({ field: 'asc', test: -1 });
	 *     query.sort('field -test');
	 *
	 * ####Note
	 *
	 * Cannot be used with `distinct()`
	 *
	 * @param {Object|String} arg
	 * @return {Query} this
	 * @api public
	 */
	@:overload(function (arg:String) : Query {})
	public function sort(arg:{}) : Query;

	/**
	 * Specifies the limit option.
	 *
	 * ####Example
	 *
	 *     query.limit(20)
	 *
	 * ####Note
	 *
	 * Cannot be used with `distinct()`
	 *
	 * @method limit
	 * @memberOf Query
	 * @param {Number} val
	 * @see mongodb http://www.mongodb.org/display/DOCS/Advanced+Queries#AdvancedQueries-%7B%7Blimit%28%29%7D%7D
	 * @api public
	 */
	public function limit(val:Int) : Query;

	/**
	 * Specifies the skip option.
	 *
	 * ####Example
	 *
	 *     query.skip(100).limit(20)
	 *
	 * ####Note
	 *
	 * Cannot be used with `distinct()`
	 *
	 * @method skip
	 * @memberOf Query
	 * @param {Number} val
	 * @see mongodb http://www.mongodb.org/display/DOCS/Advanced+Queries#AdvancedQueries-%7B%7Bskip%28%29%7D%7D
	 * @api public
	 */
	public function skip(val:Int) : Query;

	/**
	 * Specifies the maxScan option.
	 *
	 * ####Example
	 *
	 *     query.maxScan(100)
	 *
	 * ####Note
	 *
	 * Cannot be used with `distinct()`
	 *
	 * @method maxScan
	 * @memberOf Query
	 * @param {Number} val
	 * @see mongodb http://www.mongodb.org/display/DOCS/Advanced+Queries#AdvancedQueries-%24maxScan
	 * @api public
	 */
	public function maxScan(val:Int) : Query;

	/**
	 * Specifies the batchSize option.
	 *
	 * ####Example
	 *
	 *     query.batchSize(100)
	 *
	 * ####Note
	 *
	 * Cannot be used with `distinct()`
	 *
	 * @method batchSize
	 * @memberOf Query
	 * @param {Number} val
	 * @see mongodb http://www.mongodb.org/display/DOCS/Advanced+Queries#AdvancedQueries-%7B%7BbatchSize%28%29%7D%7D
	 * @api public
	 */
	 public function batchSize(val:Int) : Query;

	/**
	 * Specifies the `comment` option.
	 *
	 * ####Example
	 *
	 *     query.comment('login query')
	 *
	 * ####Note
	 *
	 * Cannot be used with `distinct()`
	 *
	 * @method comment
	 * @memberOf Query
	 * @param {String} val
	 * @see mongodb http://www.mongodb.org/display/DOCS/Advanced+Queries#AdvancedQueries-%24comment
	 * @api public
	 */
	 public function comment(val:String) : Query;

	/**
	 * Specifies the maxTimeMS option.
	 *
	 * ####Example
	 *
	 *     query.maxTime(100)
	 *
	 * @method maxTime
	 * @memberOf Query
	 * @param {Number} val
	 * @see mongodb http://docs.mongodb.org/manual/reference/operator/meta/maxTimeMS/#op._S_maxTimeMS
	 * @api public
	 */
	public function maxTime(val:Number) : Query;

	/**
	 * Specifies this query as a `snapshot` query.
	 *
	 * ####Example
	 *
	 *     mquery().snapshot() // true
	 *     mquery().snapshot(true)
	 *     mquery().snapshot(false)
	 *
	 * ####Note
	 *
	 * Cannot be used with `distinct()`
	 *
	 * @see mongodb http://www.mongodb.org/display/DOCS/Advanced+Queries#AdvancedQueries-%7B%7Bsnapshot%28%29%7D%7D
	 * @return {Query} this
	 * @api public
	 */
	public function snapshot(?b:Bool) : Query;

	/**
	 * Sets query hints.
	 *
	 * ####Example
	 *
	 *     query.hint({ indexA: 1, indexB: -1})
	 *
	 * ####Note
	 *
	 * Cannot be used with `distinct()`
	 *
	 * @param {Object} val a hint object
	 * @return {Query} this
	 * @see mongodb http://www.mongodb.org/display/DOCS/Advanced+Queries#AdvancedQueries-%24hint
	 * @api public
	 */
	public function hint(val:{}) : Query;

	/**
	 * Determines the MongoDB nodes from which to read.
	 *
	 * ####Preferences:
	 *
	 *     primary - (default) Read from primary only. Operations will produce an error if primary is unavailable. Cannot be combined with tags.
	 *     secondary            Read from secondary if available, otherwise error.
	 *     primaryPreferred     Read from primary if available, otherwise a secondary.
	 *     secondaryPreferred   Read from a secondary if available, otherwise read from the primary.
	 *     nearest              All operations read from among the nearest candidates, but unlike other modes, this option will include both the primary and all secondaries in the random selection.
	 *
	 * Aliases
	 *
	 *     p   primary
	 *     pp  primaryPreferred
	 *     s   secondary
	 *     sp  secondaryPreferred
	 *     n   nearest
	 *
	 * ####Example:
	 *
	 *     new Query().read('primary')
	 *     new Query().read('p')  // same as primary
	 *
	 *     new Query().read('primaryPreferred')
	 *     new Query().read('pp') // same as primaryPreferred
	 *
	 *     new Query().read('secondary')
	 *     new Query().read('s')  // same as secondary
	 *
	 *     new Query().read('secondaryPreferred')
	 *     new Query().read('sp') // same as secondaryPreferred
	 *
	 *     new Query().read('nearest')
	 *     new Query().read('n')  // same as nearest
	 *
	 *     // read from secondaries with matching tags
	 *     new Query().read('s', [{ dc:'sf', s: 1 },{ dc:'ma', s: 2 }])
	 *
	 * Read more about how to use read preferrences [here](http://docs.mongodb.org/manual/applications/replication/#read-preference) and [here](http://mongodb.github.com/node-mongodb-native/driver-articles/anintroductionto1_1and2_2.html#read-preferences).
	 *
	 * @method read
	 * @memberOf Query
	 * @param {String} pref one of the listed preference options or aliases
	 * @param {Array} [tags] optional tags for this query
	 * @see mongodb http://docs.mongodb.org/manual/applications/replication/#read-preference
	 * @see driver http://mongodb.github.com/node-mongodb-native/driver-articles/anintroductionto1_1and2_2.html#read-preferences
	 * @return {Query} this
	 * @api public
	 */
	@:overload(function (pref:ReadPreference, ?tags:Array<String>) : Query {})
	public function read(pref:String, ?tags:Array<String>) : Query;

	/**
	 * Returns the current query conditions as a JSON object.
	 *
	 * ####Example:
	 *
	 *     var query = new Query();
	 *     query.find({ a: 1 }).where('b').gt(2);
	 *     query.getQuery(); // { a: 1, b: { $gt: 2 } }
	 *
	 * @return {Object} current query conditions
	 * @api public
	 */
	public function getQuery() : {};

	/**
	 * Returns the current update operations as a JSON object.
	 *
	 * ####Example:
	 *
	 *     var query = new Query();
	 *     query.update({}, { $set: { a: 5 } });
	 *     query.getUpdate(); // { $set: { a: 5 } }
	 *
	 * @return {Object} current update operations
	 * @api public
	 */
	public function getUpdate() : {};

	/**
	 * Sets the lean option.
	 *
	 * Documents returned from queries with the `lean` option enabled are plain javascript objects, not [MongooseDocuments](#document-js). They have no `save` method, getters/setters or other Mongoose magic applied.
	 *
	 * ####Example:
	 *
	 *     new Query().lean() // true
	 *     new Query().lean(true)
	 *     new Query().lean(false)
	 *
	 *     Model.find().lean().exec(function (err, docs) {
	 *       docs[0] instanceof mongoose.Document // false
	 *     });
	 *
	 * This is a [great](https://groups.google.com/forum/#!topic/mongoose-orm/u2_DzDydcnA/discussion) option in high-performance read-only scenarios, especially when combined with [stream](#query_Query-stream).
	 *
	 * @param {Boolean} bool defaults to true
	 * @return {Query} this
	 * @api public
	 */
	public function lean(?v:Bool) : Query;

	/**
	 * Sets the tailable option (for use with capped collections).
	 *
	 * ####Example
	 *
	 *     query.tailable() // true
	 *     query.tailable(true)
	 *     query.tailable(false)
	 *
	 * ####Note
	 *
	 * Cannot be used with `distinct()`
	 *
	 * @param {Boolean} bool defaults to true
	 * @see tailable http://docs.mongodb.org/manual/tutorial/create-tailable-cursor/
	 * @api public
	 */
	public function tailable(?b:Bool) : Query;

	/**
	 * Merges another Query or conditions object into this one.
	 *
	 * When a Query is passed, conditions, field selection and options are merged.
	 *
	 * @param {Query|Object} source
	 * @return {Query} this
	 */
	@:overload(function (source:{}) : Query {}) 
	public function merge(source:Query) : Query;

	/**
	 * Finds documents.
	 *
	 * When no `callback` is passed, the query is not executed. When the query is executed, the result will be an array of documents.
	 *
	 * ####Example
	 *
	 *     query.find({ name: 'Los Pollos Hermanos' }).find(callback)
	 *
	 * @param {Object} [criteria] mongodb selector
	 * @param {Function} [callback]
	 * @return {Query} this
	 * @api public
	 */
	@:overload(function (callback:Error->{}->Void) : Query {}) 
	@:overload(function (conditions:{}) : Query {}) 
	public function find(conditions:{}, callback:Error->{}->Void) : Query;

	/**
	 * Declares the query a findOne operation. When executed, the first found document is passed to the callback.
	 *
	 * Passing a `callback` executes the query. The result of the query is a single document.
	 *
	 * ####Example
	 *
	 *     var query  = Kitten.where({ color: 'white' });
	 *     query.findOne(function (err, kitten) {
	 *       if (err) return handleError(err);
	 *       if (kitten) {
	 *         // doc may be null if no document matched
	 *       }
	 *     });
	 *
	 * @param {Object|Query} [criteria] mongodb selector
	 * @param {Object} [projection] optional fields to return (http://bit.ly/1HotzBo)
	 * @param {Function} [callback]
	 * @return {Query} this
	 * @see findOne http://docs.mongodb.org/manual/reference/method/db.collection.findOne/
	 * @api public
	 */
	@:overload(function (callback:Error->{}->Void) : Query {}) 
	@:overload(function (options:{}, callback:Error->{}->Void) : Query {}) 
	@:overload(function (projection:{}, options:{}, callback:Error->{}->Void) : Query {}) 
	@:overload(function (conditions:Query, projection:{}, options:{}, callback:Error->{}->Void) : Query {}) 
	public function findOne(conditions:{}, projection:{}, options:{}, callback:Error->{}->Void) : Query;

	/**
	 * Specifying this query as a `count` query.
	 *
	 * Passing a `callback` executes the query.
	 *
	 * ####Example:
	 *
	 *     var countQuery = model.where({ 'color': 'black' }).count();
	 *
	 *     query.count({ color: 'black' }).count(callback)
	 *
	 *     query.count({ color: 'black' }, callback)
	 *
	 *     query.where('color', 'black').count(function (err, count) {
	 *       if (err) return handleError(err);
	 *       console.log('there are %d kittens', count);
	 *     })
	 *
	 * @param {Object} [criteria] mongodb selector
	 * @param {Function} [callback]
	 * @return {Query} this
	 * @see count http://docs.mongodb.org/manual/reference/method/db.collection.count/
	 * @api public
	 */
	@:overload(function () : Query {}) 
	@:overload(function (callback:Error->Int->Void) : Query {}) 
	@:overload(function (conditions:{}) : Query {}) 
	public function count(conditions:{}, callback:Error->Int->Void) : Query;

	/**
	 * Declares or executes a distict() operation.
	 *
	 * Passing a `callback` executes the query.
	 *
	 * ####Example
	 *
	 *     distinct(field, conditions, callback)
	 *     distinct(field, conditions)
	 *     distinct(field, callback)
	 *     distinct(field)
	 *     distinct(callback)
	 *     distinct()
	 *
	 * @param {String} [field]
	 * @param {Object|Query} [criteria]
	 * @param {Function} [callback]
	 * @return {Query} this
	 * @see distinct http://docs.mongodb.org/manual/reference/method/db.collection.distinct/
	 * @api public
	 */
	@:overload(function () : Query {})
	@:overload(function (field:String, conditions:Query, callback:Error->{}->Void) : Query {})
	@:overload(function (conditions:Query, callback:Error->{}->Void) : Query {})
	@:overload(function (conditions:{}, callback:Error->{}->Void) : Query {})
	@:overload(function (field:String, callback:Error->{}->Void) : Query {})
	@:overload(function (callback:Error->{}->Void) : Query {})
	public function distinct(field:String, conditions:{}, callback:Error->{}->Void) : Query;

	/**
	 * Declare and/or execute this query as an update() operation.
	 *
	 * _All paths passed that are not $atomic operations will become $set ops._
	 *
	 * ####Example
	 *
	 *     mquery({ _id: id }).update({ title: 'words' }, ...)
	 *
	 * becomes
	 *
	 *     collection.update({ _id: id }, { $set: { title: 'words' }}, ...)
	 *
	 * ####Note
	 *
	 * Passing an empty object `{}` as the doc will result in a no-op unless the `overwrite` option is passed. Without the `overwrite` option set, 
	 * the update operation will be ignored and the callback executed without sending the command to MongoDB so as to prevent accidently overwritting 
	 * documents in the collection.
	 *
	 * ####Note
	 *
	 * The operation is only executed when a callback is passed. To force execution without a callback (which would be an unsafe write), we must 
	 * first call update() and then execute it by using the `exec()` method.
	 *
	 *     var q = mquery(collection).where({ _id: id });
	 *     q.update({ $set: { name: 'bob' }}).update(); // not executed
	 *
	 *     var q = mquery(collection).where({ _id: id });
	 *     q.update({ $set: { name: 'bob' }}).exec(); // executed as unsafe
	 *
	 *     // keys that are not $atomic ops become $set.
	 *     // this executes the same command as the previous example.
	 *     q.update({ name: 'bob' }).where({ _id: id }).exec();
	 *
	 *     var q = mquery(collection).update(); // not executed
	 *
	 *     // overwriting with empty docs
	 *     var q.where({ _id: id }).setOptions({ overwrite: true })
	 *     q.update({ }, callback); // executes
	 *
	 *     // multi update with overwrite to empty doc
	 *     var q = mquery(collection).where({ _id: id });
	 *     q.setOptions({ multi: true, overwrite: true })
	 *     q.update({ });
	 *     q.update(callback); // executed
	 *
	 *     // multi updates
	 *     mquery()
	 *       .collection(coll)
	 *       .update({ name: /^match/ }, { $set: { arr: [] }}, { multi: true }, callback)
	 *     // more multi updates
	 *     mquery({ })
	 *       .collection(coll)
	 *       .setOptions({ multi: true })
	 *       .update({ $set: { arr: [] }}, callback)
	 *
	 *     // single update by default
	 *     mquery({ email: 'address@example.com' })
	 *      .collection(coll)
	 *      .update({ $inc: { counter: 1 }}, callback)
	 *
	 *     // summary
	 *     update(criteria, doc, opts, cb) // executes
	 *     update(criteria, doc, opts)
	 *     update(criteria, doc, cb) // executes
	 *     update(criteria, doc)
	 *     update(doc, cb) // executes
	 *     update(doc)
	 *     update(cb) // executes
	 *     update(true) // executes (unsafe write)
	 *     update()
	 *
	 * @param {Object} [criteria]
	 * @param {Object} [doc] the update command
	 * @param {Object} [options]
	 * @param {Function} [callback]
	 * @return {Query} this
	 * @api public
	 */
	@:overload(function () : Query {})
	@:overload(function (b:Bool) : Query {})
	@:overload(function (callback:Error->{}->Void) : Query {})
	@:overload(function (doc:{}) : Query {})
	@:overload(function (doc:{}, callback:Error->{}->Void) : Query {})
	@:overload(function (criteria:{}, doc:{}) : Query {})
	@:overload(function (criteria:{}, doc:{}, callback:Error->{}->Void) : Query {})
	@:overload(function (criteria:{}, doc:{}, options:{}) : Query {})
	public function update(criteria:{}, doc:{}, options:{}, callback:Error->{}->Void) : Query;

	/**
	 * Declare and/or execute this query as a remove() operation.
	 *
	 * ####Example
	 *
	 *     mquery(collection).remove({ artist: 'Anne Murray' }, callback)
	 *
	 * ####Note
	 *
	 * The operation is only executed when a callback is passed. To force execution without a callback (which would be an unsafe write), 
	 * we must first call remove() and then execute it by using the `exec()` method.
	 *
	 *     // not executed
	 *     var query = mquery(collection).remove({ name: 'Anne Murray' })
	 *
	 *     // executed
	 *     mquery(collection).remove({ name: 'Anne Murray' }, callback)
	 *     mquery(collection).remove({ name: 'Anne Murray' }).remove(callback)
	 *
	 *     // executed without a callback (unsafe write)
	 *     query.exec()
	 *
	 *     // summary
	 *     query.remove(conds, fn); // executes
	 *     query.remove(conds)
	 *     query.remove(fn) // executes
	 *     query.remove()
	 *
	 * @param {Object|Query} [criteria] mongodb selector
	 * @param {Function} [callback]
	 * @return {Query} this
	 * @api public
	 */
	@:overload(function () : Query {}) 
	@:overload(function (cond:{}) : Query {}) 
	@:overload(function (cond:Query) : Query {}) 
	@:overload(function (callback:Error->{}->Void) : Query {}) 
	@:overload(function (cond:Query, callback:Error->{}->Void) : Query {}) 
	public function remove(cond:{}, callback:Error->{}->Void) : Query;

	/**
	 * Issues a mongodb [findAndModify](http://www.mongodb.org/display/DOCS/findAndModify+Command) update command.
	 *
	 * Finds a matching document, updates it according to the `update` arg, passing any `options`, and returns the 
	 * found document (if any) to the callback. The query executes immediately if `callback` is passed.
	 *
	 * ####Available options
	 *
	 * - `new`: bool - true to return the modified document rather than the original. defaults to true
	 * - `upsert`: bool - creates the object if it doesn't exist. defaults to false.
	 * - `sort`: if multiple docs are found by the conditions, sets the sort order to choose which doc to update
	 *
	 * ####Examples
	 *
	 *     query.findOneAndUpdate(conditions, update, options, callback) // executes
	 *     query.findOneAndUpdate(conditions, update, options)  // returns Query
	 *     query.findOneAndUpdate(conditions, update, callback) // executes
	 *     query.findOneAndUpdate(conditions, update)           // returns Query
	 *     query.findOneAndUpdate(update, callback)             // returns Query
	 *     query.findOneAndUpdate(update)                       // returns Query
	 *     query.findOneAndUpdate(callback)                     // executes
	 *     query.findOneAndUpdate()                             // returns Query
	 *
	 * @param {Object|Query} [query]
	 * @param {Object} [doc]
	 * @param {Object} [options]
	 * @param {Function} [callback]
	 * @see mongodb http://www.mongodb.org/display/DOCS/findAndModify+Command
	 * @return {Query} this
	 * @api public
	 */
	@:overload(function () : Query {})
	@:overload(function (b:Bool) : Query {})
	@:overload(function (callback:Error->{}->Void) : Query {})
	@:overload(function (doc:{}) : Query {})
	@:overload(function (doc:{}, callback:Error->{}->Void) : Query {})
	@:overload(function (criteria:Query, doc:{}) : Query {})
	@:overload(function (criteria:Query, doc:{}, callback:Error->{}->Void) : Query {})
	@:overload(function (criteria:Query, doc:{}, options:{}) : Query {})
	@:overload(function (criteria:{}, doc:{}) : Query {})
	@:overload(function (criteria:{}, doc:{}, callback:Error->{}->Void) : Query {})
	@:overload(function (criteria:{}, doc:{}, options:{}) : Query {})
	public function findOneAndUpdate(criteria:{}, doc:{}, options:{}, callback:Error->{}->Void) : Query;

	/**
	 * Issues a mongodb [findAndModify](http://www.mongodb.org/display/DOCS/findAndModify+Command) remove command.
	 *
	 * Finds a matching document, removes it, passing the found document (if any) to the callback. 
	 * Executes immediately if `callback` is passed.
	 *
	 * ####Available options
	 *
	 * - `sort`: if multiple docs are found by the conditions, sets the sort order to choose which doc to update
	 *
	 * ####Examples
	 *
	 *     A.where().findOneAndRemove(conditions, options, callback) // executes
	 *     A.where().findOneAndRemove(conditions, options)  // return Query
	 *     A.where().findOneAndRemove(conditions, callback) // executes
	 *     A.where().findOneAndRemove(conditions) // returns Query
	 *     A.where().findOneAndRemove(callback)   // executes
	 *     A.where().findOneAndRemove()           // returns Query
	 *
	 * @param {Object} [conditions]
	 * @param {Object} [options]
	 * @param {Function} [callback]
	 * @return {Query} this
	 * @see mongodb http://www.mongodb.org/display/DOCS/findAndModify+Command
	 * @api public
	 */
	@:overload(function () : Query {}) 
	@:overload(function (callback:Error->{}->Void) : Query {}) 
	@:overload(function (conditions:{}) : Query {}) 
	@:overload(function (conditions:{}, callback:Error->{}->Void) : Query {}) 
	@:overload(function (conditions:{}, options:{}) : Query {}) 
	public function findOneAndRemove(conditions:{}, options:{}, callback:Error->{}->Void) : Query;

	/**
	 * Add trace function that gets called when the query is executed.
	 * The function will be called with (method, queryInfo, query) and
	 * should return a callback function which will be called
	 * with (err, result, millis) when the query is complete.
	 *
	 * queryInfo is an object containing: {
	 *   collectionName: <name of the collection>,
	 *   conditions: <query criteria>,
	 *   options: <comment, fields, readPreference, etc>,
	 *   doc: [document to update, if applicable]
	 * }
	 *
	 * NOTE: Does not trace stream queries.
	 *
	 * @param {Function} traceFunction
	 * @return {Query} this
	 * @api public
	 */
	public function setTraceFunction(traceFunction:TraceFunc) : Query;

	/**
	 * Executes the query
	 *
	 * ####Examples:
	 *
	 *     var promise = query.exec();
	 *     var promise = query.exec('update');
	 *
	 *     query.exec(callback);
	 *     query.exec('find', callback);
	 *
	 * @param {String|Function} [operation]
	 * @param {Function} [callback]
	 * @return {Promise}
	 * @api public
	 */
	@:overload(function (callback:Error->{}->Void) : Promise {})
	@:overload(function (op:String) : Promise {})
	@:overload(function (op:Function) : Promise {})
	@:overload(function (op:Function, callback:Error->{}->Void) : Promise {})
	public function exec(op:String, callback:Error->{}->Void) : Promise;

	/**
	 * Executes the query returning a `Promise` which will be
	 * resolved with either the doc(s) or rejected with the error.
	 *
	 * @param {Function} [resolve]
	 * @param {Function} [reject]
	 * @return {Promise}
	 * @api public
	 */
	public function then(resolve:Rest<Dynamic>->Void, reject:Reason->Void) : Promise;

	/**
	 * Returns a stream for the given find query.
	 *
	 * @throws Error if operation is not a find
	 * @returns {Stream} Node 0.8 style
	 */
	public function stream(?streamOptions:{}) : IReadable;

	/**
	 * Specifies paths which should be populated with other documents.
	 *
	 * ####Example:
	 *
	 *     Kitten.findOne().populate('owner').exec(function (err, kitten) {
	 *       console.log(kitten.owner.name) // Max
	 *     })
	 *
	 *     Kitten.find().populate({
	 *         path: 'owner'
	 *       , select: 'name'
	 *       , match: { color: 'black' }
	 *       , options: { sort: { name: -1 }}
	 *     }).exec(function (err, kittens) {
	 *       console.log(kittens[0].owner.name) // Zoopa
	 *     })
	 *
	 *     // alternatively
	 *     Kitten.find().populate('owner', 'name', null, {sort: { name: -1 }}).exec(function (err, kittens) {
	 *       console.log(kittens[0].owner.name) // Zoopa
	 *     })
	 *
	 * Paths are populated after the query executes and a response is received. A separate query is then executed for each path specified for population. After a response for each query has also been returned, the results are passed to the callback.
	 *
	 * @param {Object|String} path either the path to populate or an object specifying all parameters
	 * @param {Object|String} [select] Field selection for the population query
	 * @param {Model} [model] The name of the model you wish to use for population. If not specified, the name is looked up from the Schema ref.
	 * @param {Object} [match] Conditions for the population query
	 * @param {Object} [options] Options for the population query (sort, etc)
	 * @see population ./populate.html
	 * @see Query#select #query_Query-select
	 * @see Model.populate #model_Model.populate
	 * @return {Query} this
	 * @api public
	 */
	@:overload(function (params:{}) : Query {})
	@:overload(function (path:String, options:{}) : Query {})
	@:overload(function (path:String, match:{}, options:{}) : Query {})
	@:overload(function (path:String, model:Model, match:{}, options:{}) : Query {})
	@:overload(function (path:String, select:String, model:Model, match:{}, options:{}) : Query {})
	public function populate(path:String, select:String, model:Model, match:{}, options:{}) : Query;

	/**
	 * Casts this query to the schema of `model`
	 *
	 * ####Note
	 *
	 * If `obj` is present, it is cast instead of this query.
	 *
	 * @param {Model} model
	 * @param {Object} [obj]
	 * @return {Object}
	 * @api public
	 */
	public inline function cast_(model:Model, ?obj:{}) : {}
	{
		return untyped this['cast'](model, obj);
	}

} // End of Query class