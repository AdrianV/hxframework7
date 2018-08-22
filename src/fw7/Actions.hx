package fw7;

import fw7.Dom7;
import fw7.Framework7;

typedef ActionButton = {
	? text: String,
	? bold: Bool,
	? color: String,
	? bg: String,
	? label: Bool,
	? disabled: Bool,
	? icon: String,
	? onClick: Void->Void,
}

typedef ActionsParams = {
	? el: js.html.HtmlElement,
	? content: String,
	? backdrop: Bool,
	? closeByBackdropClick: Bool,
	? closeByOutsideClick: Bool,
	? animate: Bool,
	? buttons: Array<ActionButton>,
	? grid: Bool,
	? convertToPopover: Bool,
	? forceToPopover: Bool,
	? targetEl: Dom7Container,
	? targetX: Float,
	? targetY: Float,
	? targetWidth: Float,
	? targetHeight: Float,
	? onClick: ?Actions->?Any->Void,
	? render: Void->String,
	? renderPopover: Void->String,
	? on: Dynamic,

}
extern class ActionsApp extends Framework7.Fw7ConstructorApp<ActionsParams, Actions> {
	public function open(el: Dom7Container, animate: Bool): Actions;
	public function close(el: Dom7Container, animate: Bool): Actions;
}

extern class Actions extends Framework7.Fw7Destroyable<ActionsParams> {
	public var backdropEl(default, never): js.html.HtmlElement;
	@:native("$backdropEl")
	public var dom7BackdropEl(default, never): Dom7;

	public function open(animate: Bool): Void;
	public function close(animate: Bool): Void;

	
}