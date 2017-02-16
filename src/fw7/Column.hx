package fw7;

/**
 * ...
 * @author 
 */

typedef ColumnParams<T> = {
	? values: Array<Any>,
	? displayValues: Array<String>,
	? cssClass: String,
	? textAlign: String,
	? width: Int,
	? divider: Bool,
	? content: String,
	? onChange: T->Any->String->Void,
}
 
extern class Column<T> {
	public var container(default, null): Dom7;
	public var items(default, null): Dom7;
	public var value(default, null): Any;
	public var displayValue(default, null): String;
	public var activeIndex(default, null): Int;
	
	public function setValue(value: Any, duration: Float): Void;
	
	@:overload(function(values: Array<String>): Void {})
	public function replaceValues(values: Array<Any>, displayValues: Array<String>): Void;
	
}
