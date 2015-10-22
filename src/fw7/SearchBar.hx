package fw7;

/**
 * ...
 * @author 
 */

typedef SearchBarParams = {
	? searchList: haxe.extern.EitherType<String, js.html.HtmlElement>,
	? searchIn: haxe.extern.EitherType<String, js.html.HtmlElement>,
	? found: haxe.extern.EitherType<String, js.html.HtmlElement>,
	? notFoud: haxe.extern.EitherType<String, js.html.HtmlElement>,
	? overlay: haxe.extern.EitherType<String, js.html.HtmlElement>,
	? ignore: String,
	? customSearch: Bool,
	? removeDiacritics: Bool,
	? hideDividers: Bool,
	? hideGroups: Bool,
	? onSearch: Dynamic->Void,
	? onEnable: Dynamic->Void,
	? onDisable: Dynamic->Void,
	? onClear: Dynamic->Void,
}

extern class SearchBar
{
	public var params(default, null): SearchBarParams;
	public var query: String;
	public var searchList: fw7.Dom7;
	public var container: fw7.Dom7;
	public var input: fw7.Dom7;
	public var active: Bool;
	public function search(query: String): Void;
	public function enable(): Void;
	public function disable(): Void;
	public function clear(): Void;
	public function destroy(): Void;
	
}