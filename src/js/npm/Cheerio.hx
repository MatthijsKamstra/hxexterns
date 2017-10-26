package js.npm;

typedef CheerioQuery = Dynamic -> ?Dynamic -> ?String -> Cheerio;

@:jsRequire("cheerio")
extern class Cheerio
{
	public static function load(html : String, ?options : {}) : CheerioQuery;
	
	public static inline function cheerio() : CheerioQuery {
		return untyped __js__('require("cheerio")');
	}

	public var length(default, null) : Int;

	@:overload(function(text : String) : Cheerio {})
	public function text() : String;

	@:overload(function(html : String) : Cheerio {})
	public function html() : String;

	public function empty() : Cheerio;

	@:overload(function(name : String) : String {})
	public function attr(name : String, value : String) : Cheerio;

	@:overload(function() : Dynamic {})
	@:overload(function(name : String) : String {})
	public function data(name : String, value : String) : Cheerio;

	@:overload(function() : String {})
	public function val(value : String) : Cheerio;

	public function removeAttr(name : String) : Cheerio;
	public function hasClass(className : String) : Bool;

	@:overload(function(func : Int -> String -> String) : Cheerio {})
	public function addClass(className : String) : Cheerio;

	@:overload(function(func : Int -> String -> String) : Cheerio {})
	public function removeClass(className : String) : Cheerio;

	@:overload(function(className : String, state : Bool) : Cheerio {})
	@:overload(function(func : Int -> String -> String, state : Bool) : Cheerio {})
	@:overload(function(func : Int -> String -> String) : Cheerio {})
	public function toggleClass(className : String) : Cheerio;

	public function is(selector : String) : Bool;

	public function serializeArray() : Array<{name: String, value: String}>;

	public function find(selector : String) : Cheerio;

	@:overload(function(selector : String) : Cheerio {})
	public function parent() : Cheerio;

	@:overload(function(selector : String) : Cheerio {})
	public function parents() : Cheerio;

	@:overload(function(selector : String, filter : String) : Cheerio {})
	@:overload(function(selector : String) : Cheerio {})
	public function parentsUntil() : Cheerio;

	public function closest(selector : String) : Cheerio;

	@:overload(function(selector : String) : Cheerio {})
	public function next() : Cheerio;

	@:overload(function(selector : String) : Cheerio {})
	public function nextAll() : Cheerio;

	@:overload(function(selector : String, filter : String) : Cheerio {})
	@:overload(function(selector : String) : Cheerio {})
	public function nextUntil() : Cheerio;

	@:overload(function(selector : String) : Cheerio {})
	public function prev() : Cheerio;

	@:overload(function(selector : String) : Cheerio {})
	public function prevAll() : Cheerio;

	@:overload(function(selector : String, filter : String) : Cheerio {})
	@:overload(function(selector : String) : Cheerio {})
	public function prevUntil() : Cheerio;

	@:overload(function(start : Int, end : Int) : Cheerio {})
	public function slice(start : Int) : Cheerio;

	public function siblings(selector : String) : Cheerio;
	public function children(selector : String) : Cheerio;
	public function contents() : Cheerio;
	
	@:overload(function(func : Int -> Cheerio -> Void) : Cheerio {})
	public function each(func : Int -> Cheerio -> Bool) : Cheerio;

	@:overload(function(func : Int -> Bool) : Cheerio {})
	public function map<T, T2>(func : Int -> T -> T2) : Cheerio;
	
	@:overload(function(selector : String) : Cheerio {})
	@:overload(function(func : Int -> Bool) : Cheerio {})
	public function filter(func : Int -> Cheerio -> Bool) : Cheerio;

	@:overload(function(selector : String) : Cheerio {})
	@:overload(function(func : Int -> Bool) : Cheerio {})
	public function not(func : Int -> Cheerio -> Bool) : Cheerio;

	public function has(selector : String) : Cheerio;

	public function first() : Cheerio;
	public function last() : Cheerio;
	public function eq(i : Int) : Cheerio;

	@:overload(function<T>() : Array<T> {})
	public function get<T>(i : Int) : T;

	@:overload(function() : Int {})
	public function index(selector : String) : Int;

	public function end() : Cheerio;

	public function add(selector : String) : Cheerio;

	public function addBack(selector : String) : Cheerio;
}