package;

import js.npm.Gpio;
// import js.node.Process;

import js.html.Window;
import js.Browser;
import js.Browser.window;

class MainOnOff {

  public function new() {
    // init1();
    // init2();
    // init2a();
    // init3();
    init4();
  }

  function init1(){
    var led = new Gpio(17, Direction.OUT);
    var button = new Gpio(4, Direction.IN, EdgeValue.BOTH);

    button.watch(function(err:js.Error, value:Int) {
      if (err != null) {
        throw err;
      }
      led.writeSync(value);
    });

    untyped process.on('SIGINT', function () {
      led.unexport();
      button.unexport();
    });
  }

  /**
   * Synchronous API
      Blink the LED on GPIO #17 for 5 seconds:
   * @return [description]
   */
  function init2(){
    var led = new Gpio(17, Direction.OUT);      // Export GPIO #17 as an output.
    var iv;

    // Toggle the state of the LED on GPIO #17 every 200ms.
    // Here synchronous methods are used. Asynchronous methods are also available.
    iv = new haxe.Timer(200);
    iv.run = function () {
      led.writeSync(led.readSync() ^ 1); // 1 = on, 0 = off :)
    };

    // Stop blinking the LED and turn it off after 5 seconds.
    haxe.Timer.delay(function () {
      iv.stop();          // Stop blinking
      led.writeSync(0);   // Turn LED off.
      led.unexport();     // Unexport GPIO and free resources
    }, 5000);
  }

  function init2a(){
    var led = new Gpio(17, Direction.OUT);      // Export GPIO #17 as an output.
    var iv;

    // Toggle the state of the LED on GPIO #17 every 200ms.
    // Here synchronous methods are used. Asynchronous methods are also available.
    // iv = untyped setInterval(function () {
    iv = js.Browser.window.setInterval(function () {
      led.writeSync(led.readSync() ^ 1); // 1 = on, 0 = off :)
    }, 200);

    // Toggle the state of the LED on GPIO #17 every 200ms.
    // Here synchronous methods are used. Asynchronous methods are also available.
    // iv = untyped setInterval(function () {
    //   led.writeSync(led.readSync() ^ 1); // 1 = on, 0 = off :)
    // }, 200);

    // Stop blinking the LED and turn it off after 5 seconds.
    // untyped setTimeout(function () {
    js.Browser.window.setTimeout(function () {
      js.Browser.window.clearInterval(iv); // Stop blinking
      led.writeSync(0);  // Turn LED off.
      led.unexport();    // Unexport GPIO and free resources
    }, 5000);
  }

  /**
   * Asynchronous API
   * Blink the LED on GPIO #17 for 5 seconds:
   * @return [description]
   */
  function init3 (){
    var led = new Gpio(17, Direction.OUT);      // Export GPIO #17 as an output.

    // Toggle the state of the LED on GPIO #17 every 200ms 'count' times.
    // Here asynchronous methods are used. Synchronous methods are also available.
    // (function blink(count) {
    //   if (count <= 0) {
    //     return led.unexport();
    //   }

    //   led.read(function (err, value) { // Asynchronous read.
    //     if (err) {
    //       throw err;
    //     }

    //     led.write(value ^ 1, function (err) { // Asynchronous write.
    //       if (err) {
    //         throw err;
    //       }
    //     });
    //   });

    //   setTimeout(function () {
    //     blink(count - 1);
    //   }, 200);
    // }(25));
  }

  /**
   * https://www.w3schools.com/nodejs/nodejs_raspberrypi_blinking_led.asp
   *
   * @return [description]
   */
  var led : Gpio; // = new Gpio(4, 'out'); //use GPIO pin 4, and specify that it is output
  var blinkInterval : Int; // = window.setInterval(blinkLED, 250); //run the blinkLED function every 250ms
  function init4(){
    // var Gpio = require('onoff').Gpio; //include onoff to interact with the GPIO
    led = new Gpio(4, 'out'); //use GPIO pin 4, and specify that it is output
    blinkInterval = window.setInterval(blinkLED, 250); //run the blinkLED function every 250ms
    window.setTimeout(endBlink, 5000); //stop blinking after 5 seconds
  }
  function blinkLED() { //function to start blinking
    if (led.readSync() == 0) { //check the pin state, if the state is 0 (or off)
      led.writeSync(1); //set pin state to 1 (turn LED on)
    } else {
      led.writeSync(0); //set pin state to 0 (turn LED off)
    }
  }

  function endBlink() { //function to stop blinking
    window.clearInterval(blinkInterval); // Stop blink intervals
    led.writeSync(0); // Turn LED off
    led.unexport(); // Unexport GPIO to free resources
  }

  static public function main() {
    var app = new MainOnOff();
  }
}