# hxexterns


![](icon.png)

WIP, as is everything on the internet...

my personal set of js externs


I usually do the easy solution, but sometimes I try to create a complete set.

Usually try to see if the transpiled js look simular to the "normal" export.

Repo folder structure

```
+ bin (Haxe transpile folder, should look like js)
+ examples (test files for [howto.md](howto.md) )
+ src (folder for the externs)
	+ js (javascript)
		+ npm (via npm installed js)
		+ ....
	+ node (not sure)
	+ php (old folder with php externs)
+ test (folder with Haxe test files -> bin)
```


## Haxe Externs

What is the best way to start with this: read this [tutorial](howto.md)



## Haxelib

__Use this at your own risk!__


Use this git directly

```bash
haxelib git hxexterns https://github.com/MatthijsKamstra/hxexterns.git
```

You can use this git repos as a development directory:

```bash
haxelib dev hxexterns path/to/folder
```

don't forget to add it to your build file

```bash
-lib hxexterns
```