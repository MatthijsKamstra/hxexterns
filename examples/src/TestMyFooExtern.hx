import js.npm.*;

class TestMyFooExtern {
	public function new() {
		var myExtern = new MyFooExtern();
	}

	static public function main() {
		var app = new TestMyFooExtern();
	}
}