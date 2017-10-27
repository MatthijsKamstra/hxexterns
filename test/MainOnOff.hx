package;

import js.npm.Gpio;

class MainOnOff {

  public function new() {
    // init1();
    // init2();
    init2a();
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
    iv = untyped setInterval(function () {
      led.writeSync(led.readSync() ^ 1); // 1 = on, 0 = off :)
    }, 200);

    // Stop blinking the LED and turn it off after 5 seconds.
    untyped setTimeout(function () {
      clearInterval(iv); // Stop blinking
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

  static public function main() {
    var app = new MainOnOff();
  }
}