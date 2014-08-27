@:build(SequenceSwitch.build())
class Test {

    static function main() {
        sequenceCrush(1);
    }

    static function sequenceCrush(step:Int) {
        switch (step) {
            case 1:
                trace("do one");
                sequenceCrush(++step);
            case $next:
                trace("do two");
                sequenceCrush(++step);
            case _:
                trace("terminate");
        }
    }

}

