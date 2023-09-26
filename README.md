# hxexterns

![](icon.png)

WIP, as is everything is on the internet...

**my personal set of JavaScript externs**

## What is in this included

- js
  - chartjs
  - codemirror
  - dat
    - gui
  - firebase
  - html
  - node
    - mongodb
    - mongoose
  - npm
    - castv2client
    * [Airtable](https://www.npmjs.com/package/airtable) <https://github.com/airtable/airtable.js>
    * Cheerio
    * Gpio (onoff)
    * NeDB
    * NodeJsonDB
    * SlackClient
    * Spotify
    * WebSocket
    * Slack
    * YoutubeDownloader
    * YoutubeNode
  - typeform
  * Croppie
  * PDFDocument
  * QRCode
  * SVGtoPDF
  * Tabletop
  * TwitterFetcher

---

Stole <https://github.com/wiggin77/HxMongoNode/blob/master/src/js/node/mongoose/Mongoose.hx>

## how

I usually go for the easy solution, but **sometimes** I try to create a complete set of externs.

I try to make the transpiled js look similar to the "normal" way javascript works.

Repo folder structure

```
+ bin (Haxe transpile folder, should look like normal js)
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

What is the best way to start with Haxe Externs: read this [tutorial](howto.md)

## Haxelib

**Use this at your own risk!**

Most of it is #WIP

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

## misc

<https://github.com/fivdi/onoff#api>

> GPIO access and interrupt detection with Node.js on Linux boards like the Raspberry Pi, C.H.I.P. or BeagleBone.
> v1.1.8

```
npm install onoff
```

---

<https://github.com/Belphemur/node-json-db>

> A simple "database" that use JSON file for Node.JS.

```
npm install node-json-db --save
```

---
