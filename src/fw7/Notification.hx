package fw7;

import fw7.Framework7;
import fw7.Dom7;
import fw7.View;

typedef NotificationParams = {
	? el: Dom7Container,
	? icon: String,
	? title: String,
	? titleRightText: String,
	? subtitle: String,
	? text: String,
	? closeButton: Bool,
	? closeTimeout: Float,
	? closeOnClick: Bool,
	? swipeToClose: Bool,
	? cssClass: String,
	? render: Void-> String,
	? on: Dynamic,
}

extern class NotificationApp extends Framework7.Fw7ConstructorApp<NotificationParams, Notification> {
	public function open(el: Dom7Container, ? animate: Bool): Notification;
	public function close(el: Dom7Container, ? animate: Bool): Notification;
}

extern class Notification extends Framework7.Fw7Destroyable<NotificationParams> {
	public function open(? animate: Bool): Void;
	public function close(? animate: Bool): Void;
}