package fw7;

/**
 * ...
 * @author 
 */

import fw7.Dom7; 
import fw7.Framework7;
import fw7.Column;

typedef DateRangeArray = Array<Date>;
typedef DateRangeFunction = Date-> Bool;
typedef DateRangeObject = {
	? from: Date,
	? to: Date,
}

typedef DateRange = haxe.extern.EitherType<haxe.extern.EitherType<DateRangeArray,DateRangeFunction>,DateRangeObject>;

typedef CalendarParams = {
	? container: Dom7Container,
	? input: Dom7Container,
	? scrollToInput: Bool,
	? inputReadOnly: Bool,
	? convertToPopover: Bool,
	? onlyOnPopover: Bool,
	? cssClass: String,
	? toolbar: Bool,
	? toolbarCloseText: String,
	? toolbarTemplate: String,
	? value: Array<DateValue>,
	? disabled: DateRange,
	? events: DateRange,
	? rangesClasses: Array<{cssClass: String, range: DateRange}>,
	? formatValue: Dynamic->Array<DateValue>->String,
	? monthNames: Array<String>,
	? monthNamesShort: Array<String>,
	? dayNames: Array<String>,
	? dayNamesShort: Array<String>,
	? updateValuesOnTouchmove: Bool,
	? firstDay: Int,
	? weekendDays: Array<Int>,
	? dateFormat: String,
	? multiple: Bool,
	? direction: String,
	? minDate: Date,
	? maxDate: Date,
	? touchmove: Bool,
	? animate: Bool,
	? closeOnSelect: Bool,
	? weekHeader: Bool,
	? monthPicker: Bool,
	? monthPickerTemplate: String,
	? yearPicker: Bool,
	? yearPickerTemplate: String,
	? onChange: Calendar->Array<DateValue>->Array<String> ->Void,
	? onMonthAdd: Calendar->Dom7Container->Void,
	? onDayClick: Calendar->Dom7Container->Int->Int->Int->Void,
	? onMonthYearChangeStart: Calendar->Int->Int->Void,
	? onMonthYearChangeEnd: Calendar->Int->Int->Void,
	? onOpen: Calendar->Void,
	? onClose: Calendar->Void,
}
 
extern class Calendar
{
	public var params(default, null): CalendarParams;
	public var value(default, null): Array<DateValue>;
	public var opened(default, null): Bool;
	@:native("inline") public var inlined(default, null): Bool;
	public var cols(default, null): Array<Column<Calendar>>;
	public var container(default, null): fw7.Dom7;
	
	public function setValue(values: Array<DateValue>): Void;
	public function nextMonth(duration: Float): Void;
	public function prevMonth(duration: Float): Void;
	public function nextYear(?duration: Float): Void;
	public function prevYear(?duration: Float): Void;
	public function setYearMonth(year: Int, month: Int, duration: Float): Void;
	public function open(): Void;
	public function close(): Void;
	public function destroy(): Void;
	
	
}