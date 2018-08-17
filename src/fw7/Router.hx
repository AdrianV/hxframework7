package fw7;

import fw7.Framework7;
import fw7.View;

typedef RouteOptions = {
	? animate: Bool,
	? history: Bool,
	? pushState: Bool,
	? reloadCurrent: Bool,
	? reloadPrevious: Bool,
	? reloadAll: Bool,
	? context: Any,
}

typedef RoutesInfo = {
	? name: String,
	path: String,
	? options: RouteOptions,
	? routes: Array<RoutesInfo>,
	? el: js.html.Element,
	? pageName: String,
	? content: String,
	? url: String,
	? template: Void->String,
	? templateUrl: String,
	? component: Dynamic,
	? tabs: Array<{> RoutesInfo, ? id: String}>,
	? actions: Dynamic,
	? popup: Dynamic,
	? loginScreen: Dynamic,
	? popover: Dynamic,
	? sheet: Dynamic,
	? alias: Array<{path: String, url: String, alias: haxe.extern.EitherType<String,Array<String>>}>,
	? redirect: Array<{path:String, url: String}>,
}

typedef Route = {
	url: String, 
	path: String, 
	query: Any, 
	params: Any, 
	name: String, 
	hash: String, 
	route: RoutesInfo, 
	context: Any
}

extern class Router extends Fw7Object {
	public var view(default, null): View;
	public var routes(default, null): Array<RoutesInfo>;
	public var history(default, null): Array<RoutesInfo>;
	public var cache(default, null): Any;
	public var currentRoute(default, null): Route;
	public var previousRoute(default, null): Route;
	public var allowPageChange(default, null):Bool;

	public function navigate(url: String, ? options: {>RouteOptions, ? clearPreviousHistory: Bool}): Void;
	public function back(? url: String, ? options: {? animate: Bool, ? pushState: Bool, ? ignoreCache: Bool, ? force: Bool}): Void;
	public function refreshPage(): Void;
	public function clearPreviousHistory(): Void;
	public function updateCurrentUrl(url: String): Void;
}