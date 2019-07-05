package js.dat.gui;

import js.dat.controllers.ColorController;
import js.dat.controllers.Controller;
import haxe.Json;

/**
 * dat-gui JavaScript Controller Library
 * http://code.google.com/p/dat-gui
 *
 * Copyright 2011 Data Arts Team, Google Creative Lab
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 */

/**
 * @author Haxe externs: Mathieu Anthoine <anthoine.mathieu@gmail.com>
 */


/**
 * Haxe externs for dat.GUI v0.7.6
 * Project: https://github.com/dataarts/dat.gui
 * Definitions by: Matthijs Kamstra aka [mck] <https://github.com/MatthijsKamstra>
 * Definitions: <https://github.com/DefinitelyTyped/DefinitelyTyped/blob/master/types/johnny-five>
 *          	<https://github.com/MatthijsKamstra/hxexterns>
 */

@:native("dat.gui.GUI")
extern class GUI {

	/**
	 * A lightweight controller library for JavaScript. It allows you to easily
	 * manipulate variables and fire functions on the fly.
	 * @class GUI
	 * @param {GUIOptions} [options]
	 * @param {String} [options.name] The name of this GUI.
	 * @param {JSON} [options.load] JSON object representing the saved state of this GUI
	 * @param {String} [options.preset] name of the settings preset
	 * @param {Bool} [options.autoPlace=true] automatic position of this GUI
	 *
	 * @param {Bool} [options.auto] ???
	 * @param {parent} [params.parent] parent of this GUI
	 * @param {Boolean} [params.closed=false] GUI stars closed
	 */
	function new(?options:GUIOptions);

	/**
	 * Add a controller in the GUI instance
	 *
	 * @method add
	 * @param {Dynamic} object The object to be manipulated
	 * @param {string} property The name of the property to be manipulated
	 * @returns {Controller} The new controller that was added.
	 */
	@:overload(function(object:Dynamic, property:String,min:Float,max:Float):Controller{})
	@:overload(function(object:Dynamic, property:String,values:Array<String>):Controller{})
	@:overload(function(object:Dynamic, property:String,values:Dynamic):Controller{})
	function add(object:Dynamic, property:String) : Controller;

	// @:overload(function(target:Dynamic, propName:String, status:Bool):Controller { })
	// @:overload(function(target:Dynamic, propName:String, items:Array<String>):Controller { })
	// @:overload(function(target:Dynamic, propName:String, items:Array<Float>):Controller { })
	// @:overload(function(target:Dynamic, propName:String, items:Dynamic):Controller { })
	// public function add(target:Dynamic, propName:String, ?min:Float, ?max:Float, ?step:Float):Controller;



	/**
	 * Add folder in this GUI
	 *
	 * @param name
	 * @returns {GUI} The new folder.
	 * @throws {Error} if this GUI already has a folder by the specified name
	 */
	function addFolder(name:String):GUI;
	// public function addFolder(propName:String):GUI;

	/**
	 * Set a colorpicker to a controller
	 *
	 * @param object
	 * @param property
	 * @returns {ColorController} The new ColorController that was added.
	 */
	function addColor(object:Dynamic, property:String) : ColorController;
	// public function addColor(target:Dynamic, propName:String):Controller;

	/**
	 * Mark objects for saving. The order of these objects cannot change as
	 * the GUI grows. When remembering new objects, append them to the end
	 * of the list.
	 *
	 * @param {Dynamic} object to remember
	 * @throws {Error} if not called on a top level GUI.e
	 */
	function remember (object:Dynamic):Void;
	// public function remember(target:Dynamic, additionalTargets:haxe.extern.Rest<Dynamic>):Void;

	/**
	 * open this GUI
	 */
	function open():Void;

	/**
	 * close this GUI
	 */
	function close():Void;


	public function remove(controller:Controller):Void;
	public function destroy():Void;
	public function removeFolder(subFolder:GUI):Void;

	public function getRoot():GUI;
	public function getSaveObject():Dynamic;
	public function save():Void;
	public function saveAs(presetName:String):Void;
	public function revert(gui:GUI):Void;
	public function listen(controller:Controller):Void;
	public function updateDisplay():Void;


	public var __controllers : Array<Controller>;
	public var __folders : Array<GUI>;
	public var domElement : js.html.Element;
	public var parent : GUI;
	public var scrollable : Bool;
	public var autoPlace : Bool;
	public var preset : String;
	public var width : Float;
	public var name : String;
	public var closed : Bool;
	public var load : Dynamic;
	public var useLocalStorage : Bool;
}


typedef GUIOptions = {
	@:optional var load:Json;
	@:optional var preset:String;
	@:optional var autoPlace:Bool;

	// @:optional public var autoPlace : Bool;
	@:optional public var closed : Bool;
	@:optional public var closeOnTop : Bool;
	@:optional public var hideable : Bool;
	// @:optional public var load : Dynamic;
	@:optional public var name : String;
	// @:optional public var preset : String;
	@:optional public var width : Float;

}