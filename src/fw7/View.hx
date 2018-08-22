package fw7;

/**
 * ...
 * @author 
 */
import fw7.Framework7;
import fw7.Router;
import fw7.Dom7;

typedef ViewParams = {
	? name: String,
	? main: Bool,
	? router: Bool,
	? url: String,
	? stackPages: Bool,
	? linksView: haxe.extern.EitherType<String, View>,
	? uniqueHistory: Bool,
	? uniqueHistoryIgnoreGetParameters: Bool,
	? allowDuplicateUrls: Bool,
	? animate: Bool,
	? preloadPreviousPage: Bool,
	? reloadPages: Bool,
	? restoreScrollTopOnBack: Bool,
	? iosPageLoadDelay: Float,
	? materialPageLoadDelay: Float,
	? passRouteQueryToRequest: Bool,
	? passRouteParamsToRequest: Bool,
	// Routes
	? routes: Array<RoutesInfo>,
	? routesAdd: Array<RoutesInfo>,
	// Elements Removal
	? removeElements: Bool,
	? removeElementsWithTimeout: Bool,
	? removeElementsTimeout: Float,
	? unloadTabContent: Bool,
	// XHR Cache
	? xhrCache: Bool,
	? xhrCacheIgnore: Array<String>,
	? xhrCacheIgnoreGetParameters: Bool,
	? xhrCacheDuration: Float,
	// iOS Dynamic Navbar
	? iosDynamicNavbar: Bool,
	? iosSeparateDynamicNavbar: Bool,
	? iosAnimateNavbarBackIcon: Bool,
	// Swipe back
	? iosSwipeBack: Bool,
	? iosSwipeBackThreshold: Float,
	? iosSwipeBackActiveArea: Float,
	? iosSwipeBackAnimateShadow: Bool,
	? iosSwipeBackAnimateOpacity: Bool,
	? mdSwipeBack: Bool,
	? mdSwipeBackThreshold: Float,
	? mdSwipeBackActiveArea: Float,
	? mdSwipeBackAnimateShadow: Bool,
	? mdSwipeBackAnimateOpacity: Bool,
	// Push State
	? pushState: Bool,
	? pushStateRoot: String,
	? pushStateAnimate: Bool,
	? pushStateAnimateOnLoad: Bool,
	? pushStateSeparator: String,
	? pushStateOnLoad: Bool,
	? on: Dynamic,
}



extern class ViewApp {
	public function create(viewEl: Dom7Container, parameters: ViewParams): View;
	public function get(viewEl: Dom7Container): View;
}

extern class View extends Fw7Destroyable<ViewParams>
{
	public var history(default, never): Array<String>;
	public var contentCache(default, never): Dynamic;
	public var url(default, never): String;
	public var pagesContainer(default, never): fw7.Dom7;
	//public var activePage(default, never): fw7.Page;
	public var main(default, never): Bool;
	public var router(default, never): Router;

	public function destroy(): Void;
	public function hideNavbar(): Void;
	public function showNavbar(): Void;
	public function hideToolbar(): Void;
	public function showToolbar(): Void;
}