
import js.npm.FS;

class TestFS {

  public function new() {
    var fs = FS.readFileSync('path.to', 'yes');
  }

  static public function main() {
    var app = new TestFS();
  }
}