import js.Promise;
import haxe.Http;

import node.A;

import js.Browser.*;



class MainAwait {

	function new (){
		// init();
		f1();
	}

	// function init (){
	// 	A.sync(function():Void { //async func
	// 		var result:Dynamic = A.wait(null); // task
	// 		trace(result);
	// 	});

	// }


	function resolveAfter2Seconds(x) {
		return new Promise(function (resolve, reject) {
			window.setTimeout(function () {
				resolve(x);
			}, 2000);
		});
	}


	function f1() {
		A.sync(function ():Void{
			var x = A.wait (resolveAfter2Seconds(10));
			console.log(x); // 10
		});
	}


	static public function main() {
		var app = new MainAwait();
	}

}