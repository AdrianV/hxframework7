package fw7;

/**
 * ...
 * @author 
 */

@:struct
class Dom7Iterator 
{
	var arr: Dom7;
	var cur: Int;
	public inline function new(dom: Dom7) {
		this.arr = dom;
		this.cur = 0;
	}
	
	public inline function hasNext(): Bool return this.cur < this.arr.length;
	
	public inline function next(): js.html.Element return this.arr[this.cur++];
}

typedef Dom7Container = haxe.extern.EitherType<Dom7, haxe.extern.EitherType<String, js.html.HtmlElement>>;

private class X {
	static public function replaceHandler(t: Dom7, event: String = "click", f: js.html.Event->Void): Dom7 return t.off(event, f).on(event, f); 	
}

@:native("$$") 
extern class Dom7 implements ArrayAccess<js.html.Element>
{

	@:selfCall
	@:overload(function(element:js.html.Document):Void { })
	@:overload(function(element:js.html.Window):Void { })
	@:overload(function(element:js.html.Element):Void { })
	//@:overload(function(elementArray:haxe.extern.EitherType<js.html.NodeList, Array<js.html.Element>>):Void { })
	@:overload(function(selection:fw7.Dom7):Void { })
	@:overload(function(selector:String, ?context:haxe.extern.EitherType<js.html.Element, fw7.Dom7>):Void { })
	public function new():Void;
	
	//inline public static function D(selector:String): Dom7 return new Dom7(selector);
	
	public static var THIS(get, never) : Dom7;
	static inline private function get_THIS() : Dom7 {
		return new Dom7(js.Lib.nativeThis);
	}
	
	public inline function isChecked(): Bool { return prop('checked'); }
	public inline function setChecked(val: Bool): Dom7 { return prop( "checked", val); }

	public var length(default, never): Int;
	
	//public inline function array(): Array<js.html.Element> return cast this;
	public inline function iterator(): Dom7Iterator return new Dom7Iterator(this);
	

	/**
		Add class to elements
	**/
	public function addClass(className: String): Dom7;
	/**
		Remove specified class	 
	**/
	public function removeClass(className: String): Dom7;
	/**
		Determine whether any of the matched elements are assigned the given class:
	**/
	public function hasClass(className: String): Bool;
	/**
		Remove (if class is present) or add (if not) one or more classes from each element in the set of matched elements:
	**/
	public inline function toggleClass(className: String, ? toggle: Bool): Dom7 return Dom7ExtImpl.toggleClass(this, className, toggle);
	
	@:native("toggleClass")
	public function _toggleClass(className: String): Dom7;
	
	/**
		Get or Set property value
	**/		
	@:overload(function(propName: String, propValue: Dynamic): Dom7 {})
	@:overload(function(propertiesObject: Dynamic): Dom7 {})
	public function prop(propName: String): Dynamic;
	
	/**
		Get or Set attribute value
	**/		
	@:overload(function(attrName: String, attrValue:haxe.extern.EitherType<String, Float>): Dom7 {})
	@:overload(function(propertiesObject: Dynamic): Dom7 {})
	public function attr(attrName: String): String;
	
	/**
		Remove specified attribute:
	**/
	public function removeAttr(attrName: String): Dom7;
	
	/**
		Get the current value of the first element in the set of matched elements
		OR
		Set the value of every matched element
	**/
	@:overload(function(newValue: haxe.extern.EitherType<String, Float>): Dom7 {})
	public function val(): haxe.extern.EitherType<String, Float>;
	
	/**
		Return the value at the named data store for the first element in the collection, as set by data(key, value) or by an HTML5 data-* attribute
		OR
		Store arbitrary data associated with the matched elements
	**/
	@:overload(function(key: String): Dynamic {})
	public function data(key: String, value: Dynamic): Dom7;
	
	
	/**
		Remove specified data
	**/
	public function removeData(key: String): Dom7;
	
	/**
		Returns element's data set (set of data- attributes) as plain Object
	**/
	public function dataset(): Dynamic;

	/**
		Adds prefixed CSS transform property:
		'a'.D().transform('rotate(90deg)')
	**/	
	public function transform(CSSTransformString: String): Dom7;
	
	/**
		Set CSS transition-duration property to collection:
		'p'.D()..transition(300)
	**/	
	public function transition(transitionDuration: Float): Dom7;
	
	/**
		Add event handler function to one or more events to the selected elements.
		with delegatedTarget = Live/delegated event handler
	**/
	@:overload(function(eventName: String, delegatedTarget: Dom7Container, handler: js.html.Event->Void): Dom7 {})
	public function on(eventName: String, handler: js.html.Event->Void): Dom7;

	/**
		Add event handler function to one or more events to the selected elements that will be executed only once
		with delegatedTarget = Live/delegated event handler that will be executed only once
	**/
	@:overload(function(eventName: String, delegatedTarget: Dom7Container, handler: js.html.Event->Void): Dom7 {})
	public function once(eventName: String, handler: js.html.Event->Void): Dom7;
	
	/**
		Remove event handler
		with delegatedTarget = Remove live/delegated event handler
	**/
	@:overload(function(eventName: String, delegatedTarget: Dom7Container, handler: js.html.Event->Void): Dom7 {})
	public function off(eventName: String, handler: js.html.Event->Void): Dom7;
	
	inline function replaceHandler(event: String = "click", f: js.html.Event->Void): Dom7 { return X.replaceHandler(this, event, f); }
	
	/**
		Execute all handlers added to the matched elements for the specified event
	**/
	public function trigger(eventName: String, eventData: Dynamic): Dom7;
	
	/**
		Adds prefixed transitionEnd event handler to collection
	**/
	public function transitionEnd(callback:?Dynamic->Void, permanent: Bool): Dom7;

	/**
		Adds prefixed animationEnd event handler to collection
	**/
	public function animationEnd(callback:?Dynamic->Void): Dom7;
	
	public function width(): Float;
	public function outerWidth(? includeMargin: Bool): Float;
	public function height(): Float;
	public function outerHeight(? includeMargin: Bool): Float;
	public function offset(): { top: Float, left: Float };
	public function hide(): Dom7;
	public function show(): Dom7;
	public inline function toggle(v: Bool): Dom7 return if (v) show(); else hide();
	
	/**
		Set specified CSS property to the matched elements:
		Get value of specified CSS property for the first element:
	**/		
	@:overload(function(propName: String, propValue: Dynamic): Dom7 {})
	@:overload(function(propertiesObject: Dynamic): Dom7 {})
	public function css(propName: String): Dynamic;
	
	@:overload(function(position: Float, ? duration: Float, ? callback: Void->Void): Dom7 {})
	public function scrollTop(): Float;
	
	@:overload(function(position: Float, ? duration: Float, ? callback: Void->Void): Dom7 {})
	public function scrollLeft(): Float;
	
	
	public function scrollTo(left: Float, top: Float, ? duration: Float, callback: Void->Void): Dom7;
	
	public function add(elements: haxe.extern.EitherType<String,Dom7>): Dom7;
	
	public function each(callback: Void->Void): Dom7;
	
	@:overload(function(value:String): Dom7 {})
	public function html(): String;
	
	@:overload(function(value:String): Dom7 {})
	public function text(): String;
	
	public function is(selector: Dom7Container): Bool;
	
	public function index(): Int;
	
	public function eq(index: Int): Dom7;
	
	public function append(element: Dom7Container): Dom7;
	
	public function prepend(element: Dom7Container): Dom7;
	
	public function insertBefore(target: Dom7Container): Dom7;
	
	public function insertAfter(target: Dom7Container): Dom7;
	
	public function next(? selector: String): Dom7;
	public function nextAll(? selector: String): Dom7;
	
	public function prev(? selector: String): Dom7;
	public function prevAll(? selector: String): Dom7;
	
	public function parent(? selector: String): Dom7;
	public function parents(? selector: String): Dom7;

	public function find(selector: String): Dom7;
	
	public function children(selector: String): Dom7;
	
	public function filter(callback: Int->js.html.Element->Bool): Dom7;
	
	public function remove(): Dom7;
	
	@:overload(function(): Dom7 {})
	public function click(handler: js.html.Event->Void): Dom7;

	@:overload(function(): Dom7 {})
	public function blur(handler: js.html.Event->Void): Dom7;

	@:overload(function(): Dom7 {})
	public function focus(handler: js.html.Event->Void): Dom7;
	
	@:overload(function(): Dom7 {})
	public function focusin(handler: js.html.Event->Void): Dom7;
	
	@:overload(function(): Dom7 {})
	public function focusout(handler: js.html.Event->Void): Dom7;
	
	@:overload(function(): Dom7 {})
	public function keyup(handler: js.html.Event->Void): Dom7;
	
	@:overload(function(): Dom7 {})
	public function keydown(handler: js.html.Event->Void): Dom7;
	
	@:overload(function(): Dom7 {})
	public function keypress(handler: js.html.Event->Void): Dom7;
	
	@:overload(function(): Dom7 {})
	public function submit(handler: js.html.Event->Void): Dom7;
	
	@:overload(function(): Dom7 {})
	public function change(handler: js.html.Event->Void): Dom7;
	
	@:overload(function(): Dom7 {})
	public function mousedown(handler: js.html.Event->Void): Dom7;
	
	@:overload(function(): Dom7 {})
	public function mousemove(handler: js.html.Event->Void): Dom7;
	
	@:overload(function(): Dom7 {})
	public function mouseup(handler: js.html.Event->Void): Dom7;
	
	@:overload(function(): Dom7 {})
	public function mouseenter(handler: js.html.Event->Void): Dom7;
	
	@:overload(function(): Dom7 {})
	public function mouseleave(handler: js.html.Event->Void): Dom7;
	
	@:overload(function(): Dom7 {})
	public function mouseout(handler: js.html.Event->Void): Dom7;
	
	@:overload(function(): Dom7 {})
	public function mouseover(handler: js.html.Event->Void): Dom7;
	
	@:overload(function(): Dom7 {})
	public function touchstart(handler: js.html.Event->Void): Dom7;
	
	@:overload(function(): Dom7 {})
	public function touchend(handler: js.html.Event->Void): Dom7;
	
	@:overload(function(): Dom7 {})
	public function touchmove(handler: js.html.Event->Void): Dom7;
	
	public function resize(handler: js.html.Event->Void): Dom7;
	
	public function scroll(handler: js.html.Event->Void): Dom7;

	static function __init__(): Void {
		untyped {
			__js__("var $$ = Dom7");
		}
	}
	
	public inline function toggleButton(disabled: Bool, colorNormal: String, colorDisabled: String): Dom7	{
		return Dom7ExtImpl.toggleButton(this, disabled, colorNormal, colorDisabled);
	}

	public inline	function doWith(action: Dom7->Dom7): Dom7 return action(this);

}

@:native("d.m.x")
private class Dom7ExtImpl {
	
	static public function toggleButton(me: Dom7, disabled: Bool, colorNormal: String, colorDisabled: String): Dom7 {
		if ( !disabled ) {
			me.removeClass('disabled color-$colorDisabled').addClass('color-$colorNormal');
		} else {
			me.removeClass('color-$colorNormal').addClass('disabled color-$colorDisabled');
		}
		return me;
	}	
	
	static public function toggleClass(me: Dom7, className: String, ? toggle: Bool): Dom7 {
		if (toggle != null) {
			return if (toggle) me.addClass(className) else me.removeClass(className);
		} else return me._toggleClass(className);
	}

}
