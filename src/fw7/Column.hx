package fw7;

/**
 * ...
 * @author 
 */

typedef ColumnParams<T> = {
	? values: Array<Dynamic>,
	? displayValues: Array<String>,
	? cssClass: String,
	? textAlign: String,
	? width: Int,
	? divider: Bool,
	? content: String,
	? onChange: T->Dynamic->String->Void,
}
 
extern class Column<T> {
	public var container(default, null): Dom7;
	public var items(default, null): Dom7;
	public var value(default, null): Dynamic;
	public var displayValue(default, null): String;
	public var activeIndex(default, null): Int;
	
	public function setValue(value: Dynamic, duration: Float): Void;
	
	@:overload(function(values: Array<String>): Void {})
	public function replaceValues(values: Array<Dynamic>, displayValues: Array<String>): Void;
	
}
