package fw7;

import fw7.Framework7;
import fw7.Dom7;
import fw7.View;

typedef DialogButtons = {
	text: String, 
	? bold: Bool,
	? color: String,
	? close: Bool,
	? cssClass: String,
	? keyCodes: Array<Int>,
	? onClick: Dialog->Dynamic->Void,
}

typedef DialogParams = {
	? el: Dom7Container,
	? backdrop: Bool,
	? closeByBackdropClick: Bool,
	? animate: Bool,
	? title: String,
	? text: String,
	? content: String,
	? buttons: Array<DialogButtons>,
	? verticalButtons: Bool,
	? destroyOnClose: Bool,
	? onClick: Dialog->Int->Void,
	? cssClass: String,
	? on: Dynamic,
}

extern class DialogApp extends Framework7.Fw7ConstructorApp<DialogParams, Dialog> {
	public function open(el: Dom7Container, animate: Bool): Dialog;
	public function close(el: Dom7Container, animate: Bool): Dialog;
	public function alert(text: String, ? title: String, ? callback: Void->Void): Dialog;
	public function confirm(text: String, ? title: String, callbackOk: Void->Void, callbackCancel: Void->Void): Dialog;
	public function prompt(text: String, ? title: String, callbackOk: Void->Void, callbackCancel: Void->Void): Dialog;
	public function login(text: String, ? title: String, callbackOk: Void->Void, callbackCancel: Void->Void): Dialog;
	public function password(text: String, ? title: String, callbackOk: Void->Void, callbackCancel: Void->Void): Dialog;
	public function preloader(text: String): Dialog;
	public function progress(text: String, progress: Float, color: String): Dialog;

}

extern class Dialog extends Framework7.Fw7Destroyable<DialogParams> {
	public var backdropEl(default, never): js.html.Element;
	@:native("$backdropEl")
	public var dom7BackdropEl(default, never): Dom7;

	public function open(animate: Bool): Void;
	public function close(animate: Bool): Void;
	public function setProgress(progress: Float, duration: Float): Void;
	public function setTitle(title: String): Void;
	public function setText(text: String): Void;

}