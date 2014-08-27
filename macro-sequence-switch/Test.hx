@:build(SequenceSwitch.build())
class Test {

    static function main() {
        trace("with macros");
        sequenceCrush(1);
        trace("with guards");
        sequenceCrush_guards(1);
    }

    static function sequenceCrush(step:Int) {
        switch (step) {
            case 1:
                trace("do one");
                sequenceCrush(++step);
            case $next:
                trace("do two");
                sequenceCrush(++step);
            case $next:
                trace("do three");
                sequenceCrush(++step);
            case _:
                trace("terminate");
        }
    }

    static function sequenceCrush_guards(step:Int) {
        var st = 1;
        switch (step) {
            case next if (next == st++):
                trace("do one");
                sequenceCrush_guards(++step);
            case next if (next == st++):
                trace("do two");
                sequenceCrush_guards(++step);
            case next if (next == st++):
                trace("do three");
                sequenceCrush_guards(++step);
            case _:
                trace("terminate");
        }
    }

}

