package fw7;

import js.Syntax;
/**
 * ...
 * @author 
 */

typedef TimePickerParams = {
	>fw7.Picker.PickerParams,
	? showDay: Bool,
	? showTime: Bool,
	? initialDay: Date,
	? historyDays: Int,
	? futureDays: Int,
	? formatDay: String,
	? timeValue: Date,
}

@:forward(params,value,displayValue,opened,inlined,cols,container,setValue,open,close,destroy)
abstract TimePicker(fw7.Picker) from fw7.Picker to fw7.Picker
{
	inline function new(p) this = p;
		
	static function formatValue(picker: TimePicker, values: Array<String>, displayValue: Array<String>): String {
		//var picker: TimePicker = Syntax.code("this");
		var params: TimePickerParams = cast picker.params;
		var result = "";
		if ( params.showDay ) {
			var d: Date = Date.fromString(values[0]);
			result = DateTools.format(d, params.formatDay);
		}
		if (params.showTime) {
			var off = params.showDay ? 1 : 0;
			var h: Int = Std.parseInt(values[off]);
			var m: Int = Std.parseInt(values[off + 1]);
			if (result != "") result += " ";
			result += (h < 10 ? '0$h:' : '$h:') + (m < 10 ? '0$m' : '$m');
		} 
		return result;
	}
	
	static public function timePicker(app: fw7.Framework7, params: TimePickerParams): TimePicker {
		var par = Reflect.copy(params);
		if (par.showTime == null) par.showTime = true;
		par.cols = [];
		if (par.rotateEffect == null) par.rotateEffect = true;
		if (params.showDay) {
			var day = par.initialDay != null ? par.initialDay : 
				(par.timeValue != null) ? par.timeValue : Date.now();
			var dfrom = par.historyDays != null ? DateTools.delta(day, DateTools.days(-par.historyDays)) : day;
			var dto = DateTools.delta(day, DateTools.days(par.futureDays != null ? 1 + par.futureDays : 1));
			var format = par.formatDay != null ? par.formatDay : "%m-%d";
			var val = [];
			var d = dfrom;
			while (d.getTime() < dto.getTime()) {
				val.push(d);
				d = DateTools.delta(d, DateTools.days(1));
			}
			par.cols.push({
				values: val.map( function(d) return d.toString() ),
				displayValues: val.map( function(d) return DateTools.format(d, format)),
			});
		}
		if (par.showTime) {
			par.cols.push({
				values: [for (h in 0 ... 24) Std.string(h)],
				displayValues: [for (h in 0 ... 24) h < 10 ? '0$h' : '$h'],
			});
			par.cols.push({
				values: [for (m in 0 ... 60) Std.string(m)],
				displayValues: [for (m in 0 ... 60) m < 10 ? '0$m' : '$m'],
			});
		}
		par.formatValue = (p1, p2) -> formatValue(Syntax.code("this"), p1, p2);
		if (par.timeValue != null) {
			par.value = [];
			if (par.showDay) {
				par.value.push((par.timeValue != null ? par.timeValue : par.initialDay).toString());
			}
			par.value.push(Std.string(par.timeValue.getHours()));
			par.value.push(Std.string(par.timeValue.getMinutes()));
		}
		return new TimePicker(app.picker.create(par));
	}

	public function getValue(): String {
		return formatValue(this, this.value, this.displayValue);
	}
	
	public function getTimeValue(): Date {
		var params: TimePickerParams = cast this.params;
		var off = params.showDay ? 1 : 0;
		var h: Int = params.showTime ? Std.parseInt(this.value[off]) : 0;
		var m: Int = params.showTime ? Std.parseInt(this.value[off + 1]) : 0;
		return if (params.showDay) {
			var d: Date = Date.fromString(this.value[0]);
			new Date(d.getFullYear(), d.getMonth(), d.getDate(), h, m, 0);
		} else
			Date.fromTime(DateTools.hours(h) + DateTools.minutes(m));
	}
	
	//public var params(get, never): TimePickerParams;
	//inline function get_params() return cast this.params;
	
}