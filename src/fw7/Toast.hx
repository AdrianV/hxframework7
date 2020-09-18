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
	? closeTimeout: Float,
	? closeButton: Bool,
	? closeButtonColor: String,
	? closeButtonText: String,
	? cssClass: String,
	? destroyOnClose: Bool,
	? render: Void->String,
	? on: Dynamic,
}

extern class ToastApp extends Framework7.Fw7ConstructorApp<ToastParams, Toast> {
	public function open(el: Dom7Container, animate: Bool): Toast;
	public function close(el: Dom7Container, animate: Bool): Toast;
}

extern class Toast extends Framework7.Fw7Destroyable<ToastParams> {
	public function open(? animate: Bool): Toast;
	public function close(? animate: Bool): Toast;

}