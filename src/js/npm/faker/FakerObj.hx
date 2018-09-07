package;

/**
 * Generated with HxJsonDef (version 0.0.8) on Thu Aug 30 2018 10:44:05 GMT+0200 (Central European Summer Time)
 * from : http://matthijskamstra.github.io/hxjsondef/
 *
 * AST = Abstract Syntax Tree
 *
 * Note:
 * If you provide a .json there should be no null values
 * comments in this document show you the values that need to be changed!
 *
 * Some (backend)-developers choose to hide empty/null values, you can add them:
 * 		@:optional var _id : Int;
 *
 */

typedef Card =
{
	var name : String;
	var username : String;
	var email : String;
	var address : Address;
	var phone : String;
	var website : String;
	var company : Company;
	var posts : Array<Posts>;
	var accountHistory : Array<AccountHistory>;
};

typedef Address =
{
	var streetA : String;
	var streetB : String;
	var streetC : String;
	var streetD : String;
	var city : String;
	var state : String;
	var country : String;
	var zipcode : String;
	var geo : Geo;
};

typedef Geo =
{
	var lat : String;
	var lng : String;
};

typedef Company =
{
	var name : String;
	var catchPhrase : String;
	var bs : String;
};

typedef Posts =
{
	var words : String;
	var sentence : String;
	var sentences : String;
	var paragraph : String;
};

typedef AccountHistory =
{
	var amount : String;
	var date : String;
	var business : String;
	var name : String;
	var type : String;
	var account : String;
};
