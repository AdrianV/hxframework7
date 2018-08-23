package fw7;

/**
 * ...
 * @author 
 */
import fw7.Dom7;
import fw7.View;
import fw7.Router;

typedef PreprocessCallback = String->Void;

enum abstract AppTheme(String) {
	var atAuto = "auto";
	var atMaterial = "md";
	var atIos = "ios";
}


typedef TouchParams = {
	?	fastClicks: Bool,
	?	fastClicksDistanceThreshold: Float,
	?	fastClicksDelayBetweenClicks: Float,
	?	fastClicksExclude: String,
	?	disableContextMenu: Bool,
	?	tapHold: Bool,
	?	tapHoldDelay: Float,
	?	tapHoldPreventClicks: Bool,
	?	activeState: Bool,
	?	activeStateElements: String,
	?	materialRipple: Bool,
	?	materialRippleElements: String,
}


typedef Fw7Params = {
	? id: String,
	? name: String,
	? version: String,
	? theme: AppTheme,
	? routes: Array<RoutesInfo>,
	? root: String,
	? data: Void->Any,
	? methods: Dynamic,
	? on: Dynamic,
	? init: Bool,
	? initOnDeviceReady: Bool,
	? clicks: {externalLinks: String},
	? touch: TouchParams,
	? panel: {
		?	leftBreakpoint: Float,
		?	rightBreakpoint: Float,
		?	swipe: String,
		?	swipeActiveArea: Float,
		?	swipeCloseOpposite: Bool,
		?	swipeOnlyClose: Bool,
		?	swipeNoFollow: Bool,
		?	swipeThreshold: Float,
		?	closeByBackdropClick: Bool,
	},
	? dialog: {
		? title: String,
		? buttonOk: String,
		? buttonCancel: String,
		? usernamePlaceholder: String,
		? passwordPlaceholder: String,
		? preloaderTitle: String,
		? progressTitle: String,
		? destroyPredefinedDialogs: Bool,
		? keyboardActions: Bool,
	},
	? navbar: {
		? hideOnPageScroll: Bool,
		? showOnPageScrollEnd: Bool,
		? showOnPageScrollTop: Bool,
		? scrollTopOnTitleClick: Bool,
		? iosCenterTitle: Bool,
	},
	? swipeout: {
		? noFollow: Bool,
		? removeElements: Bool,
		? removeElementsWithTimeout: Bool,
		? removeElementsTimeout: Float,
	},
	? toolbar: {
		? hideOnPageScroll: Bool,
		? showOnPageScrollEnd: Bool,
		? showOnPageScrollTop: Bool,
	},
	? view: View.ViewParams,
}

typedef ModalOptions = {
	title: String,
	text: String,
	buttons:Array<ModalButtonParams> ,
	? afterText: String,
	
}


typedef CallbackObject = {
	function trigger(): Void;
	function remove(): Void;
}


typedef ButtonParams = {
	text: String, 
	? bold: Bool,
	? color: String,
	? close: Bool,
	? onClick: Void->Void,
}

typedef ModalButtonParams = {
	> ButtonParams,
	? close: Bool,
}


typedef Modal = js.html.HtmlElement;

extern class Fw7ConstructorApp<P:{},R: Fw7Object> {
	public function create(params: P): R;
	public inline function createI18n(params: P, i18params: P): R 
		return create(fw7.i18n.ParamFill.fill(params, i18params));
	public function get(el: Dom7Container): R;
	public function destroy(el: Dom7Container): Void;	
}

typedef Fw7EventTargetContainer = haxe.extern.EitherType<js.html.Element, Fw7Object>;

abstract Fw7EventTarget(Fw7EventTargetContainer) {

	@:to function toElement(): js.html.Element {
		if (Std.is(this, js.html.Element)) return (this: js.html.Element);
		return (this: Fw7Object).el;
	}

	@:to function toObject(): Fw7Object {
		if (Std.is(this, js.html.Element)) return null;
		return (this: Fw7Object);
	}

	public inline function isElement() return Std.is(this, js.html.Element);
}

extern class Fw7Object {
	public var app(default, never): Framework7;
	public var el(default, never): js.html.Element;

	@:native("$el")
	public var dom7El(default, never): Dom7;
	
	public function on(event: String, handler: ?Fw7EventTarget->Void): Void;
	public function once(event: String, handler: ?Fw7EventTarget->Void): Void;
	public function off(event: String, ? handler: ?Fw7EventTarget->Void): Void;
	public function emit(event: String, ? p1: Any, ? p2: Any, ? p3: Any, ? p4: Any, ? p5: Any, ? p6: Any, ? p7: Any, ? p8: Any, ? p9: Any): Void;
}

extern class Fw7Destroyable<P:{}> extends Fw7Object {
	public var params(default, null): P;
	public function destroy(): Void;
}

typedef RequestParams = {
	? async: Bool,
	? method: String,
	? cache: Bool,
	? contentType: String,
	? crossDomain: Bool,
	? data: Dynamic,
	? processData: Bool,
	? dataType: String,
	? headers: Dynamic,
	? xhrFields: Dynamic,
	? username: String,
	? password: String,
	? timeout: Float,
	? beforeCreate: RequestParams-> Void,
	? beforeOpen: js.html.XMLHttpRequest->RequestParams->haxe.extern.EitherType<Void, Bool>,
	? beforeSend: js.html.XMLHttpRequest->haxe.extern.EitherType<Void, Bool>,
	? error: XHRResponse->Float->Void,
	? success: Dynamic->Float->XHRResponse->Void,
	? complete: XHRResponse->Float->Void,
	? statusCode: Dynamic,
}

extern class XHRResponse extends js.html.XMLHttpRequest 
{
	public var requestParameters(default, null): RequestParams;
	public var requestUrl(default, null): String;
}

@:native("Framework7")
extern class Framework7
{

	@:overload(function(params: fw7.Framework7.Fw7Params): Void {})
	public function new();
	
	public var id: String;
	public var name: String;
	public var version: String;
	public var routes: Array<RoutesInfo>;
	public var language: String;
	public var root: Dom7;
	public var rtl: Bool;
	public var theme: String;
	public var data: Dynamic;
	public var methods: Dynamic;
	public var width: Float;
	public var height: Float;
	public var left: Float;
	public var top: Float;
	public var initialized(default, never): Bool;
	@:native("$")
	public var dom7(default, never): String;
	public var params(default, never): Fw7Params;
	public var support(default, never): {
		touch: Bool,
		transforms3d: Bool,
		flexbox: Bool,
		observer: Bool,
		passiveListener: Bool,
		gestures: Bool,
		positionSticky: Bool,
	}
	public var utils(default, never): {
		function parseUrlQuery(url: String): Dynamic;
		function serializeObject(object: Dynamic): String;
		function requestAnimationFrame(callback: Void->Void): Float;
		function cancelAnimationFrame(requestId: Float): Void;
		function removeDiacritics(text: String): String;
		function nextFrame(callback: Void->Void): Void;
		function nextTick(callback: Void->Void, delay: Float): Float;
		function now(): Float;
		function extend(p1: Any, ? p2: Any, ? p3: Any, ? p4: Any, ? p5: Any, ? p6: Any, ? p7: Any, ? p8: Any, ? p9: Any): Any;
	}
	public var request(default, never): haxe.extern.EitherType<{
		function get(url: String, ?data: Dynamic, ?success: Dynamic->Float->XHRResponse->Void, ?error: XHRResponse->Float->Void, ?dataType: String): XHRResponse;
		function post(url: String, ?data: Dynamic, ?success: Dynamic->Float->XHRResponse->Void, ?error: XHRResponse->Float->Void, ?dataType: String): XHRResponse;
		function json(url: String, ?data: Dynamic, ?success: Dynamic->Float->XHRResponse->Void, ?error: XHRResponse->Float->Void): XHRResponse;
		function postJSON(url: String, ?data: Dynamic, ?success: Dynamic->Float->XHRResponse->Void, ?error: XHRResponse->Float->Void): XHRResponse;
		function setup(parameters: RequestParams): Void;
	}, RequestParams->js.html.XMLHttpRequest>;

	public var accordion(default, never): {
		function open(el: Dom7Container): Void;
		function close(el: Dom7Container): Void;
		function toggle(el: Dom7Container): Void;
	}
	public var actions(default, never): fw7.Actions.ActionsApp;
	public var autocomplete(default, never): fw7.Autocomplete.AutocompleteApp;
	public var calendar(default, never): fw7.Calendar.CalendarApp;
	public var dataTable(default, never): fw7.DataTable;
	public var dialog(default, never): fw7.Dialog.DialogApp;
	public var loginScreen(default, never): fw7.LoginScreen.LoginScreenApp;
	public var messagebar(default, never): fw7.Messagebar.MessagebarApp;
	public var navbar(default, never): {
		function hide(navbarEl: Dom7Container, animate: Bool): Void;
		function show(navbarEl: Dom7Container, animate: Bool): Void;
		function size(navbarEl: Dom7Container): Void;
		function getElByPage(pageEl: Dom7Container): Void;
	}
	public var notification(default, never): fw7.Notification.NotificationApp;
	public var panel(default, never): fw7.Panel.PanelApp;
	public var photoBrowser(default, never): fw7.PhotoBrowser.PhotoBrowserApp;
	public var picker(default, never): fw7.Picker.PickerApp;
	public var popover(default, never): fw7.Popover.PopoverApp;
	public var popup(default, never): fw7.Popup.PopupApp;
	public var progressbar(default, never): {
		public function set(? el: Dom7Container, progress: Float, duration: Float): js.html.Element;
		public function show(el: Dom7Container, progress: Float, color: String): js.html.Element;
		public function hide(el: Dom7Container): js.html.Element;
	} 
	public var ptr(default, never): fw7.PullToRefresh.PullToRefreshApp;
	public var searchbar(default, never): fw7.SearchBar.SearchBarApp;
	public var sortable(default, never): {
		public function enable(listEl: Dom7Container): Void;
		public function disable(listEl: Dom7Container): Void;
		public function toggle(listEl: Dom7Container): Void;
	}
	public var stepper(default, never): fw7.Stepper.StepperApp;
	public var swipeout(default, never): fw7.Swipeout;
	public var toast(default, never): fw7.Toast.ToastApp;
	public var toolbar(default, never): {
		function hide(toolbarEl: Dom7Container, animate: Bool): Void;
		function show(toolbarEl: Dom7Container, animate: Bool): Void;
		function setHighlight(toolbarEl: Dom7Container): Void;
	}
	public var views(default, never): ViewApp;
	public var virtualList(default, never): fw7.VirtualList.VirtualListApp;

	public function on(event: String, handler: ?Fw7EventTarget->Void): Void;
	public function once(event: String, handler: ?Fw7EventTarget->Void): Void;
	public function off(event: String, ? handler: ?Fw7EventTarget->Void): Void;
	public function emit(event: String, ? p1: Any, ? p2: Any, ? p3: Any, ? p4: Any, ? p5: Any, ? p6: Any, ? p7: Any, ? p8: Any, ? p9: Any): Void;
	
	/*		
	public function onPageBeforeInit(pageName: String, callback: PageData->Void): CallbackObject;
	public function onPageInit(pageName: String, callback: PageData->Void): CallbackObject;
	public function onPageReinit(pageName: String, callback: PageData->Void): CallbackObject;
	public function onPageBeforeAnimation(pageName: String, callback: PageData->Void): CallbackObject;
	public function onPageAfterAnimation(pageName: String, callback: PageData->Void): CallbackObject;
	public function onPageBeforeRemove(pageName: String, callback: PageData->Void): CallbackObject;
	public function onPageBack(pageName: String, callback: PageData->Void): CallbackObject;
	public function onPageAfterBack(pageName: String, callback: PageData->Void): CallbackObject;
	*/
}