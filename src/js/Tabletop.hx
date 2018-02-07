package js;

import haxe.extern.EitherType;

typedef TabletopObj = {

	var key : String; // 'https://docs.google.com/spreadsheets/d/0AmYzu_s7QHsmdDNZUzRlYldnWTZCLXdrMXlYQzVxSFE/pubhtml',


	@:optional var callback : Dynamic; 		// function(data, tabletop) {
	@:optional var postProcess : Dynamic;
	@:optional var callbackContext : Dynamic;
	// @:optional var parameterize : Dynamic;

	@:optional var simpleSheet : Bool;
	@:optional var parseNumbers : Bool;
	@:optional var reverse : Bool;
	@:optional var singleton : Bool; // Defaults to false.
	@:optional var simple_url : Bool; // Defaults to false.
	@:optional var prettyColumnNames : Bool; // Defaults to true.

	@:optional var orderby : String;
	@:optional var wanted : String; // Defaults to all.
	@:optional var endpoint : String;
	@:optional var authkey : String;

	// @:optional var debug : String;
	// @:optional var wait : String;

	/**
	 *  callback:String -> Null<Dynamic> -> Void
	 *
	 *
	 */

}

@:native('Tabletop')
extern class Tabletop {
	public function new() {



	}

	public static function init(tabletopObj:TabletopObj):Void {
	};


}