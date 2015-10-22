package fw7;

/**
 * ...
 * @author 
 */

abstract DateValue(Float) {
	public inline function new(val: Float) this = val;
	@:from public static inline function fromDate(v: Date): DateValue { return new DateValue(v.getTime()); }
	//@:from public static inline function fromTime(v: Float): DateValue { return new DateValue(v); }
	@:to public inline function toDate(): Date return Date.fromTime(this);
}
 
