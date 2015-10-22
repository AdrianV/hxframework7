package fw7;

/**
 * ...
 * @author 
 */
import fw7.Framework7;

typedef SwipeCallbackData = {
	percentage: Float,
	activePage: js.html.HtmlElement,
	previousPage: js.html.HtmlElement,
	activeNavbar: js.html.HtmlElement,
	previousNavbar: js.html.HtmlElement,
}

typedef ViewParams = {
	? dynamicNavbar: Bool,
	? url: String,
	? domCache: Bool,
	? linksView: haxe.extern.EitherType<String, View>,
	? uniqueHistory: Bool,
	? uniqueHistoryIgnoreGetParameters: Bool,
	? allowDuplicateUrls: Bool,
	? animatePages: Bool,
	? preloadPreviousPage: Bool,
	? reloadPages: Bool,
	? preroute: fw7.View->Dynamic->Void,
	? preprocess: String->String->PreprocessCallback->Void,
	? swipeBackPage: Bool,
	? swipeBackPageThreshold: Float,
	? swipeBackPageActiveArea: Float,
	? swipeBackPageAnimateShadow: Bool,
	? swipeBackPageAnimateOpacity: Bool,
	? onSwipeBackMove: SwipeCallbackData->Void,
	? onSwipeBackBeforeChange: SwipeCallbackData->Void,
	? onSwipeBackAfterChange: SwipeCallbackData->Void,
	? onSwipeBackBeforeReset: SwipeCallbackData->Void,
	? onSwipeBackAfterReset: SwipeCallbackData->Void,
}

typedef PageData = {
	name: String,
	url: String,
	query: Dynamic,
	view: fw7.View,
	container: js.html.HtmlElement,
	from: String,
	navbarInnerContainer: js.html.HtmlElement,
	swipeBack: Bool,
	context: Dynamic,
	fromPage: PageData,
}

typedef RouterOptions = {
	? url: String,
	? content: String,
	? pageName: String,
	? template: Dynamic->String,
	? context: Dynamic,
	? contextName: String,
	? query: Dynamic,
	? force: Bool,
	? ignoreCache: Bool,
	? animatePages: Bool,
	? reload: Bool,
	? reloadPrevious: Bool,
	? pushState: Bool,
}

typedef Router = {
	load: RouterOptions->Bool,
	back: RouterOptions->Bool,
	loadPage: haxe.extern.EitherType<String, RouterOptions>->Void,
	loadContent: String->Void,
	reloadPage: String->Void,
	reloadContent: String->Void,
	reloadPreviousPage: String->Void,
	reloadPreviousContent: String->Void,
	refreshPage: Void->Void,
	refreshPreviousPage: Void->Void,
}

extern class View
{

	public var params(default, null): fw7.View.ViewParams;
	public var history(default, null): Array<String>;
	public var contentCache(default, null): Dynamic;
	public var url(default, null): String;
	public var pagesContainer(default, null): fw7.Dom7;
	public var activePage(default, null): PageData;
	public var main(default, null): Bool;
	public var router(default, null): Router;
	public function hideNavbar(): Void;
	public function showNavbar(): Void;
	public function hideToolbar(): Void;
	public function showToolbar(): Void;
	public function destroy(): Void;
}