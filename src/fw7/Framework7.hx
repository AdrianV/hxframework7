package fw7;

/**
 * ...
 * @author 
 */
import fw7.View;

typedef PreprocessCallback = String->Void;
typedef Fw7Params = {
	? root: String,
	? material: Bool,
	? materialPageLoadDelay: Float,
	? materialRipple: Bool,
	? materialRippleElements: String,
	? materialPreloaderSvg: String,
	? cache: Bool,
	? cacheDuration: Float,
	? cacheIgnore: Array<String>,
	? cacheIgnoreGetParameters: Bool,
	? fastClicks: Bool,
	? fastClicksDelayBetweenClicks: Float,
	? fastClicksDistanceThreshold: Float,
	? activeState: Bool,
	? activeStateElemets: String,
	? tapHold: Bool,
	? tapHoldDelay: Float,
	? tapHoldPreventClicks: Bool,
	? router: Bool,
	? ajaxLinks: String,
	? dynamicPageUrl: String,
	? uniqueHistory: Bool,
	? uniqueHistoryIgnoreGetParameters: Bool,
	? externalLinks: String,
	? allowDuplicateUrls: Bool,
	? animateNavBackIcon: Bool,
	? animatePages: Bool,
	? preloadPreviousPage: Bool,
	? preroute: fw7.View->Dynamic->Void,
	? preprocess: String->String->PreprocessCallback->Void,
	? pushState: Bool,
	? pushStateSeparator: String,
	? pushStateRoot: String,
	? pushStateNoAnimation: Bool,
	? pushStatePreventOnLoad: Bool,
	? swipeBackPage: Bool,
	? swipeBackPageThreshold: Float,
	? swipeBackPageActiveArea: Float,
	? swipeBackPageAnimateShadow: Bool,
	? swipeBackPageAnimateOpacity: Bool,
	? sortable: Bool,
	? swipeout: Bool,
	? swipeoutNoFollow: Bool,
	? swipePanel: String,
	? swipePanelCloseOpposite: Bool,
	? swipePanelOnlyClose: Bool,
	? swipePanelActiveArea: Float,
	? swipePanelNoFollow: Bool,
	? swipePanelThreshold: Float,
	? panelsCloseByOutside: Bool,
	? modalTitle: String,
	? modalButtonOk: String,
	? modalButtonCancel: String,
	? modalPreloaderTitle: String,
	? modalCloseByOutside: Bool,
	? actionsCloseByOutside: Bool,
	? popupCloseByOutside: Bool,
	? modalTemplate: String,
	? modalActionsTemplate: String,
	? modalActionsToPopoverTemplate: String,
	? modalUsernamePlaceholder: String,
	? modalPasswordPlaceholder: String,
	? modalStack: Bool,
	? smartSelectOpenIn: String,
	? smartSelectBackTemplate: String,
	? smartSelectPopupCloseTemplate: String,
	? smartSelectBackText: String,
	? smartSelectPopupCloseText: String,
	? smartSelectPickerCloseText: String,
	? smartSelectSearchbar: Bool,
	? smartSelectBackOnSelect: Bool,
	? smartSelectFormTheme: String,
	? smartSelectNavbarTheme: String,
	? hideNavbarOnPageScroll: Bool,
	? hideToolbarOnPageScroll: Bool,
	? hideTabbarOnPageScroll: Bool,
	? showBarsOnPageScrollEnd: Bool,
	? showBarsOnPageScrollTop: Bool,
	? scrollTopOnNavbarClick: Bool,
	? imagesLazyLoadThreshold: Float,
	? imagesLazyLoadSequential: Bool,
	? imagesLazyLoadPlaceholder: String,
	? notificationTitle: String,
	? notificationSubtitle: String,
	? notificationMedia: String,
	? notificationHold: Float,
	? notificationCloseOnClick: Bool,
	? notificationCloseIcon: String,
	? notificationCloseButtonText: String,
	? statusbarOverlay: Bool,
	? scrollTopOnStatusbarClick: Bool,
	? template7Pages: Bool,
	? template7Data: Dynamic,
	? precompileTemplates: Bool,
	? templates: Dynamic,
	? onPageBeforeInit: Framework7->PageData->Void,
	? onPageInit: Framework7->PageData->Void,
	? onPageBeforeAnimation: Framework7->PageData->Void,
	? onPageAfterAnimation: Framework7->PageData->Void,
	? onPageBeforeRemove: Framework7->PageData->Void,
	? onPageBack: Framework7->PageData->Void,
	? onPageAfterBack: Framework7->PageData->Void,
	? viewClass: String,
	? viewMainClass: String,
	? viewsClass: String,
	? init: Bool,
	
}

typedef ModalOptions = {
	title: String,
	text: String,
	buttons:Array<ModalButtonParams> ,
	? afterText: String,
	
}

typedef ActionButton = {
	text: String,
	? bold: Bool,
	? color: String,
	? bg: String,
	? label: Bool,
	? disabled: Bool,
	? onClick: Void->Void,
}

typedef CallbackObject = {
	function trigger(): Void;
	function remove(): Void;
}

@:enum abstract SwipeoutDirection(String) {
	var left = "left";
	var right = "right";
}

typedef NotificationParams = {
	message: String,
	? title: String,
	? subtitle: String,
	? media: String,
	? hold: Float,
	? closeIcon: Bool,
	? closeButtonText: String,
	? closeOnClick: Bool,
	? additionalClass: String,
	? custom: String,
	? onClick: Void->Void,
	? onClose: Void->Void,
	? button: ButtonParams,
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

@:enum abstract PanelPosition(String) to String {
	var left = "left";
	var right = "right";
}

typedef Modal = js.html.HtmlElement;

@:native("Framework7")
extern class Framework7
{
	public var swipeoutOpenedEl(default, null): js.html.Element;

	//@:selfCall
	@:overload(function(params: fw7.Framework7.Fw7Params): Void {})
	public function new();
	
	public function addView(selector: String, ? params: ViewParams): fw7.View;
	public function getCurrentView(? index: Float): fw7.View;
	public function searchbar(container: haxe.extern.EitherType<String, js.html.HtmlElement>, ? params: fw7.SearchBar.SearchBarParams): fw7.SearchBar;
	public function messagebar(container: haxe.extern.EitherType<String, js.html.HtmlElement>, ? params: fw7.Messagebar.MessagebarParams): fw7.Messagebar;
	public function hideNavbar(navbar: haxe.extern.EitherType<String, js.html.HtmlElement>): Void;
	public function showNavbar(navbar: haxe.extern.EitherType<String, js.html.HtmlElement>): Void;
	public function sizeNavbars(viewContainer: haxe.extern.EitherType<String, js.html.HtmlElement>): Void;
	public function hideToolbar(toolbar: haxe.extern.EitherType<String, js.html.HtmlElement>): Void;
	public function showToolbar(toolbar: haxe.extern.EitherType<String, js.html.HtmlElement>): Void;
	public function showTab(tab: haxe.extern.EitherType<String, js.html.HtmlElement>): Void;
	
	@:overload(function(text: String, title: String, callbackOk: Void->Void): Modal {})
	@:overload(function(text: String, callbackOk: Void->Void): Modal {})
	@:overload(function(text: String, title: String): Modal {})
	public function alert(text: String): Modal;
	
	public function calendar(params: fw7.Calendar.CalendarParams): fw7.Calendar;
	public inline function calendarI18n(params: fw7.Calendar.CalendarParams, i: fw7.Calendar.CalendarParams): fw7.Calendar
		return calendar(fw7.i18n.ParamFill.fill(params, i));
	
	@:overload(function(text: String, title: String, callbackOk: Void->Void, ?callbackCancel: Void->Void): Modal {})
	@:overload(function(text: String, callbackOk: Void->Void, ?callbackCancel: Void->Void): Modal {})
	@:overload(function(text: String, title: String): Modal {})
	public function confirm(text: String): Modal;
	
	public function picker(params: fw7.Picker.PickerParams): fw7.Picker;
	
	@:overload(function(text: String, title: String, callbackOk: String->Void, ?callbackCancel: String->Void): Modal {})
	@:overload(function(text: String, callbackOk: String->Void, ?callbackCancel: String->Void): Modal {})
	@:overload(function(text: String, title: String): Modal {})
	public function prompt(text: String): Modal;

	@:overload(function(text: String, title: String, callbackOk: String->String->Void, ?callbackCancel: String->String->Void): Modal {})
	@:overload(function(text: String, callbackOk: String->String->Void, ?callbackCancel: String->String->Void): Modal {})
	@:overload(function(text: String, title: String): Modal {})
	public function modalLogin(text: String): Modal;

	@:overload(function(text: String, title: String, callbackOk: String->Void, ?callbackCancel: String->Void): Modal {})
	@:overload(function(text: String, callbackOk: String->Void, ?callbackCancel: String->Void): Modal {})
	@:overload(function(text: String, title: String): Modal {})
	public function modalPassword(text: String): Modal;
	
	public function showPreloader(? title: String): Modal;
	public function hidePreloader(): Void;

	public function showIndicator(): Modal;
	public function hideIndicator(): Void;
	
	public function modal(params: ModalOptions): Modal;
	public function closeModal(modal: haxe.extern.EitherType<String, js.html.HtmlElement>, ? animated: Bool): Void;
	
	public function popup(modal: haxe.extern.EitherType<String, js.html.HtmlElement>, ? removeOnClose: Bool, ? animated: Bool): Modal;
	//public function closePopup(modal: haxe.extern.EitherType<String, js.html.HtmlElement>): Void;
	
	@:overload(function(html: String, target: haxe.extern.EitherType<String, js.html.HtmlElement>, ? removeOnClose: Bool): Modal {})
	public function popover(popover: haxe.extern.EitherType<String, js.html.HtmlElement>, target: haxe.extern.EitherType<String, js.html.HtmlElement>): Modal;

	@:overload(function(groups: Array<Array<ActionButton>>):Void {})
	public function actions(buttons: Array<ActionButton>): Void;
	
	public function loginScreen(): Void;
	
	@:overload(function(html: String, ? removeOnClose: Bool): Void {})
	public function pickerModal(picker: haxe.extern.EitherType<String, js.html.HtmlElement>): Void;
	
	public function openPanel(position: PanelPosition): Void;
	public function closePanel(): Void;
	
	public function pullToRefreshDone(element: fw7.Dom7.Dom7Container): Void;
	public function pullToRefreshTrigger(element: fw7.Dom7.Dom7Container): Void;
	
	public function swipeoutOpen(el: fw7.Dom7.Dom7Container, direction: SwipeoutDirection, callback: Void->Void): Void;
	public function swipeoutClose(el: fw7.Dom7.Dom7Container, callback: Void->Void): Void;
	public function swipeoutDelete(el: fw7.Dom7.Dom7Container, callback: Void->Void): Void;
	
	public function sortableOpen(sortableContainer: haxe.extern.EitherType<String, js.html.HtmlElement>): Void;
	public function sortableClose(sortableContainer: haxe.extern.EitherType<String, js.html.HtmlElement>): Void;
	public function sortableToggle(sortableContainer: haxe.extern.EitherType<String, js.html.HtmlElement>): Void;
	
	
	public function virtualList<T>(listBlockContainer: fw7.Dom7.Dom7Container, params: fw7.VirtualList.VirtualListParams<T>): fw7.VirtualList<T>;
	
	public function addNotification(params: NotificationParams): js.html.Element;
	public function closeNotification(element: js.html.Element): Void;
	
	public function setProgressbar(container: haxe.extern.EitherType<String, js.html.HtmlElement>, progress: Float, speed: Float): Void;
	public function hideProgressbar(container: haxe.extern.EitherType<String, js.html.HtmlElement>): Void;
	
	public function onPageBeforeInit(pageName: String, callback: PageData->Void): CallbackObject;
	public function onPageInit(pageName: String, callback: PageData->Void): CallbackObject;
	public function onPageReinit(pageName: String, callback: PageData->Void): CallbackObject;
	public function onPageBeforeAnimation(pageName: String, callback: PageData->Void): CallbackObject;
	public function onPageAfterAnimation(pageName: String, callback: PageData->Void): CallbackObject;
	public function onPageBeforeRemove(pageName: String, callback: PageData->Void): CallbackObject;
	public function onPageBack(pageName: String, callback: PageData->Void): CallbackObject;
	public function onPageAfterBack(pageName: String, callback: PageData->Void): CallbackObject;
}