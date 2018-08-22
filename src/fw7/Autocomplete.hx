package fw7;

import fw7.Dom7;
import fw7.Framework7;

enum abstract AutocompletePosition(String) {
	var apPage = "page";
	var apPopup = "popup";
	var apDropdown = "dropdown";
}
typedef AutocompleteParams = {
	? openIn: AutocompletePosition,
	? source: Array<String>->(Array<Dynamic>->String)->Void,
	? limit: Int,
	? preloader: Bool,
	? preloaderColor: String,
	? value: Array<Dynamic>,
	? valueProperty: String,
	? textProperty: String,
	// Standalone Autocomplete Parameters
	? requestSourceOnOpen: Bool,
	? openerEl: Dom7Container,
	? popupCloseLinkText: String,
	? pageBackLinkText: String,
	? pageTitle: String,
	? searchbarPlaceholder: String,
	? searchbarDisableText: String,
	? notFoundText: String,
	? multiple: Bool,
	? closeOnSelect: Bool,
	? autoFocus: Bool,
	? animate: Bool,
	? navbarColorTheme: String,
	? formColorTheme: String,
	? routableModals: Bool,
	? url: String,
	? view: fw7.View,
	// Dropdown Autocomplete Parameters
	? inputEl: Dom7Container,
	? inputEvents: String,
	? highlightMatches: Bool,
	? typeahead: Bool,
	? dropdownPlaceholderText: String,
	? updateInputValueOnSelect: Bool,
	? expandInput: Bool,
	// Render functions
	? renderDropdown: Array<Dynamic>->String,
	? renderPage: Array<Dynamic>->String,
	? renderPopup: Array<Dynamic>->String,
	? renderItem: Array<Dynamic>->String,
	? renderSearchbar: Void->String,
	? renderNavbar: Void->String,
	? on: Dynamic,

}

extern class AutocompleteApp extends Framework7.Fw7ConstructorApp<AutocompleteParams,Autocomplete> {	
	public function open(el: Dom7Container): Autocomplete;
	public function close(el: Dom7Container): Autocomplete;
}


extern class Autocomplete extends Framework7.Fw7Destroyable<AutocompleteParams> {
	public var value(default, never): Array<Dynamic>;
	public var opened(default, never): Bool;
	public var openerEl(default, never): js.html.HtmlElement;
	@:native("$openerEl")
	public var dom7OpenerEl(default, never): Dom7;
	public var inputEl(default, never): js.html.HtmlElement;
	@:native("$inputEl")
	public var dom7InputEl(default, never): Dom7;
	public var dropdownEl(default, never): js.html.HtmlElement;
	@:native("$dropdownEl")
	public var dom7DropdownEl(default, never): Dom7;
	public var url(default, never): String;
	public var view(default, never): fw7.View;
	public var searchbar(default, never): fw7.SearchBar;

	public function open(): Void;
	public function close(): Void;
	public function preloaderShow(): Void;
	public function preloaderHide(): Void;
	
	
}