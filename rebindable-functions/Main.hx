import haxe.Timer.stamp;

class Main {

    function new(f) {
        rebindable = f;
        variable = f;
    }
    
    dynamic
    function rebindable() : Int {
        return 1;
    }

    var variable : Void -> Int;

    static function main() {
        var obj = new Main(someFunction);
        for (i in 0...10*MILLION) {
            someFunction();
            obj.variable();
            obj.rebindable();
        }
        var t0;
        t0 = stamp();
        for (i in 0...MILLION)
            obj.variable();
        trace(stamp() - t0);
        t0 = stamp();
        for (i in 0...MILLION)
            obj.rebindable();
        trace(stamp() - t0);
    }

    static function someFunction() {
        return 0;
    }

    inline
    static var MILLION = 1000000;

}

