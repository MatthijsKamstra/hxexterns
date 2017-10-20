package api.typeform;


/**
 * Generated with HxJsonDef (version 0.0.3) on Tue Nov 15 2016 23:50:22 GMT+0100 (CET)
 * from : http://matthijskamstra.github.io/hxjsondef/
 * 
 * AST = Abstract Syntax Tree
 * 
 * Note:
 * If you profide a .json there should be no null values
 * comments in this document show you the values that need to be changed!
 * 
 * Some (backend)-developers choose to hide empty/null values, you can add them:
 * 		@optional var _id : Int;
 * 
 * Name(s) that you possibly need to change:
 * 		TypeFormObj
 * 		Stats
 * 		Responses
 * 		Questions
 * 		Metadata
 * 		Answers
 */

typedef TypeFormObj =
{
	var http_status : Int;
	var stats : Stats;
	var questions : Array<Questions>;
	var responses : Array<Responses>;
};

typedef Stats =
{
	var responses : StatsResponses;
};

typedef StatsResponses =
{
	var showing : Int; //": 3,
	var total : Int; //": 3,
	var completed : Int; //": 2
};

typedef Responses =
{
	var completed : String;
	var token : String;
	var metadata : Metadata;
	var hidden : Array<Hidden>; 
	var answers : Dynamic;
	// var answers : Array<Answers>;
};

typedef Questions =
{
	var id : String;
	var question : String;
	var field_id : Int;
};

typedef Metadata =
{
	var browser : String;
	var platform : String;
	var date_land : String;
	var date_submit : String;
	var user_agent : String;
	var referer : String;
	var network_id : String;
};

typedef Hidden =
{
};

typedef Answers =
{
	// "textfield_36546110": "foo bar",
	// "email_36546117": "matthijs@fonkmobile.nl",
	// "textfield_36546112": "Gonk",
	// "textarea_36546118": "5, 4, 6, 2, 1, 3, 8, 7",
	// "yesno_36547080": "1"
};
