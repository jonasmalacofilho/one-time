class Test {

    static function main() {
        var timer = new AnotherTimer(2000);
        var count = 0;
        timer.run = function () {
            if (++count >= 3) timer.stop();
            trace('Ran $count times');
        }
        timer.start();
        // start again
        count = 0;
        timer.start();
        trace("Exiting...");
    }

}

