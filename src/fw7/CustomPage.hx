package fw7;

import js.Browser;
import fw7.Dom7Helper.D;
import fw7.Page.PageEvents;

typedef MainApp = {
	var myApp(get, null): fw7.Framework7;	
	var mainView(get, null): fw7.View;
}

@page("") 
class CustomPage<T: MainApp>
{

	var _app: T;
	var _myApp: fw7.Framework7;
	var _isInitialized = false;
	var _page: fw7.Page;
	public var pageName(get, never): String;
		inline function get_pageName() return haxe.rtti.Meta.getType(Type.getClass(this)).page[0];
	public var pageSelector(get, never): String;
		inline function get_pageSelector() return '.page[data-name="$pageName"]';

	
	public function new(app) 
	{
		_app = app;
		_myApp = app.myApp;
		D(Browser.document).on(page_init, pageSelector, (_, p) -> onInit(p));
		D(Browser.document).on(page_beforein, pageSelector, (_, p) -> run(p));
		//_myApp.onPageInit(pageName, onInit);
		//_myApp.onPageBeforeAnimation(pageName, run);
	}
	
	public function onInit(p) {
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