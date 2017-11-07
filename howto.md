# Haxe Externs: how to


> The externs mechanism provides access to the native APIs in a type-safe manner. It assumes that the defined types exist at run-time but assumes nothing about how and where those types are defined.


This is a little help to get you started with Haxe externs.

Haxe documentation: <https://haxe.org/manual/lf-externs.html>


Good list/collection externs to start with:

- <https://github.com/clemos/haxe-js-kit>
- <https://github.com/ExternKit>

Some excelent examples:

- Electron: <https://github.com/fponticelli/hxelectron>
- moment.js: <https://github.com/ExternKit/extern-js-moment>
- meteor: <https://github.com/MatthijsKamstra/hxmeteor>
- PIXI: <https://github.com/pixijs/pixi-haxe>
- Three.js: <https://bitbucket.org/yar3333/haxe-threejs>


Typescript to Haxe convertor

- <https://github.com/Simn/ts2hx>
- <https://github.com/francescoagati/DefinitelyTyped.hx>


## Externs Basic

Read Haxe documentation <https://haxe.org/manual/lf-externs.html> for more information.

But the short version is: externs are defined like normal classes but

- the `class` keyword is preceded by the `extern` keyword,
- methods have no expressions,
- all argument and return types are explicit, and
- the default visibility is `public` (`private` must be specified explicitly).


An extern would look something like this


```haxe
extern class MyExtern {
	// clever stuff
}
```

It might be a good idea to add some extra info like Haxe version, Externs based upon lib version, ...



## Structure

Haxe structure its file in packages.

My (and others like me) externs are in `js.npm` package.


```haxe
package js.npm;

/**
 * Source: http://myexternjs.com
 * MyExtern.js v1.12
 */

extern class MyExtern {
	function new ();
	// other clever stuff
}
```

But if you would transpile this extern you would end up with ([haxe](examples/src/TestMyExtern.hx)) [js](examples/bin/TestMyExtern.js)


```js
var myExtern = new js.npm.MyExtern();
```

Not something you would like to have: to fix this check `@:native`


## @:native

Lets see previous example: the path in to the class is forced by the package we use with Haxe

In this case: `js.npm`

You can fix the path of the extern by mirroring the structure with packages

But it's much easier to use `@:native(Output type path)`

> Rewrites the path of a class or enum during generation.

source: <https://haxe.org/manual/cr-metadata.html>


Lets take previous extern with some changes example:

```haxe
package js.npm;

/**
 * Source: http://myexternjs.com
 * MyExtern.js v1.12
 */

@:native('FOO.MyExtern')
extern class MyFooExtern {
	function new ();
	// other clever stuff
}
```


```js
var myExtern = new FOO.MyFooExtern();
```


You have more controle over the path. Plus you can use paths with all caps.

That is not possible with Haxe: a package with caps

- `FOO.test` is not possible
- `Foo.test` is not possible
- `foo.test` is possible


What is a good example: Pixi and Three.js

**[pixi](https://github.com/pixijs/pixi-haxe/blob/dev/src/pixi/core/sprites/Sprite.hx)**

```js
// this is how javascript wants the call
var sprite = new PIXI.Sprite();
```

So how will we use the Haxe Pixi externs?


```haxe
// Haxe without import
var sprite = new pixi.core.sprites.Sprite();
```

or

```haxe
// Haxe with import
import pixi.core.sprites.Sprite;
//
var sprite = new Sprite();
```



**[three.js](https://bitbucket.org/yar3333/haxe-threejs/src/c32fbf00db79d9f4ee0df8a862fea5c54096fe66/library/js/three/Scene.hx?at=default&fileviewer=file-view-default)**


```js
// this is how javascript wants the call
var scene = new THREE.Scene();
```


So how will we use the Haxe Three.js externs?


```haxe
// Haxe without import
var scene = new js.three.Scene();
```

or

```haxe
// Haxe with import
import js.three.Scene;
//
var scene = new Scene();
```



The package and class name of the extern class should be the same as defined in the external library. If that is not the case, rewrite the path of a class using @:native.


## simple example

Lets take a simple javscript example and make a Haxe extern for that

[source](https://matthijskamstra.github.io/haxejs/05externs/example.html)

```js
// JavaScript
function MyJSClass() {
}
MyJSClass.SOME_PROP = 42;
MyJSClass.someFunc = function() {
	return "hello";
}
MyJSClass.prototype.myProp = null;
MyJSClass.prototype.myFunc = function(prop) {
	this.myProp = prop;
}
```

And that will be converted to

```haxe
// Haxe extern
extern class MyJSClass {
	static var SOME_PROP:Int;
	static function someFunc():Void;

	var myProp:String;
	function new();
	function myFunc(prop:String):Void;
}
```




## Rest Eithertype


The haxe.extern package provides two types that help mapping native semantics to Haxe:

- `Rest<T>`: This type can be used as a final function argument to allow passing an arbitrary number of additional call arguments. The type parameter can be used to constrain these arguments to a specific type.
- `EitherType<T1,T2>`: This type allows using either of its parameter types, thus representing a type choice. It can be nested to allow more than two different types.

We demonstrate the usage in this code sample:


```haxe
import haxe.extern.Rest;
import haxe.extern.EitherType;

extern class MyExtern {
  static function f1(s:String, r:Rest<Int>):Void;
  static function f2(e:EitherType<Int, String>):Void;
}

class Main {
  static function main() {
    MyExtern.f1("foo", 1, 2, 3); // use 1, 2, 3 as rest argument
    MyExtern.f1("foo"); // no rest argument
    //MyExtern.f1("foo", "bar"); // String should be Int

    MyExtern.f2("foo");
    MyExtern.f2(12);
    //MyExtern.f2(true); // Bool should be EitherType<Int, String>
  }
}
```

[source](https://haxe.org/manual/lf-externs.html#rest-arguments-and-type-choices)


## Loading extern classes using "require" function

[source](https://haxe.org/manual/target-javascript-require.html)

> Modern JavaScript platforms, such as Node.js provide a way of loading objects from external modules using the "require" function. Haxe supports automatic generation of "require" statements for extern classes.


This feature can be enabled by specifying `@:jsRequire` metadata for the extern class. If our extern class represents a whole module, we pass a single argument to the `@:jsRequire` metadata specifying the name of the module to load:


`@:jsRequire`

> Generate javascript module require expression for given extern

In case our extern class represents an object within a module, second @:jsRequire argument specifies an object to load from a module:

```haxe
@:jsRequire("fs")
extern class FS {
  static function readFileSync(path:String, encoding:String):String;
}
```

will look in javascript like this

```js
var js_npm_FS = require("fs");
```


```haxe
@:jsRequire("http", "Server")
extern class HTTPServer {
  function new();
}
```

The second argument is a dotted-path, so we can load sub-objects in any hierarchy.

```js
var js_npm_HTTPServer = require("http").Server;
```

If we need to load custom JavaScript objects in runtime, a `js.Lib.require` function can be used. It takes String as its only argument and returns Dynamic, so it is advised to be assigned to a strictly typed variable.




## Using external JavaScript libraries

<https://haxe.org/manual/target-javascript-external-libraries.html>


The externs mechanism provides access to the native APIs in a type-safe manner. It assumes that the defined types exist at run-time but assumes nothing about how and where those types are defined.

An example of an extern class is the jQuery class of the Haxe Standard Library. To illustrate, here is a simplified version of this extern class:

```haxe
package js.jquery;
@:native("$") extern class JQuery {
  /**
    Creates DOM elements on the fly from the provided string of raw HTML.
    OR
    Accepts a string containing a CSS selector which is then used to match a set of elements.
    OR
    Binds a function to be executed when the DOM has finished loading.
  **/
  @:selfCall
  @:overload(function(element:js.html.Element):Void { })
  @:overload(function(selection:js.jquery.JQuery):Void { })
  @:overload(function(callback:haxe.Constraints.Function):Void { })
  @:overload(function(selector:String, ?context:haxe.extern.EitherType<js.html.Element, js.jquery.JQuery>):Void { })
  public function new():Void;

  /**
    Adds the specified class(es) to each element in the set of matched elements.
  **/
  @:overload(function(_function:Int -> String -> String):js.jquery.JQuery { })
  public function addClass(className:String):js.jquery.JQuery;

  /**
    Get the HTML contents of the first element in the set of matched elements.
    OR
    Set the HTML contents of each element in the set of matched elements.
  **/
  @:overload(function(htmlString:String):js.jquery.JQuery { })
  @:overload(function(_function:Int -> String -> String):js.jquery.JQuery { })
  public function html():String;
}
```
Note that functions can be overloaded to accept different types of arguments and return values, using the @:overload metadata. Function overloading works only in externs.

Using this extern, we can use jQuery like this:

```haxe
import js.jquery.*;
..
new JQuery("#my-div").addClass("brand-success").html("haxe is great!");
..
```

The package and class name of the extern class should be the same as defined in the external library. If that is not the case, rewrite the path of a class using @:native.

```
package my.application.media;

@:native('external.library.media.video')
extern class Video {
..
```

Some JavaScript libraries favor instantiating classes without using the `new` keyword. To prevent the Haxe compiler outputting the new keyword when using a class, we can attach a `@:selfCall` metadata to its constructor. For example, when we instantiate the `jQuery` extern class above, `new JQuery()` will be outputted as `$()` instead of `new $()`. The `@:selfCall` metadata can also be attached to a method. In this case, the method will be interpreted as a direct call to the object, illustrated as follows:

```haxe
extern class Functor {
  public function new():Void;
  @:selfCall function call():Void;
}

class Test {
  static function main() {
    var f = new Functor();
    f.call(); // will be outputted as `f();`
  }
}
```





Inserts a require expression that loads JavaScript object from a module or file specified in the module argument.

This is only supported in environments where require function is available, such as Node.js or RequireJS.





## @:selfCall


`@:selfCall` Translates method calls into calling object directly


Some JavaScript libraries favor instantiating classes without using the new keyword. To prevent the Haxe compiler outputting the new keyword when using a class, we can attach a `@:selfCall` metadata to its constructor. For example, when we instantiate the jQuery extern class above, `new JQuery()` will be outputted as `$()` instead of `new $()`.

The `@:selfCall` metadata can also be attached to a method. In this case, the method will be interpreted as a direct call to the object, illustrated as follows:

```
extern class Functor {
  public function new():Void;
  @:selfCall function call():Void;
}

class Test {
  static function main() {
    var f = new Functor();
    f.call(); // will be outputted as `f();`
  }
}
```




## constructor with return type

```
public static inline function construct(?fileName : String, ?options : {?autosave: Bool, ?async: Bool}) : LowDb {
  return untyped require('lowdb')(fileName, options);
}

public static inline function query(db : LowDb, collection : String) : LowDb {
  return untyped db(collection);
}
```


```
public static inline function construct(name : String) : DebugInstance
  return new DebugInstance(name);
```


```
var store = js.npm.ConnectMongo.construct( Session ,{ db : 'localhost' } );
```


```
public static inline function construct() : Request {
  untyped return require('request');
}
```


```
public inline function construct( ?doc : T ) : M {
  return untyped __new__(this,doc);
}
```


## example extern



```
package js.npm;

import haxe.extern.Rest;
import haxe.extern.EitherType;

/**
 * Source: http://myexternjs.com
 * MyExtern.js v1.12
 */

@:native('FOO.MyExtern')
@:jsRequire("http", "Server")
extern class MyFooExtern {
  function new ();
  // other clever stuff
}
```
