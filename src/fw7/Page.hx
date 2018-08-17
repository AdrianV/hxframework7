package fw7;

import fw7.Framework7;
import fw7.View;

@:enum abstract PageEvents(String) to String {
	var page_mounted = "page:mounted";
	var page_init = "page:init";
	var page_reinit = "page:reinit";
	var page_beforein = "page:beforein";
	var page_afterin = "page:afterin";
	var page_beforeout = "page:beforeout";
	var page_afterout = "page:afterout";
	var page_beforeremove = "page:beforeremove";
}

extern class Page  extends Fw7Object {
	var view(default, null): View;
	var router(default, null): fw7.Router;
	var name(default, null): String;
	var navbarEl(default, null): js.html.Element;
	var from(default, null): String;
	var to(default, null): String;
	var position(default, null): String;
	var direction(default, null): String;
	var route(default, null): fw7.Router.Route;
	var pageFrom(default, null): Page;
	var context(default, null): Any;
}