package js.dat;

import js.dat.gui.GUI.GUIOptions;
import js.dat.controllers.*;
import js.Browser.*;

class GUIX extends js.dat.gui.GUI {
	static public var _gui:js.dat.gui.GUI;

	static public var _class:Dynamic;

	/**
	 * the HxGUI is an Haxe wrapper for dat.GUI
	 * It's to check the object you want to manipulate via the Haxe compiler and don't get errors on run time
	 *
	 * @param scope		(optional) the class with the variables you want to manipulate (currenly only one class possible)
	 * @param option	(optional) the GUI options you can set (see GUIOptions)
	 */
	// public function new(?scope:Dynamic, ?option:GUIOptions):Void {
	// 	_class = scope;
	// 	// gui = new js.dat.gui.GUI(option);
	// 	super(option);
	// }

	public static function init(?scope:Dynamic, ?option:GUIOptions):js.dat.gui.GUI {
		_class = scope;
		_gui = new js.dat.gui.GUI(option);
		return _gui;
	}

	/**
	 * If you didn't set class scope in the constructor you can do it here
	 * @param scope		the class with the variables you want to manipulate (currenly only one class possible)
	 * @return js.dat.gui.GUI
	 */
	// public function scope(scope:Dynamic):js.dat.gui.GUI {
	// 	_class = scope;
	// 	return gui;
	// };

	/**
	 * Default add still works, but there is no compile checking.
	 * If you want to be sure the variable exists on compile time, you need to set the scope
	 *
	 * @example
	 * 				// default methode
	 * 				var gui = new js.dat.gui.GUI();
	 * 				gui.add(this, 'foobar');
	 *
	 * 				// with Haxe wrapper
	 * 				var gui = new js.dat.HxGUI(this);
	 * 				gui.add(this.foobar);
	 *
	 * @param object 		The object to be manipulated
	 * @param property 		(optional) The name of the property to be manipulated
	 * @returns The new controller that was added.
	 */
	override public function add(object:Dynamic, ?property:String):Controller {
		if (_class == null && property == null) {
			console.warn('Set scope first OR add a string property');
			return null;
		}
		// var isFunction = (Reflect.isFunction(object));
		// var isObject = (Reflect.isObject(object));
		// console.log(isFunction);
		for (i in 0...Type.getClassFields(_class).length) {
			var field = Type.getClassFields(_class)[i];
			// trace(field);
			if (Reflect.getProperty(_class, field) == object) {
				// trace('>>>>>> found it ${_class}, ${field}');
				object = _class;
				property = field;
			};
		}
		var temp = super.add(object, property);
		console.log(temp);
		console.log(this);
		return temp;
		// return parent.add(object, property);
		// return {}; // return gui.add(object, property);
	}

	/**
	 * [Description]
	 * @param object
	 * @param property
	 * @return ColorController
	 */
	// public function _addColor(object:Dynamic, ?property:String):ColorController {
	// 	return gui.addColor(object, property);
	// };

	/**
	 * [Description]
	 * @param name
	 * @return GUIX
	 */
	override public function addFolder(name:String):js.dat.gui.GUI {
		return super.addFolder(name);
		// return this;
	};
}
