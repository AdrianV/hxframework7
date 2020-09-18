package fw7;

import js.Browser;
import fw7.Dom7Helper.D;
import fw7.Page.PageEvents;

typedef MainApp = {
	var myApp(get, null): fw7.Framework7;	
	var mainView(get, null): fw7.View;
}

@:nullSafety
@page("") 
class CustomPage<T: MainApp>
{

	final _app: T;
	final _myApp: fw7.Framework7;
	var _isInitialized = false;

	public var app(get, never): T;
		inline function get_app() return _app;

	@:nullSafety(Off) var _page: fw7.Page;
	public var pageName(get, never): String;
		inline function get_pageName() {
			final result = haxe.rtti.Meta.getType(@:nullSafety(Off) Type.getClass(this)).page[0];
			return result != null ? result : "";
		}
	public var pageSelector(get, never): String;
		inline function get_pageSelector() return '.page[data-name="$pageName"]';

	
	public function new(app) 
	{
		_app = app;
		_myApp = app.myApp;
		final self = @:nullSafety(Off) this;
		D(Browser.document).on(page_init, self.pageSelector, (_, p) -> self.onInit(p));
		D(Browser.document).on(page_beforein, self.pageSelector, (_, p) -> self.run(p));
		//_myApp.onPageInit(pageName, onInit);
		//_myApp.onPageBeforeAnimation(pageName, run);
	}
	
	public function onInit(p: fw7.Page) {
		_page = p;
		if ( !_isInitialized ) initOnce(p);
		init(p);
		_isInitialized = true;
	}
	
	function init(page: fw7.Page) { }
	
	function run(page: fw7.Page) { }
	
	function initOnce(page: fw7.Page) { }

	inline function gotoPage(name: String) {
		_app.mainView.router.back(name, {force:true } );

	}
	
	inline function gotoIndex() gotoPage("index");	
	
}