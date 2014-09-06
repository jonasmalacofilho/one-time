#if neko
import neko.vm.Thread;
#elseif cpp
import cpp.vm.Thread;
#end

class Mark {

    static function main() {
        TimerCallback.main();
    }
}

class TimerCallback {
    private static inline var CHAR_SPACE : Int = 32;

    public static function main() : Void {
        var myME = new TimerTicker();

        function stopWhen() {
            while (Sys.getChar(false) != CHAR_SPACE) {
                //loop until [space] detected, do nothing here
            }
            myME.stop();
        }

        Thread.create(stopWhen);
        myME.start();
    }

}

class TimerTicker {
    private var myTimer : AnotherTimer = null;

    public function new() {
        myTimer = new AnotherTimer(20);
        myTimer.run = timer_OnTick;
    }
    
    public function start() {
        myTimer.start();
    }

    public function stop() {
        myTimer.stop();
    }

    private function timer_OnTick() : Void {
        Sys.print("foobar\n\r");  // \n\r instead of println is a workaround
                                  // for a bug in the Sys.getChar version I
                                  // have (some recent git)
    }
}

