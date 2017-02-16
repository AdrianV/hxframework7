package fw7;

/**
 * ...
 * @author 
 */

typedef TimePickerParams = {
	>fw7.Picker.PickerParams,
	? showDay: Bool,
	? initialDay: Date,
	? historyDays: Int,
	? futureDays: Int,
	? formatDay: String,
	? timeValue: Date,
}

@:forward(params,value,displayValue,opened,inlined,cols,container,setValue,open,close,destroy)
abstract TimePicker(fw7.Picker) from fw7.Picker to fw7.Picker
{
	//inline function new(p) this = p;
	
	static inline var msInADay = 1000 * 60 * 60 * 24;
	static inline var msInAHour = 1000 * 60 * 60;
	static inline function dateToDay(date: Date): Int 
		return Std.int(0.05 + (date.getTime() - date.getHours() * msInAHour) / msInADay);
	static inline function dateFromDay(day: Int): Date return Date.fromTime(day * msInADay);
	
	static function formatValue(picker: fw7.Picker, values: Array<Any>, displayValue: Array<String>): String {
		var params: TimePickerParams = cast picker.params;
		var off = params.showDay ? 1 : 0;
		var h: Int = values[off];
		var m: Int = values[off + 1];
		return (h < 10 ? '0$h:' : '$h:') + (m < 10 ? '0$m' : '$m');
	}
	
	static public function timePicker(app: fw7.Framework7, params: TimePickerParams): TimePicker {
		var par = Reflect.copy(params);
		par.cols = [];
		if (par.rotateEffect == null) par.rotateEffect = true;
		if (params.showDay) {
			var day = dateToDay(par.initialDay != null ? par.initialDay : 
				(par.timeValue != null) ? par.timeValue : Date.now());
			var dfrom = par.historyDays != null ? day - par.historyDays : day;
			var dto = par.futureDays != null ? day + 1 + par.futureDays : day + 1;
			var format = par.formatDay != null ? par.formatDay : "%m-%d";
			par.cols.push({
				values: [for (d in dfrom ... dto) d],
				displayValues:[for (d in dfrom ... dto) DateTools.format(dateFromDay(d), format)],
			});
		}
		par.cols.push({
			values: [for (h in 0 ... 24) h],
			displayValues: [for (h in 0 ... 24) h < 10 ? '0$h' : '$h'],
		});
		par.cols.push({
			values: [for (m in 0 ... 60) m],
			displayValues: [for (m in 0 ... 60) m < 10 ? '0$m' : '$m'],
		});
		par.formatValue = formatValue;
		if (par.timeValue != null) {
			par.value = [];
			if (par.showDay) {
				par.value.push(dateToDay(par.timeValue));
			}
			par.value.push(par.timeValue.getHours());
			par.value.push(par.timeValue.getMinutes());
		}
		return cast app.picker(par);
	}

	public function getValue(): String {
		return formatValue(this, this.value, this.displayValue);
	}
	
	public function getTimeValue(): Date {
		var params: TimePickerParams = cast this.params;
		var off = params.showDay ? 1 : 0;
		var h: Int = this.value[off];
		var m: Int = this.value[off + 1];
		return if (params.showDay) {
			var d = dateFromDay(this.value[0]);
			new Date(d.getFullYear(), d.getMonth(), d.getDate(), h, m, 0);
		} else
			Date.fromTime(DateTools.hours(h) + DateTools.minutes(m));
	}
	
	//public var params(get, never): TimePickerParams;
	//inline function get_params() return cast this.params;
	
}