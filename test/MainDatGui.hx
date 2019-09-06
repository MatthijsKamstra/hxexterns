class MainDatGui {

	var message = 'dat.gui';
	var speed = 0.8;
	var displayOutline = false;
	var noiseStrength = 0.8;
	var growthSpeed = 0.8;
	var maxSize = 0.8;
	var explode = function() {
			trace('booom');
		};

	var color0 = "#ffae23"; // CSS string
	var color1 = [ 0, 128, 255 ]; // RGB array
	var color2 = [ 0, 128, 255, 0.3 ]; // RGB with alpha
	var color3 = { h: 350, s: 0.9, v: 0.3 }; // Hue, saturation, value

	public function new() {
		init0();
		init1();
	}

	function init1(){
		var gui = new js.dat.GUIX();
		gui.add(this, 'message');
		// gui.add(this, 'speed', -5, 5);
		gui.add(this, 'displayOutline');
		gui.add(this, 'explode');
		gui.add(this, 'fail');

	}

	function init0(){
		var gui = new js.dat.gui.GUI();
		gui.add(this, 'message');
		gui.add(this, 'speed', -5, 5);
		gui.add(this, 'displayOutline');
		gui.add(this, 'explode');

		var f1 = gui.addFolder('Flow Field');
		f1.add(this, 'speed');
		f1.add(this, 'noiseStrength');

		var f2 = gui.addFolder('Letters');
		f2.add(this, 'growthSpeed');
		f2.add(this, 'maxSize');
		f2.add(this, 'message');

		// Choose from accepted values
		gui.add(text, 'message', [ 'pizza', 'chrome', 'hooray' ] );

		// Choose from named values
		gui.add(text, 'speed', { Stopped: 0, Slow: 0.1, Fast: 5 } );

		gui.addColor(this, 'color0');
		gui.addColor(this, 'color1');
		gui.addColor(this, 'color2');
		gui.addColor(this, 'color3');

		var controller = gui.add(this, 'maxSize', 0, 10);
		controller.onChange(function(value) {
			// Fires on every change, drag, keypress, etc.
			trace('value: $value');
		});

		controller.onFinishChange(function(value) {
			// Fires when a controller loses focus.
			js.Browser.alert("The new value is " + value);
		});
	}


	static public function main() {
		var app = new MainDatGui();
	}
}