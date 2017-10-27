package js.npm;

import haxe.extern.EitherType;



/**
 * https://github.com/fivdi/onoff#api
 *
 * GPIO access and interrupt detection with Node.js on Linux boards like the Raspberry Pi, C.H.I.P. or BeagleBone.
 *
 * onof: v1.1.8
 */


@:enum abstract Direction(String) {
    var IN = 'in';
    var OUT = 'out';
    var HIGH = 'high';
    var LOW = 'low';
}
@:enum abstract DirectionValue(String) {
    var IN = 'in';
    var OUT = 'out';
}

// 'none', 'rising', 'falling' or 'both'.
@:enum abstract EdgeValue(String) {
    var NONE = 'none';
    var RISING = 'rising';
    var FALLING = 'falling';
    var BOTH = 'both';
}

// typedef PDFMargin = {
//  top: Int,
//     left: Int,
//     bottom: Int,
//     right: Int
// }


@:native('Gpio')
@:jsRequire("onoff", "Gpio")
extern class Gpio {

  /**
   * Gpio(gpio, direction [, edge] [, options]) - Constructor
   * @param  gpio                           An unsigned integer specifying the GPIO number.
   * @param  direction<String,Direction>    A string specifying whether the GPIO should be configured as an input or output.
   *                                           The valid values are: 'in', 'out', 'high', and 'low'.
   *                                           If 'out' is specified the GPIO will be configured as an output and the value of the GPIO will be set to 0.
   *                                           'high' and 'low' are variants of 'out' that configure the GPIO as an output with an initial level of 1 or 0 respectively.
   * @param  ?edge<String,Edge>             An optional string specifying the interrupt generating edge or edges for a GPIO input.
   *                                           The valid values are: 'none', 'rising', 'falling' or 'both'.
   *                                           The default value is 'none' indicating that the GPIO does not generate interrupts.
   *                                           On Linux kernels prior to 3.13 it was possible for both inputs and outputs to generate interrupts.
   *                                           The 3.13 kernel dropped support for interrupt generating outputs, irrespective of whether the underlying hardware supports them or not.
   *                                           Whether or not interrupts are supported is GPIO specific.
   *                                           If interrupts are not supported the edge argument should not be specified.
   * @param  ?options                       An optional options object.
   */
  function new(gpio:Int, direction:EitherType<String,Direction>,?edge:EitherType<String,EdgeValue>, ?options:Dynamic):Void;

  /**
   * Read GPIO value asynchronously
   *   Note that most systems support readback of GPIOs configured as outputs.
   *   The read method can therefore be called for any GPIO, irrespective of whether it was configured as an input or an output.
   *   The Raspberry Pi and BeagleBone are examples of such systems.
   * @param  ?callback :  Error -> Int -> Void      An optional completion callback that gets two arguments (err, value), where err is reserved for an error object and value is the number 0 or 1 and represents the state of the GPIO.
   */
  function read(?callback:Error -> Int -> Void):Void;

  /**
   * Read GPIO value synchronously.
   *   Note that most systems support readback of GPIOs configured as outputs. The readSync method can therefore be called for any GPIO, irrespective of whether it was configured as an input or an output. The Raspberry Pi and BeagleBone are examples of such systems.
   * @return    the number 0 or 1 to represent the state of the GPIO.
   */
  function readSync():EitherType<Int,DirectionValue>;// - Read GPIO value synchronously

  /**
   * Write GPIO value asynchronously
   * @param  value                            The number 0 or 1.
   * @param  ?callback    Error -> Void       An optional completion callback that gets one argument (err), where err is reserved for an error object.
   * @return           [description]
   */
  function write(value:Int,?callback:Error -> Void):Void;


  /**
   * writeSync(value)
   * Write GPIO value synchronously
   * @param  value - The number 0 or 1.
   * @return       [description]
   */
  function writeSync(value:Int):Void;

  /**
   * Watch for hardware interrupts on the GPIO
   * @param  callback Error -> Int -> Void      A callback that gets two arguments (err, value), where err is reserved for an error object and value is the number 0 or 1 and represents the state of the GPIO.
   *                                              The value can also be used to determine whether the interrupt occurred on a rising or falling edge.
   *                                              A value of 0 implies a falling edge interrupt and a value of 1 implies a rising edge interrupt.
   *                                              Watch for hardware interrupts on the GPIO.
   *                                              The edge argument that was passed to the constructor determines which hardware interrupts to watch for.
   */
  function watch(callback:Error -> Int -> Void):Void;

  // unwatch([callback])

  // [callback] - The callback to remove.
  // Stop watching for hardware interrupts on the GPIO. If callback is specified, only that particular callback is removed. Otherwise all callbacks are removed.
  function unwatch(?callback:Void):Void;// - Stop watching for hardware interrupts on the GPIO


  /**
   * Remove all hardware interrupt watchers for the GPIO.
   */
  function unwatchAll():Void;

  // direction()

  // Returns the string 'in' or 'out' indicating whether the GPIO is an input or output.
  function direction():Void;// - Get GPIO direction

  /**
   * Set GPIO direction.
   * @param direction<String, DirectionValue>     A string specifying whether the GPIO should be configured as an input or output. The valid values are 'in' and 'out'.
   */
  function setDirection(direction:EitherType<String, DirectionValue>):Void; // - Set GPIO direction

  /**
   * Get GPIO interrupt generating edge
   * @return        the string 'none', 'falling', 'rising', or 'both'
   *                     indicating the interrupt generating edge or edges for the GPIO.
   *                     Whether or not interrupts are supported is GPIO specific.
   *                     If interrupts are not supported the edge method should not be used.
   */
  function edge():Eithertype<String, EdgeValue>;

  // setEdge(edge)

  // The valid values are: 'none', 'rising', 'falling' or 'both'.
  // On Linux kernels prior to 3.13 it was possible for both inputs and outputs to generate interrupts.
  // The 3.13 kernel dropped support for interrupt generating outputs, irrespective of whether the underlying
  // hardware supports them or not. Whether or not interrupts are supported is GPIO specific.
  // If interrupts are not supported the setEdge method should not be used.
  // Set GPIO interrupt generating edge.
  /**
   * Set GPIO interrupt generating edge
   * @param edge  - A string specifying the interrupt generating edge or edges for the GPIO.
   */
  function setEdge(edge:Eithertype<String, EdgeValue>):Void;

  // activeLow()
  // Returns true or false indicating whether or not the values read from or written to the GPIO are inverted.
  function activeLow():Bool; // - Get GPIO activeLow setting

    // setActiveLow(invert)

  // invert - A boolean value specifying whether the values read from or written to the GPIO should be inverted. The interrupt generating edge for the GPIO also follow this this setting. The valid values for invert are true and false. Setting activeLow to true inverts. Optional, the default value is false.
  // Set GPIO activeLow setting.
  function setActiveLow(invert) - Set GPIO activeLow setting

  /**
   * Reverse the effect of exporting the GPIO to userspace.
   * A Gpio object should not be used after calling its unexport method.
   */
  function unexport():Void;

}