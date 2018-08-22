package fw7;


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

enum abstract CalendarPosition(String) {
	var cpAuto = "auto";
	var cpPopover = "popover";
	var cpSheet = "sheet";
	var cpCustomModal = "customModal";
}

typedef CalendarParams = {
	? value: Array<DateValue>,
	? disabled: DateRange,
	? events: DateRange,
	? rangesClasses: Array<{cssClass: String, range: DateRange}>,
	? formatValue: Dynamic->Array<DateValue>->String,
	? monthNames: Array<String>,
	? monthNamesShort: Array<String>,
	? dayNames: Array<String>,
	? dayNamesShort: Array<String>,
	? firstDay: Int,
	? weekendDays: Array<Int>,
	? dateFormat: String,
	? multiple: Bool,
	? rangePicker: Bool,
	? direction: String,
	? minDate: Date,
	? maxDate: Date,
	? touchMove: Bool,
	? animate: Bool,
	? closeOnSelect: Bool,
	? weekHeader: Bool,
	? monthSelector: Bool,
	? yearSelector: Bool,
	// Container/opener-specific parameters
	? containerEl: Dom7Container,
	? openIn: CalendarPosition,
	? inputEl: Dom7Container,
	? scrollToInput: Bool,
	? inputReadOnly: Bool,
	? cssClass: String,
	? closeByOutsideClick: Bool,
	? toolbar: Bool,
	? toolbarCloseText: String,	
	? header: Bool,
	? headerPlaceholder: String,
	? routableModals: Bool,
	? url: String,
	? view: fw7.View,
	? renderWeekHeader: Void->String,
	? renderMonths: Date->String,
	? renderMonth: Date->Int->String,
	? renderMonthSelector: Void->String,
	? renderYearSelector: Void->String,
	? renderHeader: Void->String,
	? renderToolbar: Void->String,
	? render: Void->String,
	? on: Dynamic,
}

extern class CalendarApp extends Framework7.Fw7ConstructorApp<CalendarParams,Calendar> {	
	public function close(el: Dom7Container): Calendar;
}

extern class Calendar extends Framework7.Fw7Destroyable<CalendarParams>
{
	public var containerEl(default, never): js.html.HtmlElement;
	@:native("$containerEl")
	public var dom7ContainerEl(default, never): Dom7;
	public var inputEl(default, never): js.html.HtmlElement;
	@:native("$inputEl")
	public var dom7InputEl(default, never): Dom7;
	public var value(default, never): Array<DateValue>;
	public var opened(default, never): Bool;
	@:native("inline") public var inlined(default, null): Bool;
	public var cols(default, never): Array<Column<Calendar>>;
	public var url(default, never): String;
	public var view(default, never): fw7.View;
	
	public function setValue(values: Array<DateValue>): Void;
	public function getValue(): DateValue;
	public function addValue(value: DateValue): Void;
	public function update(): Void;
	public function nextMonth(duration: Float): Void;
	public function prevMonth(duration: Float): Void;
	public function nextYear(?duration: Float): Void;
	public function prevYear(?duration: Float): Void;
	public function setYearMonth(year: Int, month: Int, duration: Float): Void;
	public function open(): Void;
	public function close(): Void;
}