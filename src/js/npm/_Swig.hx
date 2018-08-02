package js.npm;

import haxe.extern.EitherType;

// http://node-swig.github.io/swig-templates/docs/api/#SwigOpts
typedef SwigOpts = {
	?autoescape : Bool, //	boolean	Controls whether or not variable output will automatically be escaped for safe HTML output. Defaults to true. Functions executed in variable statements will not be auto-escaped. Your application/functions should take care of their own auto-escaping.
	?varControls : Array<String>, //	array	Open and close controls for variables. Defaults to ['{{', '}}'].
	?tagControls : Array<String>, //	array	Open and close controls for tags. Defaults to ['{%', '%}'].
	?cmtControls : Array<String>, //	array	Open and close controls for comments. Defaults to ['{#', '#}'].
	?locals	: {}, //object	Default variable context to be passed to all templates.
	?cache : EitherType<Bool,String>, // CacheOptions, //	Cache control for templates. Defaults to saving in 'memory'. Send false to disable. Send an object with get and set functions to customize.
	?loader : TemplateLoader //	The method that Swig will use to load templates. Defaults to swig.loaders.fs.
}

// http://node-swig.github.io/swig-templates/docs/api/#CacheOptions
typedef CacheOptions = {
	?cache : EitherType<Bool,String>
}

// http://node-swig.github.io/swig-templates/docs/api/#TemplateLoader
typedef TemplateLoader = {
	// TODO
}

typedef CompiledSwig = ?{} -> String;

/**
 * @url https://github.com/node-swig/swig-templates
 * v2.0.2
 */
extern class Swig {

	// http://node-swig.github.io/swig-templates/docs/api/#version
	public static var version : String;

	// http://node-swig.github.io/swig-templates/docs/api/#setDefaults
	public static function setDefaults(options : SwigOpts) : Void;

	// http://node-swig.github.io/swig-templates/docs/api/#setDefaultTZOffset
	public static function setDefaultTZOffset( offset : Int) : Void;

	// http://node-swig.github.io/swig-templates/docs/api/#Swig
	// TODO : not sure if this will work
	public static function swig( opts : SwigOpts ) : Void;

	// http://node-swig.github.io/swig-templates/docs/api/#invalidateCache
	public static function invalidateCache(): Void;

	// http://node-swig.github.io/swig-templates/docs/api/#setFilter
	public static function setFilter( name :String , method : haxe.Constraints.Function ) : Void;

	// http://node-swig.github.io/swig-templates/docs/api/#setTag
	public static function setTag( name : String , parse : haxe.Constraints.Function , compile : haxe.Constraints.Function , ?ends : Bool , ?blockLevel : Bool ) : Void;

	// http://node-swig.github.io/swig-templates/docs/api/#setExtension
	public static function setExtension( name : String , object : Dynamic ) : Void;

	// http://node-swig.github.io/swig-templates/docs/api/#precompile
	@:overload(function(source : String) : String {})
	public static function precompile( source : String , options : SwigOpts ) : Void;

	// http://node-swig.github.io/swig-templates/docs/api/#render
	@:overload(function(source : String) : String {})
	public static function render(source : String, options : SwigOpts ) : String;

	// http://node-swig.github.io/swig-templates/docs/api/#renderFile
	@:overload(function(pathName : String) : String {})
	public static function renderFile(pathName : String, locals : {}, ?cb : haxe.Constraints.Function) : String;

	// http://node-swig.github.io/swig-templates/docs/api/#compile
	@:overload(function(source : String) : CompiledSwig {})
	public static function compile(source : String, options : SwigOpts) : CompiledSwig;

	// http://node-swig.github.io/swig-templates/docs/api/#compileFile
	@:overload(function(pathName : String) : CompiledSwig {})
	@:overload(function(pathName : String , options : SwigOpts) : CompiledSwig {})
	public static function compileFile(pathName : String, options : SwigOpts , cb : haxe.Constraints.Function) : CompiledSwig;

	// http://node-swig.github.io/swig-templates/docs/api/#run
	@:overload(function(tpl : String) : String {})
	@:overload(function(tpl : String, locals : {}) : String {})
	public static function run( tpl : String , locals : {} , filepath : String ) : String;

}