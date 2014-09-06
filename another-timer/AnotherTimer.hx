@:publicFields
class AnotherTimer {

    var aux = new Lock();
    var timeout:Float;  // in seconds

    function new(time_ms:Int) {
        this.timeout = 1e-3*time_ms;
    }

    dynamic
    function run() {
        // trace("run");
    }

    function start() {
        loop();
    }

    function stop() {
        aux.release();
    }
    
    private
    function loop() {
        while (!aux.wait(timeout)) run();
    }

}

