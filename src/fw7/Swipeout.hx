package fw7;

import fw7.Framework7;
import fw7.Dom7;
import fw7.View;

enum abstract SwipeoutPosition(String) to String {
	var spLeft = "left";
	var spRight = "right";
}


extern class Swipeout {
	public var el(default, never): js.html.Element;
	public function open(el: Dom7Container, side: SwipeoutPosition, callback: Void->Void): js.html.Element;
	public function close(el: Dom7Container, callback: Void->Void): js.html.Element;
	public function delete(el: Dom7Container, callback: Void->Void): js.html.Element;
}

