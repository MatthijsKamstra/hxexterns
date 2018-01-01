package;

import js.npm.Gpio;
// import js.node.Process;

import js.npm.Gpio;
import js.Node.process;

import js.html.Window;
import js.Browser;
import js.Browser.*;
import js.Browser.window;

class MainOnOffPushbutton {

  var led : Gpio; // = new Gpio(4, 'out'); //use GPIO pin 4, and specify that it is output
  var pushButton : Gpio; //use GPIO pin 17 as input, and 'both' button presses, and releases should be handled

  /**
   * https://www.w3schools.com/nodejs/nodejs_raspberrypi_led_pushbutton.asp
   *
   * @return [description]
   */
  public function new() {
    trace('start MainOnOffPushbutton.hx');

    led = new Gpio(4, 'out'); //use GPIO pin 4 as output
    pushButton = new Gpio(17, 'in', 'both'); //use GPIO pin 17 as input, and 'both' button presses, and releases should be handled

    pushButton.watch(function (err, value) {
      //Watch for hardware interrupts on pushButton GPIO, specify callback function
      if (err != null) {
        //if an error
        console.error('There was an error', err); //output error message to console
        return;
      }
      led.writeSync(value); //turn LED on or off depending on the button state (0 or 1)
      }
    );
    process.on('SIGINT', unexportOnClose); //function to run when user closes using ctrl+c
  };

  function unexportOnClose() { //function to run when exiting program
    led.writeSync(0); // Turn LED off
    led.unexport(); // Unexport LED GPIO to free resources
    pushButton.unexport(); // Unexport Button GPIO to free resources
  };


  static public function main() {
    var app = new MainOnOffPushbutton();
  }
}