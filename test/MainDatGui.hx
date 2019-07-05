class MainDatGui {

	var message:String;
	var speed:Float;
	var displayOutline:Bool;
	var explode:Dynamic;
	var noiseStrength:Float;

	var growthSpeed:Float;
	var maxSize:Float;


	public function new() {
		init0();
	}

	function FizzyText ():Dynamic {
		this.message = 'dat.gui';
		this.speed = 0.8;
		this.displayOutline = false;
		this.noiseStrength = 0.8;
		this.growthSpeed = 0.8;
		this.maxSize = 0.8;
		this.explode = function() {
			trace('booom');
		};

		js.Lib.nativeThis.color0 = "#ffae23"; // CSS string
		js.Lib.nativeThis.color1 = [ 0, 128, 255 ]; // RGB array
		js.Lib.nativeThis.color2 = [ 0, 128, 255, 0.3 ]; // RGB with alpha
		js.Lib.nativeThis.color3 = { h: 350, s: 0.9, v: 0.3 }; // Hue, saturation, value

		return {
			message:this.message,
			speed:this.speed,
			maxSize:this.maxSize,
			noiseStrength:this.noiseStrength,
			growthSpeed:this.growthSpeed,
			displayOutline:this.displayOutline,
			explode:this.explode
		};
	};

	function init0(){
		var text = FizzyText();

		var gui = new js.dat.gui.GUI();
		gui.add(text, 'message');
		gui.add(text, 'speed', -5, 5);
		gui.add(text, 'displayOutline');
		gui.add(text, 'explode');

		var f1 = gui.addFolder('Flow Field');
		f1.add(text, 'speed');
		f1.add(text, 'noiseStrength');

		var f2 = gui.addFolder('Letters');
		f2.add(text, 'growthSpeed');
		f2.add(text, 'maxSize');
		f2.add(text, 'message');


		// gui.addColor(text, 'color0');
		// gui.addColor(text, 'color1');
		// gui.addColor(text, 'color2');
		// gui.addColor(text, 'color3');

		var controller = gui.add(text, 'maxSize', 0, 10);
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