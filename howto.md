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




```
import haxe.extern.Rest;
import haxe.extern.EitherType;

extern class MyExtern {
  static function f1(s:String, r:Rest<Int>):Void;
  static function f2(e:EitherType<Int, String>):Void;
}
```


## Require



<https://haxe.org/manual/target-javascript-require.html>



@:jsRequire
Generate javascript module require expression for given extern
js

```
@:jsRequire("fs")
extern class FS {
  static function readFileSync(path:String, encoding:String):String;
}
```




<https://haxe.org/manual/target-javascript-external-libraries.html>

```
@:native("$")
extern class JQuery {
```


## @:selfCall


`@:selfCall` Translates method calls into calling object directly


Some JavaScript libraries favor instantiating classes without using the new keyword. To prevent the Haxe compiler outputting the new keyword when using a class, we can attach a `@:selfCall` metadata to its constructor. For example, when we instantiate the jQuery extern class above, `new JQuery()` will be outputted as `$()` instead of `new $()`. The `@:selfCall` metadata can also be attached to a method. In this case, the method will be interpreted as a direct call to the object, illustrated as follows:

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

-----



It's not always possible to have the exact same calls in Haxe externs like you have in javascript/node.js.

<http://matthijskamstra.github.io/haxenode/03lowdb/example.html>

Lowdb is a good example:


this is the default code in js/node.js


```js
var low = require('lowdb')
var db = low('db.json')

db('posts').push({ title: 'lowdb is awesome'})

```


Look at this externs <https://github.com/clemos/haxe-js-kit/blob/develop/js/npm/LowDb.hx>

```
var db = low('db.json')
// translates in Haxe externs to
var db = LowDb.construct('db.json');
```



Normally you start with an constructor call in Haxe:

```
var db = new LowDb('db.json');
```

but a constructor in Haxe can't have a return type

It's not a rule to do it like this, but it's the only way to do this

```
var db = LowDb.construct('db.json');
```

another solution could have been:

```
var db = LobDb.low('db.json');
```


```haxe
	public static inline function construct(?fileName : String, ?options : {?autosave: Bool, ?async: Bool}) : LowDb {
		return untyped require('lowdb')(fileName, options);
	}
```



and

```
db('posts').push({ title: 'lowdb is awesome'})
// translates in Haxe externs to
LowDb.query(db, 'posts').push({title:'lowdb is awesome'});
```

and

```
db('posts').find({ title: 'lowdb is awesome' })
// translates in Haxe externs to
LowDb.query(db, 'posts').find({ title: 'lowdb is awesome' });
```




```
@:native("PIXI")
extern class Pixi
```
