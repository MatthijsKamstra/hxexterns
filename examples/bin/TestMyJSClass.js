// Generated by Haxe 3.4.4
(function () { "use strict";
var TestMyJSClass = function() {
	var myExtern = new MyJSClass();
	myExtern.myFunc("foo");
	console.log(myExtern.myProp);
	MyJSClass.SOME_PROP = 100;
	MyJSClass.someFunc();
};
TestMyJSClass.main = function() {
	var app = new TestMyJSClass();
};
TestMyJSClass.main();
})();
