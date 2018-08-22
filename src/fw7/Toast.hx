package fw7;

import fw7.Framework7;
import fw7.Dom7;

enum abstract ToastPosition(String) {
	var tpBottom = "bottom";
	var tpCenter = "center";
	var tpTop = "top";
}

typedef ToastParams =  {
	? el: Dom7Container,
	? icon: String,
	? text: String,
	? position: ToastPosition,
	? closeButton: Bool,
	? closeButtonColor: String,
	? closeButtonText: String,
	? cssClass: String,
	? destroyOnClose: Bool,
	? render: Void->String,
	? on: Dynamic,
}

extern class ToastApp extends Framework7.Fw7ConstructorApp<ToastParams, Toast> {
	public function open(el: Dom7Container, animate: Bool): Actions;
	public function close(el: Dom7Container, animate: Bool): Actions;
}

extern class Toast extends Framework7.Fw7Destroyable<ToastParams> {
	public function open(? animate: Bool): Void;
	public function close(? animate: Bool): Void;

}