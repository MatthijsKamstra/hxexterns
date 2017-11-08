package js.npm;

import haxe.extern.EitherType;
import haxe.Constraints.Function;

typedef Configure = {
    @:optional var endpointUrl: String;
    var apiKey:String;
};

typedef Select = {
    @:optional var fields : Array<String>; // "Grid view"
    @:optional var filterByFormula : String; // "Grid view"
    @:optional var maxRecords : Int; // The maximum total number of records that will be returned.
    @:optional var pageSize : Int; // The number of records returned in each request. Must be less than or equal to 100. Default is 100.
    @:optional var sort : Array<Dynamic>; // "Grid view"
    @:optional var view : String; // "Grid view"
};



typedef Record = {
	var id : String; // "recOdPbN6fHWp6snV",
	var createdTime : String; // "2017-11-06T20:30:34.000Z"
	var fields: Dynamic;
	function get(str:String):String;
	function getId():String;
	var _rawJson:Dynamic;
};

typedef AirtableError = {
  var error: String; // 'UNKNOWN_FIELD_NAME',
  var message: String; //'Unknown field name: "slackid"',
  var statusCode: Int; // 422
};

@:native('Airtable')
@:jsRequire("airtable")
extern class Airtable {

	function new(config:Configure);
	function base(key:String):AirtableBase;

	// whatever
	static function configure(config:Configure):Void;
	static function base(key:String):AirtableBase;

}

extern class AirtableBase {

  @:selfCall function new(key:String); // not sure this does the trick
  @:selfCall function construct(key:String) : AirtableBase;

  function update(id:String, obj:Dynamic, cb:AirtableError -> Record -> Void):AirtableBase;
  function replace(id:String, obj:Dynamic, cb:AirtableError -> Record -> Void):AirtableBase;
  function find(id:String, cb:AirtableError -> Record -> Void):AirtableBase;
  function destroy(id:String, cb:AirtableError -> Record -> Void):AirtableBase;

  function create(obj:Dynamic, cb:AirtableError -> Dynamic -> Void):AirtableBase;

  function select(select:Select):AirtableBase;
  function eachPage(page: Array<Record> -> Function -> Void,done:String -> Void):AirtableBase;
}

