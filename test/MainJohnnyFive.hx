import js.npm.johnnyfive.Button;
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
	}

	// http://johnny-five.io/examples/
	function init0(){

		var board = new Board();

		board.on(BoardEvents.READY, function() {

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

	static public function main() {
		var app = new MainJohnnyFive();
	}
}