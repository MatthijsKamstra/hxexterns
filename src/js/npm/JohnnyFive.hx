package js.npm;


@:enum abstract Pin(String) {
	var P1_1 = 'P1-1';
}



/**
 * Haxe externs for Johnny-Five v1.0
 * Project: https://github.com/rwaldron/johnny-five
 * Definitions by: Matthijs Kamstra aka [mck] <https://github.com/MatthijsKamstra>
 * Definitions: <https://github.com/DefinitelyTyped/DefinitelyTyped/blob/master/types/johnny-five>
 *    			<https://github.com/MatthijsKamstra/hxexterns>
 */
@:jsRequire("johnny-five")
extern class JohnnyFive {
	public function new( ) : Void;

	// P1-11	0	GPIO17
	inline public static var P1_11 : String = 'P1-11';

	// P1 header
	/**
	 * Model A+/B+/Raspberry Pi 2/Raspberry Pi 3/Raspberry Pi Zero
	 * @param pin [description]
	 */
	inline public static function PI_PIN (nr:Int):String{
		switch (nr) {
			case 0: return 'P1-11';
			case 1: return 'P1-12';
			case 2: return 'P1-13';
			case 3: return 'P1-15';
			case 4: return 'P1-16';
			case 5: return 'P1-18';
			case 6: return 'P1-22';
			case 7: return 'P1-7';

			case 8: return '[not a pi-pin (8)]';
			case 9: return '[not a pi-pin (9)]';

			case 10: return 'P1-24';
			case 11: return 'P1-26';
			case 12: return 'P1-19';
			case 13: return 'P1-21';
			case 14: return 'P1-23';
			case 15: return 'P1-8';

			case 16: return 'P1-10';
			case 21: return 'P1-29';
			case 22: return 'P1-31';
			case 23: return 'P1-33';
			case 24: return 'P1-35';
			case 25: return 'P1-37';

			case 26: return 'P1-32';
			case 27: return 'P1-36';
			case 28: return 'P1-38';
			case 29: return 'P1-40';

			default : return '';
		}
	}
	// P1 header
	/**
	 *
	 * @source		https://github.com/nebrius/raspi-io/#pin-naming
	 *
	 * Model A+/B+/Raspberry Pi 2/Raspberry Pi 3/Raspberry Pi Zero
	 *
	 * not sure what PI_PIN does anymore... so to make sure it keeps working I will use this in the futuere
	 *
	 * @param pin [description]
	 */
	inline public static function GPIO (nr:Int):String{
		switch (nr) {
			// case 0: return 'P1-11';
			// case 1: return 'P1-12';
			case 2: return 'P1-13';
			case 3: return 'P1-15';
			case 4: return 'P1-16';
			case 5: return 'P1-18';
			case 6: return 'P1-22';
			case 7: return 'P1-7';

			case 8: return '[not a pi-pin (8)]';
			case 9: return '[not a pi-pin (9)]';

			case 10: return 'P1-24';
			case 11: return 'P1-26';
			case 12: return 'P1-19';
			case 13: return 'P1-21';
			case 14: return 'P1-23';
			case 15: return 'P1-8';

			case 16: return 'P1-10';
			case 21: return 'P1-29';
			case 22: return 'P1-31';
			case 23: return 'P1-33';
			case 24: return 'P1-35';
			case 25: return 'P1-37';

			case 26: return 'P1-32';
			case 27: return 'P1-36';
			case 28: return 'P1-38';
			case 29: return 'P1-40';

			default : return '';
		}
	}
}

/**
 * if you get TypeError: raspi is not a constructor
 * source: https://dissenter.com/comment/5cb473938451d26cab2469ec
 */
// @:jsRequire("raspi-io")
@:jsRequire("raspi-io", "RaspiIO")
@:native('Raspi')
extern class Raspi {
	public function new( ) : Void;
}
