import Lambda.iter;

class KmlArea {
    
    static function main() {
        var kml = Xml.parse(Sys.stdin().readAll().toString());
        bfs(kml, list);
    }
    
    static function bfs(begin : Xml, f : Xml -> Void) {
        var fifo = new List();
        fifo.add(begin);
        while (fifo.length > 0) {
            var node = fifo.pop();
            for (child in node)
                switch (child.nodeType) {
                case Xml.Element:
                    fifo.add(child);
                default:
                    // noop
                }
            f(node);
        } 
    }

    static function list(node : Xml) {
        switch (node.nodeType) {
        case Xml.Element:
            trace('${node.nodeType}: ${node.nodeName}');
            if (node.nodeName == "name")
                trace('name = ${node.firstChild().nodeValue}');
        default:
            // noop
        }
    }

}

