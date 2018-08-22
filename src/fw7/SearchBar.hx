package fw7;

import fw7.Framework7;
import fw7.Dom7;

typedef SearchBarParams = {
	? el: Dom7Container,
	? inputEl: Dom7Container,
	? disableButton: Bool,
	? disableButtonEl: Dom7Container,
	? searchContainer: Dom7Container,
	? searchIn: String,
	? searchItem: String,
	? foundEl: Dom7Container,
	? notFoudEl: Dom7Container,
	? hideOnEnableEl: Dom7Container,
	? hideOnSearchEl: Dom7Container,
	? backdrop: Bool,
	? backdropEl: Dom7Container,
	? ignore: String,
	? customSearch: Bool,
	? removeDiacritics: Bool,
	? hideDividers: Bool,
	? hideGroups: Bool,
	? on: Dynamic,
}

extern class SearchBarApp extends Framework7.Fw7ConstructorApp<SearchBarParams, SearchBar> {
	public function clear(el: Dom7Container): SearchBar;
	public function enable(el:Dom7Container): SearchBar;
	public function disable(el:Dom7Container): SearchBar;
	public function toggle(el:Dom7Container): SearchBar;
	public function search(el:Dom7Container, query: String): SearchBar;	
}

extern class SearchBar extends Framework7.Fw7Destroyable<SearchBarParams>
{
	public var query(default, never): String;
	public var previousQuery(default, never): String;
	public var searchContainer(default, never): js.html.Element;
	@:native("$searchContainer")
	public var dom7CearchContainer(default, never): fw7.Dom7;
	public var inputEl(default, never): js.html.Element;
	@:native("$inputEl")
	public var dom7InputEl(default, never): fw7.Dom7;
	public var enabled: Bool;
	public var expandable: Bool;
	public function search(query: String): Void;
	public function enable(): Void;
	public function disable(): Void;
	public function toggle(): Void;
	public function clear(): Void;	
}