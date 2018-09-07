// Generated by Haxe 3.4.7
if (process.version < "v04.0.0") console.warn("Module " + (typeof(module) == "undefined" ? "" : module.filename) + " requires node.js version 4.0.0 or higher");
(function () { "use strict";
var MainNodeJsonDB = function() {
	this.init0();
	this.init1();
	this.init2();
};
MainNodeJsonDB.main = function() {
	var app = new MainNodeJsonDB();
};
MainNodeJsonDB.prototype = {
	init0: function() {
		var db = new JsonDB("myDataBase",true,false);
		db.push("/test1","super test");
		db.push("/test2/my/test",5);
		db.push("/test3",{ test : "test", json : { test : ["test"]}});
		db.push("/test3",{ "new" : "cool", json : { important : 5}},false);
		db.push("/test2/my/test/",10,false);
		var data = db.getData("/");
		var data1 = db.getData("/test1");
		try {
			var data2 = db.getData("/test1/test/dont/work");
		} catch( error ) {
			console.error(error);
		}
		db["delete"]("/test1");
		db.save();
		db.reload();
	}
	,init1: function() {
		var db = new JsonDB("myDataBase",true,false);
		db.push("/arraytest/myarray[0]",{ obj : "test"},true);
		var testString = db.getData("/arraytest/myarray[0]/obj");
		db["delete"]("/arraytest/myarray[0]");
	}
	,init2: function() {
		var db = new JsonDB("myDataBase",true,false);
		db.push("/arraytest/myarray[]",{ obj : "test"},true);
		db.push("/arraytest/myarray[]/myTest","test",true);
	}
	,init3: function() {
		var db = new JsonDB("myDataBase",true,false);
		db.push("/arraytest/lastItemArray",[1,2,3],true);
		db.getData("/arraytest/lastItemArray[-1]");
		db["delete"]("/arraytest/lastItemArray[-1]");
		db.getData("/arraytest/lastItemArray[-1]");
	}
};
var haxe_io_Bytes = function(data) {
	this.length = data.byteLength;
	this.b = new Uint8Array(data);
	this.b.bufferValue = data;
	data.hxBytes = this;
	data.bytes = this.b;
};
var js_node_buffer_Buffer = require("buffer").Buffer;
var JsonDB = require("node-json-db");
MainNodeJsonDB.main();
})();
