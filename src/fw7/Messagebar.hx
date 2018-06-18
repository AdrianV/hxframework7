package fw7;

import fw7.Framework7;
import fw7.Dom7;

typedef MessagebarParams = {
	? el: Dom7Container,
	? textareaEl: Dom7Container,
	? maxHeight: Float,
	? attachments: Array<String>,
	? resizePage: Bool,
	? on: Dynamic,
	? renderAttachments: Array<String>->String,
	? renderAttachment: String->String,
}

extern class MessagebarApp extends Framework7.Fw7ConstructorApp<MessagebarParams, Messagebar> {
}

extern class Messagebar extends Framework7.Fw7Destroyable
{

	public var params(default, never): MessagebarParams;
	public var textareaEl(default, never): fw7.Dom7;
	public var dom7TextareaEl(default, never): fw7.Dom7;
	public var attachments: Array<String>;
	
	public function getValue(): String;
	public function setValue(value: String): Void;
	public function clear(): Void;
	public function focus(): Void;
	public function blur(): Void;
	public function setPlaceholder(placeholder: String): Void;
	public function attachmentsCreate(): Void;
	public function attachmentsShow(): Void;
	public function attachmentsHide(): Void;
	public function attachmentsToggle(): Void;
	public function renderAttachments(): Void;
	public function sheetCreate(): Void;
	public function sheetShow(): Void;
	public function sheetHide(): Void;
	public function sheetToggle(): Void;
	
}