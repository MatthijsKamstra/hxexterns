package codemirror;

//CodeMirror.hx from "try-haxe"
//https://github.com/clemos/try-haxe/blob/master/src/js/codemirror/CodeMirror.hx
//With few additional functions
//==========

import js.html.DivElement;
import js.html.Element;

typedef Completions = {
	list : Array<String>,
	from : Pos,
	to : Pos,
}

typedef Pos = {
	line : Int,
	ch : Int
}

typedef MarkedText = {
	clear : Void->Void,
	find : Void->Pos
}

typedef LineHandle = {};

typedef ChangeEvent = {
	origin : String,
	from : Pos,
	to : Pos,
	text : Array<String>,
	removed : Array<String>,
	?next : ChangeEvent
}

typedef TokenData = {
	start: Int,
	end: Int,
	string: String,
	type: String,
	state: Dynamic
}

typedef LineWidgetOptions = {
	coverGutter: Bool,
	noHScroll: Bool
}

typedef DocHistory = {
	var generation:Int;
}

@:native('CodeMirror.TextMarker') extern class TextMarker
{
	function find():{from:Pos, to:Pos};

	var atomic: Bool;
	var clearOnEnter: Bool;
	var collapsed: Bool;
	var doc: CodeMirror.Doc;
	var id:Int;
	var lines: Array<LineHandle>;
	var type: String;
	var widgetNode: Dynamic;
}

@:native('CodeMirror.Doc') extern class Doc
{
	public function new(body: Dynamic, mode: String, ?firstLineNumber:Int);
	function getValue():String;
	/**
	 *  Return true if any text is selected.
	 *  @return Bool
	 */
	function somethingSelected():Bool;
	function setValue(value:String):Void;
	/**
	 *  Get the currently selected code.
	 *  @param lineSep -
	 *  @return String
	 */
	function getSelection(?lineSep:String):String;
	function markClean():Void;
	function changeGeneration(?closeEvent:Bool):Int;
	function isClean(?generation: Int):Bool;
	function clearHistory():Void;
	function historySize():Int;
	function getMode(): { name:String };
	function lineCount():Int;
	function getAllMarks():Array<Dynamic>;
	function getRange(from: Pos, to: Pos, ?separator: String):String;

	/**
	 *  start is a an optional string indicating which end of the selection to return.
	 *  It may be "start", "end", "head" (the side of the selection that moves when you press shift+arrow),
	 *  or "anchor" (the fixed side of the selection).
	 *  Omitting the argument is the same as passing "head". A {line, ch} object will be returned.
	 *  @param start -
	 *  @return Pos
	 */
	function getCursor( ?start : Bool ) : Pos;
	function setCursor(pos: Pos, ?ch: Int, ?options: Dynamic):Void;
	function listSelections():Array<{anchor:Pos, head:Pos}>;
	/**
	 *  Set the selection range. anchor and head should be {line, ch} objects.
	 *  head defaults to anchor when not given.
	 *  @param anchor -
	 *  @param head -
	 *  @param options -
	 */
	function setSelection(anchor: Pos, ?head: Pos, ?options: Dynamic):Void;
	/**
	 *  Replace the selection with the given string.
	 *  By default, the new selection will span the inserted text.
	 *  The optional collapse argument can be used to change this—passing "start" or "end" will collapse
	 *  the selection to the start or end of the inserted text.
	 *  @param replacement -
	 *  @param select -
	 */
	function replaceSelection(replacement: String, ?select: String):Void;
	function getLine(line:Int):String;
	var history:DocHistory;
}

@:native('CodeMirror') extern class CodeMirror extends Doc {

	static var keyMap:Dynamic;
	public var gutters:Array<String>;
	public var state:{completionActive:Dynamic};

	public static var prototype:Dynamic;

	public static var commands (default,null) : Dynamic<CodeMirror->Void>;
	//public static function simpleHint( cm : CodeMirror , getCompletions : CodeMirror -> Completions ) : Void;

	public static function fromTextArea( textarea : Dynamic , ?config : Dynamic ) : CodeMirror;

	public static function registerHelper(type:String, mode:String, onCompletion:Dynamic):Void;

	@:overload(function (object:Dynamic, event:String, callback_function:Dynamic):Void {})
	function on(event:String, callback_function:Dynamic):Void;

	function refresh() : Void;
	function getLineNumber(pos:Pos):Int;

	function firstLine():Int;
	function lastLine():Int;

	function setOption(option:String, value:Dynamic):Void;
	function swapDoc(doc:Dynamic):Void;
	function getDoc():CodeMirror;

	@:overload(function (lineHandle: LineHandle, gutterID: String, value: Element):LineHandle {})
	function setGutterMarker(line: Int, gutterID: String, value: Element):LineHandle;
	function indexFromPos(pos:Pos):Int;
	function posFromIndex(index:Int):Pos;

	function addLineWidget(line:Int, msg:DivElement, options:LineWidgetOptions):Dynamic;
	function removeLineWidget(widget:Dynamic):Void;

	function getScrollInfo():Dynamic;
	function scrollTo(param1:Dynamic, y:Int):Void;
	function charCoords(param1:Dynamic, param2:String):Dynamic;
	function cursorCoords(start:Bool):{left:Int, right:Int, top:Int, bottom:Int};
	function getScrollerElement():Dynamic;
	function scrollIntoView(from:Pos, to:Pos):Dynamic;
	static function defineExtension(name:String, func:Dynamic):Void;
	function centerOnLine(line:Int):Void;
	function scanForBracket(pos:CodeMirror.Pos, dir:Int, ?style:Dynamic, ?config:Dynamic): { ch:String, pos:CodeMirror.Pos };
	function findMatchingBracket(pos:CodeMirror.Pos, strict:Bool, config:Dynamic):{from:CodeMirror.Pos, to:CodeMirror.Pos,
				match: String, forward: Bool};

	function execCommand(command:String):Void;

	/**
	 *  Replace the part of the document between from and to with the given string.
	 *  from and to must be {line, ch} objects.
	 *  to can be left off to simply insert the string at position from.
	 *
	 *  @param replacement - string to replace
	 *  @param from - {line, ch} Pos-objects
	 *  @param to - (optional)
	 *  @param origin - (optional)
	 */
	function replaceRange(replacement: String, from: Pos, ?to: Pos, ?origin: String):Void;

	function markText(from : Pos, to : Pos, options:{className : String} ) : MarkedText;

	function setMarker( line : Int , ?text : String , ?className : String ) : LineHandle;
	@:overload( function( line : LineHandle ) : Void {})
	function clearMarker(line:Int) : Void;
	function getTokenAt(pos: Pos, ?precise:Bool):TokenData;
	function getTokenTypeAt(pos: Pos):String;
	function indentLine(line: Int, ?dir: Dynamic): Void;
	function showHint(options:Dynamic):Void;

	function foldCode(pos:Pos, ?options:{call:Dynamic}, ?force:String):Void;
	function isFolded(pos:Pos):Bool;

	function operation(func:Dynamic):Void;

	function getWrapperElement() : DivElement;

	function focus() : Void;
	function getOption(name:String): Dynamic;


	function addKeyMap(map: {}, ?bottom: Bool) : Void;

}
