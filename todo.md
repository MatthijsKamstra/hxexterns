

## adjustments



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


