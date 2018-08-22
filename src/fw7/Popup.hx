package fw7;

import fw7.Framework7;
import fw7.Dom7;
import fw7.View;

typedef PopupParams = {
	? el: Dom7Container,
	? content: String,
	? backdrop: Bool,
	? closeByBackdropClick: Bool,
	? animate: Bool,
	? on: Dynamic,
}

extern class PopupApp extends Framework7.Fw7ConstructorApp<PopupParams, Popup> {
	public function open(el: Dom7Container, animate: Bool): Popup;
	public function close(el: Dom7Container, animate: Bool): Popup;
}

extern class Popup extends Framework7.Fw7Destroyable<PopupParams> {
	public var backdropEl(default, never): js.html.Element;
	@:native("$backdropEl")
	public var dom7BackdropEl(default, never): Dom7;

	public function open(animate: Bool): Void;
	public function close(animate: Bool): Void;
}