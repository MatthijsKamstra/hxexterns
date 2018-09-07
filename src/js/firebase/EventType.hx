package js.firebase;
/**
 * Haxe externs for Firebase v5.4.2
 * Project: https://firebase.google.com/docs/?authuser=0
 * Definitions by: 	Aksel <https://github.com/jefvel>
 * 					Matthijs Kamstra aka [mck] <https://github.com/MatthijsKamstra>
 * Definitions: <https://github.com/jefvel/haxe-firebase>
 *    			<https://github.com/MatthijsKamstra/hxexterns>
 */

@:enum
abstract EventType(String) {
	var Value = "value";
	var ChildAdded = "child_added";
	var ChildChanged = "child_changed";
	var ChildRemoved = "child_removed";
	var ChildMoved = "child_moved";
}
