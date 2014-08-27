import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.ExprTools;

class SequenceSwitch {

    public
    macro static function build():Array<Field> {
        var fields = Context.getBuildFields();
        for (f in fields)
            switch (f.kind) {
                case FFun(func) if (func.expr != null):
                    func.expr = ExprTools.map(func.expr, transf);
                case _:
            }
        return fields;
    }

    static function transf(e:Expr):Expr {
        return switch (e.expr) {
            case ESwitch(expr, cases, def):
                var ncases = [];
                var prev:Array<Expr> = null;
                for (c in cases) {
                    var cur = switch (c.values) {
                        case [{ expr : EConst(CIdent("$next")), pos : pos }] if (prev != null):
                            switch (prev) {
                                case [{ expr : EConst(CInt(i)) }]:
                                    var next = { expr : EConst(CInt(Std.string(Std.parseInt(i) + 1))), pos : pos };
                                    { values : [next], guard : c.guard, expr : c.expr };
                                case _:
                                    c;
                            }
                        case _:
                            c;
                    };
                    ncases.push(cur);
                    prev = cur.values;
                }
                { expr : ESwitch(expr, ncases, def), pos : e.pos };
            case _:
                e;
        }
    }

}

