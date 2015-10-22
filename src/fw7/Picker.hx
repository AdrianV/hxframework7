package fw7;

/**
 * ...
 * @author 
 */

import fw7.Framework7;
import fw7.Column;

typedef PickerParams = {
	? container: fw7.Framework7.Dom7Container,
	? input : fw7.Framework7.Dom7Container,
	? scrollToInput: Bool,
	? inputReadOnly: Bool,
	? convertToPopover: Bool,
	? onlyOnPopover: Bool,
	? cssClass: String,
	? toolbar: Bool,
	? toolbarCloseText: String,
	? toolbarTemplate: String,
	? rotateEffect: Bool,
	? momentumRatio: Float,
	? updateValuesOnMomentum: Bool,
	? updateValuesOnTouchmove: Bool,
	? value: Array<Dynamic>,
	? formatValue: Dynamic->Array<Dynamic>->Array<String>->Void,
	? cols: Array<ColumnParams<Picker>>,
	? onChange: Picker->Array<Dynamic>->Array<String>->Void,
	? onOpen: Picker->Void,
	? onClose: Picker->Void,
}



extern class Picker
{

	public var params(default, null): PickerParams;
	public var value(default, null): Array<Dynamic>;
	public var displayValue(default, null): Array<String>;
	public var opened(default, null): Bool;
	@:native("inline") public var inlined(default, null): Bool;
	public var cols(default, null): Array<Column<Picker>>;
	public var container(default, null): fw7.Dom7;
	
	public function setValue(values: Array<Dynamic>, duration: Float): Void;
	public function open(): Void;
	public function close(): Void;
	public function destroy(): Void;
}