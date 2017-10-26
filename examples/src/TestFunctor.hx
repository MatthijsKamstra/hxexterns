class TestFunctor {

  public function new() {
    var f = new js.npm.Functor();
    f.call(); // will be outputted as `f();`
  }

  static public function main() {
    var app = new TestFunctor();
  }
}