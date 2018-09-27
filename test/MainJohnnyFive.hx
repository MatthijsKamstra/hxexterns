import js.npm.johnnyfive.Button;
import js.npm.johnnyfive.Buttons;
import js.npm.johnnyfive.Board;
import js.npm.johnnyfive.Led;

import js.Browser.console;

class MainJohnnyFive {

	public function new() {
		// not sure how to do this better
		// var five = new js.npm.JohnnyFive();
		init0();
		init1();
		init2();
		init3();
		init4();
		init5();
		init5a();
	}

	// http://johnny-five.io/examples/
	function init0(){
		var board = new Board();
		board.on(BoardEvents.READY, function() {
			console.log("Ready!");
			// Create a standard `led` component instance
			var led = new Led(13);
			// "blink" the led in 500ms
			// on-off phase periods
			led.blink(500);
		});
	}

	function init1():Void {
		// Attached to an analog pin
		var button = new Button("A0");
	}

	function init2():Void {
		// var five = require("johnny-five");
		var board = new Board();
		board.on("ready", function() {
			// Create a new `button` hardware instance.
			var button = new Button(2);
			button.on(ButtonEvents.HOLD, function() {
				console.log( "Button held" );
			});
			button.on("press", function() {
				console.log( "Button pressed" );
			});
			button.on("release", function() {
				console.log( "Button released" );
			});
		});
	}

	// http://johnny-five.io/examples/board-cleanup/
	function init3(){
		var board = new Board();

		board.on("ready", function() {
			var led = new Led(13);
			led.on();

			js.Lib.nativeThis.on(BoardEvents.EXIT, function() {
				led.off();
			});
		});
	}

	// http://johnny-five.io/examples/button/
	function init4(){
		// var five = require("johnny-five"),

		var board = new Board();

		board.on("ready", function() {

			// Create a new `button` hardware instance.
			// This example allows the button module to
			// create a completely default instance
			var button = new Button(2);

			// Inject the `button` hardware into
			// the Repl instance's context;
			// allows direct command line access
			board.repl.inject({
				button: button
			});

			// Button Event API

			// "down" the button is pressed
			button.on("down", function() {
				console.log("down");
			});

			// "hold" the button is pressed for specified time.
			//        defaults to 500ms (1/2 second)
			//        set
			button.on("hold", function() {
				console.log("hold");
			});

			// "up" the button is released
			button.on("up", function() {
				console.log("up");
			});
		});
	}

	function init5(){
		var board = new Board();

		board.on("ready", function() {
			// The "shared property" interface, allows
			// writing a more succint initialization,
			// as it's effectively a short hand for:
			//
			// var buttons = new five.Buttons([
			//   { pin: 2, invert: true },
			//   { pin: 3, invert: true },
			//   { pin: 4, invert: true },
			//   { pin: 5, invert: true },
			//   { pin: 6, invert: true },
			// });
			//
			var buttons = new Buttons({
				pins: [2, 3, 4, 5, 6],
				invert: true,
			});

			buttons.on("press", function(button) {
				console.log("Pressed: ", button.pin);
			});

			buttons.on("release", function(button) {
				console.log("Released: ", button.pin);
			});
		});
	}

	function init5a(){
		var button1 = new Button(2);
		var button2 = new Button(3);
		var button3 = new Button(4);

		new Buttons([ 2, 3, 4, 5 ]);
		new Buttons([ { pin: 2 }, { pin: 3 }, { pin: 4 }, { pin: 5 } ]);
		new Buttons([ button1, button2, button3 ]);
	}


	static public function main() {
		var app = new MainJohnnyFive();
	}
}