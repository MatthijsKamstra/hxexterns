import js.npm.*;

class TestMyJSClass {
	public function new() {
		var myExtern = new MyJSClassExtern();
		myExtern.myFunc('foo');

		trace(myExtern.myProp);

		MyJSClassExtern.SOME_PROP = 100;
		MyJSClassExtern.someFunc();
	}

	static public function main() {
		var app = new TestMyJSClass();
	}
}