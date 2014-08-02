import Xml;

class KmlArea {
    
    static function main() {
        var kml = Xml.parse(Sys.stdin().readAll().toString());
        process(kml);
    }

    static function process(kml : Xml) {
        for (child in kml) {
            //trace(child.nodeType);
            switch (child.nodeType) {
            case Xml.Element, Xml.Document:
                trace('${child.nodeType}: ${child.nodeName}');
                process(child);
            default:
                trace('${child.nodeType}: $child$$');
            }
        }
    }

}

