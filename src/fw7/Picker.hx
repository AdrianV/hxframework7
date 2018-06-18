package fw7;

import fw7.Framework7;
import fw7.Dom7;
import fw7.Column;

enum abstract PickerPosition(String) {
	var ppAuto = "auto";
	var ppPopover = "popover";
	var ppSheet = "sheet";
}

typedef PickerParams = {
	? rotateEffect: Bool,
	? momentumRatio: Float,
	? updateValuesOnMomentum: Bool,
	? updateValuesOnTouchmove: Bool,
	? freeMode: Bool,
	? value: Array<String>,
	? formatValue: Array<String>->Array<String>->String,
	? cols: Array<ColumnParams<Picker>>,
	? multiple: Bool,
	
	? containerEl: fw7.Dom7.Dom7Container,
	? openIn: PickerPosition,
	? inputEl : fw7.Dom7.Dom7Container,
	? scrollToInput: Bool,
	? inputReadOnly: Bool,
	? convertToPopover: Bool,
	? cssClass: String,
	? closeByOutsideClick: Bool,
	? toolbar: Bool,
	? toolbarCloseText: String,
	? routableModals: Bool,
	? url: String,
	? view: fw7.View,
	? renderToolbar: Void->String,
	? render: Void->String,
	? on: Dynamic,
}

extern class PickerApp extends Framework7.Fw7ConstructorApp<PickerParams, Picker> {
	public function close(el:Dom7Container): Picker;
}


extern class Picker extends Framework7.Fw7Destroyable
{

	public var containerEl(default, null): js.html.Element;
	@:native("$containerEl")
	public var dom7ContainerEl(default, null): fw7.Dom7;
	public var inputEl(default, null): js.html.Element;
	@:native("$inputEl")
	public var dom7InputEl(default, null): fw7.Dom7;
	public var value(default, null): Array<String>;
	public var cols(default, null): Array<Column<Picker>>;
	public var opened(default, null): Bool;
	@:native("inline") public var inlined(default, null): Bool;
	public var url(default, null): String;
	public var view(default, null): fw7.View;
	public var params(default, null): PickerParams;
	//public var displayValue(default, null): Array<String>;
	
	public function setValue(values: Array<String>, duration: Float): Void;
	public function getValue(): Array<String>;
	public function addValue(value: String): Void;
	public function open(): Void;
	public function close(): Void;
}