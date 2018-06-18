package fw7;

import fw7.Framework7;
import fw7.Dom7;
import fw7.View;

typedef PopoverParams = {
	? el: Dom7Container,
	? content: String,
	? backdrop: Bool,
	? closeByBackdropClick: Bool,
	? closeByOutsideClick: Bool,
	? animate: Bool,
	? targetEl: Dom7Container,
	? targetX: Float,
	? targetY: Float,
	? targetWidth: Float,
	? targetHeight: Float,
	? on: Dynamic,
}

extern class PopoverApp extends Framework7.Fw7ConstructorApp<PopoverParams, Popover> {
	public function open(el: Dom7Container, targetEl: Dom7Container, animate: Bool): Popover;
	public function close(el: Dom7Container, animate: Bool): Popover;
}

extern class Popover extends Framework7.Fw7Destroyable {
	public var backdropEl(default, never): js.html.Element;
	@:native("$backdropEl")
	public var dom7BackdropEl(default, never): Dom7;
	public var targetEl(default, never): js.html.Element;
	@:native("$targetEl")
	public var dom7TargetEl(default, never): Dom7;
	public var params(default, never): PopoverParams;

	public function open(?targetEl: Dom7Container, animate: Bool): Void;
	public function close(animate: Bool): Void;
}