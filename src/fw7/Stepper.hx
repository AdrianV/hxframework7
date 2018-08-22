package fw7;
import fw7.Framework7;
import fw7.Dom7;

typedef StepperParams = {
	? el : fw7.Dom7.Dom7Container,
	? inputEl : fw7.Dom7.Dom7Container,
	? step: Float,
	? min: Float,
	? max: Float,
	? value: Float,
	? wraps: Bool,
	? autorepeat: Bool,
	? autorepeatDynamic: Bool,
	? valueEl: fw7.Dom7.Dom7Container,
	? formatValue: Float->String,
	? manualInputMode: Bool,
	? decimalPoint: Int,
	? buttonsEndInputMode: Bool,
	? on: Dynamic,
}

extern class StepperApp extends Fw7ConstructorApp<StepperParams, Stepper> {
	function getValue(el: Dom7Container): Float;
	function setValue(el: Dom7Container, value: Float): Stepper;
}

extern class Stepper extends Fw7Destroyable<StepperParams> {
	var value: Float;
	var intValue(get,set): Int;
		private inline function get_intValue(): Int return Std.int(value);
		private inline function set_intValue(v: Int): Int { value = v; return v; }
}