package fw7;

import fw7.Framework7;
import fw7.Dom7;

typedef PhotoUrl = haxe.extern.EitherType<String,{url:String, ?caption: String}>;

typedef PhotoBrowserParams = {
	photos: Array<PhotoUrl>,
	? initialSlide: Int,
	? spaceBetween: Float,
	? speed: Float,
	? zoom: Bool,
	? maxZoom: Float,
	? minZoom: Float,
	? exposition: Bool,
	? expositionHideCaptions: Bool,
	? swipeToClose: Bool,
	? view: fw7.View,
	? type: String,
	? loop: Bool,
	? theme: String,
	? captionsTheme: String,
	? navbar: Bool,
	? toolbar: Bool,
	? backLinkText: String,
	? ofText: String,
	? lazyLoading: Bool,
	? lazyLoadingInPrevNext: Bool,
	? lazyLoadingOnTransitionStart: Bool,
	? navbarTemplate: String,
	? toolbarTemplate: String,
	? photoTemplate: String,
	? lazyPhotoTemplate: String,
	? objectTemplate: String,
	? captionTemplate: String,
	? onOpen: PhotoBrowser -> Void,
	? onClose: PhotoBrowser -> Void,
	? onSwipeToClose: PhotoBrowser -> Void,
	? onSlideChangeStart: fw7.Swiper-> Void,
	? onSlideChangeEnd: fw7.Swiper-> Void,
	? onTransitionStart: fw7.Swiper-> Void,
	? onTransitionEnd: fw7.Swiper-> Void,
	? onClick: fw7.Swiper->js.html.Event -> Void,
	? onTap: fw7.Swiper->js.html.Event -> Void,
	? onDoubleTap: fw7.Swiper->js.html.Event -> Void,
	? onLazyImageLoad: fw7.Swiper->Int->js.html.Image -> Void,
	? onLazyImageReady: fw7.Swiper->Int->js.html.Image -> Void,
}

extern class PhotoBrowserApp extends Framework7.Fw7ConstructorApp<PhotoBrowserParams, PhotoBrowser> {
}
extern class PhotoBrowser extends Framework7.Fw7Destroyable<PhotoBrowserParams> {
	var swiper(default, null): fw7.Swiper;
	var container(default, null): fw7.Dom7.Dom7Container;
	var exposed(default, null): Bool;
	var activeIndex(default, null): Int;

	function open(? index: Int = 0): Void;
	function close(): Void;
	function toggleZoom(): Void;
	function toggleExposition(): Void;
	function enableExposition(): Void;
	function disableExposition(): Void;
}