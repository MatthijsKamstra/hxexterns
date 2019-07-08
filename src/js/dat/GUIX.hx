package js.dat;

import js.dat.gui.GUI.GUIOptions;
import js.dat.controllers.*;
import js.Browser.*;

class GUIX extends js.dat.gui.GUI {
	/**
	 * the HxGUI is an Haxe wrapper for dat.GUI
	 * It's to check the object you want to manipulate via the Haxe compiler and don't get errors on run time
	 *
	 * @param option	(optional) the GUI options you can set (see GUIOptions)
	 */
	public function new(?option:GUIOptions):Void {
		super(option);
	}

	// static function myHandler( msg : String, stack : Array<String> ) {
	//     js.Browser.alert(msg);
	//     return true;
	// }

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
	 * 				var gui = new js.dat.GUIX(this);
	 * 				gui.add(this.foobar);
	 *
	 * @param object 		The object to be manipulated
	 * @param property 		(optional) The name of the property to be manipulated
	 * @returns The new controller that was added.
	 */
	override public function add(object:Dynamic, property:String, ?min:Float, ?max:Float, ?step:Float):Controller {
		// if (_class == null && property == null) {
		// 	console.warn('Set scope first OR add a string property');
		// 	return null;
		// }
		// var isFunction = (Reflect.isFunction(object));
		// var isObject = (Reflect.isObject(object));
		// console.log(isFunction);
		var isProperty = false;
		var fieldsArr = Type.getClassFields(object);
		for (i in 0...fieldsArr.length) {
			var field = fieldsArr[i];
			// trace(field);
			/**
			 * looking for the same value... not the best way to indentify vars
			 */
			if (Reflect.getProperty(object, field) == property) {
				// trace('>>>>>> found it ${object}, ${field}, ${property}');
				isProperty = true;
			};
			// check the fields in the object vs the property given...
			// not extremely helpfull in compile time
			if (field == property) {
				// trace('>>>>>> found it ${object}, ${field}, ${property}');
				isProperty = true;
			}
		}
		if (!isProperty) {
			try {
				throw 'In ${object} there is no property "${property}"!\n${object}.${property}';
			} catch (e:Dynamic) {
				js.Browser.alert('$e');
			}
		}
		return super.add(object, property, min, max, step);

		// 		for (i in 0...Type.getClassFields(_class).length) {
		// 	var field = Type.getClassFields(_class)[i];
		// 	// trace(field);
		// 	if (Reflect.getProperty(_class, field) == object) {
		// 		// trace('>>>>>> found it ${_class}, ${field}');
		// 		object = _class;
		// 		property = field;
		// 	};
		// }
		// var temp = super.add(object, property);
		// console.log(temp);
		// console.log(this);
		// return temp;
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
	// override public function addFolder(name:String):js.dat.gui.GUI {
	// 	return super.addFolder(name);
	// 	// return this;
	// };
}
