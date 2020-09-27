package js;

import haxe.extern.EitherType;
import haxe.Constraints.Function;

typedef TabletopObj = {
	var key:String; // 'https://docs.google.com/spreadsheets/d/0AmYzu_s7QHsmdDNZUzRlYldnWTZCLXdrMXlYQzVxSFE/pubhtml',

	@:optional var callback:String->Dynamic->Void; // function(data, tabletop) {
	@:optional var postProcess:Dynamic;
	@:optional var callbackContext:Dynamic;
	// @:optional var parameterize : Dynamic;
	@:optional var simpleSheet:Bool;
	@:optional var parseNumbers:Bool;
	@:optional var reverse:Bool;
	@:optional var singleton:Bool; // Defaults to false.
	@:optional var simple_url:Bool; // Defaults to false.
	@:optional var prettyColumnNames:Bool; // Defaults to true.
	@:optional var orderby:String;
	@:optional var wanted:String; // Defaults to all.
	@:optional var endpoint:String;
	@:optional var authkey:String;
	// @:optional var debug : String;
	// @:optional var wait : String;
	/**
	 *  callback:String -> Null<Dynamic> -> Void
	 *
	 *
	 */
}

typedef TabletopModelObj = {
	var columnNames:Array<String>;
	var column_names:Array<String>;
	var elements:Array<Dynamic>;
	var name:String;
	var onReady:Function;
	var originalColumns:Array<String>;
	var original_columns:Array<String>;
	var prettyColumns:Dynamic;
	var pretty_columns:Dynamic;
	var raw:Dynamic;
}

/**
 * name: tabletop
 * version: 1.5.3
 * description: Tabletop.js takes a Google Spreadsheet and makes it easily accessible through JavaScript. With zero dependencies!
 *
 * url: https://github.com/jsoma/tabletop
 */
@:native('Tabletop')
extern class Tabletop {
	// public function new() {}
	public static function init(tabletopObj:TabletopObj):Void;
	// public function sheets(name:String) : TabletopModelObj;
	// public function modelNames():Void;
	// public function foundSheetNames():Void;
	// public function data():Void;
	// public function fetch():Void;
	// public function addWanted(name):Void;
}

// class TabletopModel {
// }
