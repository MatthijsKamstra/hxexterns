package node;

import js.Promise;
import haxe.Http;

class A {


    // A.wait()
    public static inline function wait<M, T:Promise<M>>(t:T):M {
        return untyped __js__("await {0}", t);
    }

    // A.sync()
    public static inline function sync(f:Void->Void):Void {
        untyped __js__("async {0}", f)();
    }
}