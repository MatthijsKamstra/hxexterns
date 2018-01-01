package;

import js.npm.Gpio;
// import js.node.Process;


class MainOnOffBlink {

  var led : Gpio; // = new Gpio(4, 'out'); //use GPIO pin 4, and specify that it is output
  var blinkInterval : Int; // = window.setInterval(blinkLED, 250); //run the blinkLED function every 250ms

  /**
   * https://www.w3schools.com/nodejs/nodejs_raspberrypi_blinking_led.asp
   *
   * @return [description]
   */
  public function new() {
    trace('start MainOnOffBlink');

    led = new Gpio(4, 'out'); //use GPIO pin 4, and specify that it is output
    blinkInterval = untyped setInterval(blinkLED, 250); //run the blinkLED function every 250ms
    untyped setTimeout(endBlink, 5000); //stop blinking after 5 seconds
  }

  function blinkLED() { //function to start blinking
    if (led.readSync() == 0) { //check the pin state, if the state is 0 (or off)
      trace('turn LED on');
      led.writeSync(1); //set pin state to 1 (turn LED on)
    } else {
      trace('turn LED off');
      led.writeSync(0); //set pin state to 0 (turn LED off)
    }
  }

  function endBlink() { //function to stop blinking
    trace('end blink');
    untyped clearInterval(blinkInterval); // Stop blink intervals
    led.writeSync(0); // Turn LED off
    led.unexport(); // Unexport GPIO to free resources
  }

  static public function main() {
    var app = new MainOnOffBlink();
  }
}