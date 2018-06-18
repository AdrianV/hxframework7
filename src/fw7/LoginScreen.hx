package fw7;

import fw7.Framework7;
import fw7.Dom7;
import fw7.View;

typedef LoginScreenParams = {
	? el: Dom7Container,
	? content: String,
	? animate: Bool,
	? on: Dynamic,
}

extern class LoginScreenApp extends Framework7.Fw7ConstructorApp<LoginScreenParams, LoginScreen> {
	public function open(el: Dom7Container, animate: Bool): LoginScreen;
	public function close(el: Dom7Container, animate: Bool): LoginScreen;
}

extern class LoginScreen extends Framework7.Fw7Destroyable {
	public var params(default, never): LoginScreenParams;

	public function open(animate: Bool): Void;
	public function close(animate: Bool): Void;
}