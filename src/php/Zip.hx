
package externs.zip;

extern class Zip 
{
	static function __init__():Void untyped {
        __call__("require_once", "ziparchive.class.php");
    }

	/*
	A4 @ 200 dpi - 2338 x 1653 pix
	A4 @ 150 dpi - 1753 x 1240 pix
	*/
	// $w 			= 1240;
	// $h 			= 1753;
	public function new();

	/* 
	* screenname   	name of the zip / and name of the person
	* guid 			guid for the zip name
	* zippath 		path where the file should be saved
	* templatepath 	path to the file that needs to be embed
	* templatename 	name of the new file
	*/
	public function init(screenname:String, guid:String, zippath:String, templatepath:String, templatename:String):Void;
	

}