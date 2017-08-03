package fw7;

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
	var _page: fw7.View.PageData;
	public var pageName(get, null): String;
	inline function get_pageName() return haxe.rtti.Meta.getType(Type.getClass(this)).page[0];
	
	public function new(app) 
	{
		_app = app;
		_myApp = app.myApp;
		_myApp.onPageInit(pageName, onInit);
		_myApp.onPageBeforeAnimation(pageName, run);
	}
	
	public function onInit(p) {
		_page = p;
		if ( !_isInitialized ) initOnce(p);
		init(p);
		_isInitialized = true;
	}
	
	function init(page: fw7.View.PageData) { }
	
	function run(page: fw7.View.PageData) { }
	
	function initOnce(page: fw7.View.PageData) { }

	inline function gotoPage(name: String) {
		_app.mainView.router.back( {pageName: name, force:true } );

	}
	
	inline function gotoIndex() gotoPage("index");	
	
}