package js.node.mongoose;

import haxe.extern.EitherType;
import haxe.extern.Rest;

typedef Reason = EitherType<String,EitherType<Error,{}>>;

@:jsRequire("mongoose", "Promise")
extern class Promise
{
	public static var SUCCESS(default,null) : String;
	public static var FAILURE(default,null) : String;

	/**
	 * Adds `listener` to the `event`.
	 *
	 * If `event` is either the success or failure event and the event has already been emitted, the`listener` is called immediately and passed the results of the original emitted event.
	 *
	 * @see mpromise#on https://github.com/aheckmann/mpromise#on
	 * @method on
	 * @memberOf Promise
	 * @param {String} event
	 * @param {Function} listener
	 * @return {Promise} this
	 * @api public
	 */
	 public function on(event:String, listener:Error->Rest<Dynamic>->Void) : Promise;

	/**
	 * Adds a listener to the SUCCESS event.
	 *
	 * @return {Promise} this
	 * @api public
	 */
	public function onFulfill(fn:Rest<Dynamic>->Void) : Promise;

	/**
	 * Adds a listener to the FAILURE event.
	 *
	 * @return {Promise} this
	 * @api public
	 */
	public function onReject(fn:Reason->Void) : Promise;

	/**
	 * Adds a single function as a listener to both SUCCESS and FAILURE.
	 *
	 * It will be executed with traditional node.js argument position:
	 * function (err, args...) {}
	 *
	 * Also marks the promise as `end`ed, since it's the common use-case, and yet has no
	 * side effects unless `fn` is undefined or null.
	 *
	 * @param {Function} fn
	 * @return {Promise} this
	 */
	public function onResolve(fn:Error->Rest<Dynamic>->Void) : Promise;

	/**
	 * Creates a new promise and returns it. If `onFulfill` or
	 * `onReject` are passed, they are added as SUCCESS/ERROR callbacks
	 * to this promise after the next tick.
	 *
	 * Conforms to [promises/A+](https://github.com/promises-aplus/promises-spec) specification. Read for more detail how to use this method.
	 *
	 * ####Example:
	 *
	 *     var p = new Promise;
	 *     p.then(function (arg) {
	 *       return arg + 1;
	 *     }).then(function (arg) {
	 *       throw new Error(arg + ' is an error!');
	 *     }).then(null, function (err) {
	 *       assert.ok(err instanceof Error);
	 *       assert.equal('2 is an error', err.message);
	 *     });
	 *     p.complete(1);
	 *
	 * @see promises-A+ https://github.com/promises-aplus/promises-spec
	 * @param {Function} onFulfill
	 * @param {Function} [onReject]
	 * @return {Promise} newPromise
	 */
	public function then(onFulfill:Rest<Dynamic>->Void, onReject:Reason->Void) : Promise;

} // End of Promise class