// Generated by Haxe 4.0.2
(function ($global) { "use strict";
var HxOverrides = function() { };
HxOverrides.iter = function(a) {
	return { cur : 0, arr : a, hasNext : function() {
		return this.cur < this.arr.length;
	}, next : function() {
		return this.arr[this.cur++];
	}};
};
var MainAwait = function() {
	this.f1();
};
MainAwait.main = function() {
	var app = new MainAwait();
};
MainAwait.prototype = {
	resolveAfter2Seconds: function(x) {
		return new Promise(function(resolve,reject) {
			window.setTimeout(function() {
				resolve(x);
			},2000);
		});
	}
	,f1: function() {
		var _gthis = this;
		async function() {
			var x = (function($this) {
				var $r;
				var t = _gthis.resolveAfter2Seconds(10);
				$r = await t;
				return $r;
			}(this));
			window.console.log(x);
		}();
	}
};
var node_A = function() { };
node_A.wait = function(t) {
	return await t;
};
node_A.sync = function(f) {
	async f();
};
MainAwait.main();
})({});
