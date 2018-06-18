package fw7;

import fw7.Framework7;
import fw7.Dom7;

typedef VirtualListParams<T> =  {
	? el: Dom7Container,
	? ul: Dom7Container,
	? createUl: Bool,
	items: Array<T>,
	? rowsBefore: Int,
	? rowsAfter: Int,
	? cols: Int,
	? height: haxe.extern.EitherType<Int, T->Int>,
	? itemTemplate: haxe.extern.EitherType<String, T->String>,
	? renderItem: Int->T->Void,
	? renderExternal: {fromIndex: Int, toIndex: Int, listHeight: Float, topPosition: Float, items: Array<T>}->Void,
	? emptyTemplate: String,
	? dynamicHeightBufferSize: Float,
	? cache: Bool,
	? updatableScroll: Bool,
	? setListHeight: Bool,
	? showFilteredItemsOnly: Bool,
	? searchByItem: String->Int->T->Bool,
	? searchAll: String->Array<T>->Array<Int>,
	? on: Dynamic,
}

extern class VirtualListApp {
	public function create<T>(parameters: VirtualListParams<T>): VirtualList<T>;
	public function destroy(el: Dom7Container): Void;
	public function get<T>(el: Dom7Container): VirtualList<T>;
}

extern class VirtualList<T> extends Framework7.Fw7Destroyable
{
	public var items: Array<T>;
	public var filteredItems: Array<T>;
	public var domCache: Dynamic;
	public var params: VirtualListParams<T>;

	public var pageContentEL: js.html.Element;
	@:native("$pageContentEL")
	public var dom7PageContentEL: fw7.Dom7;
	public var currentFromIndex: Int;
	public var currentToIndex: Int;
	public var reachEnd: Bool;
	
	public function filterItems(indexes: Array<Int>): Void;
	public function resetFilter(): Void;
	public function appendItem(item: T): Void;
	public function appendItems(items: Array<T>): Void;
	public function prependItem(item: T): Void;
	public function prependItems(items: Array<T>): Void;
	public function replaceItem(index: Int, item: T): Void;
	public function replaceAllItems(items:Array<T>): Void;
	public function moveItem(oldIndex: Int, newIndey: Int): Void;
	public function insertItemBefore(index:Int, item: T): Void;
	public function deleteItem(index: Int): Void;
	public function deleteItems(indexes: Array<Int>): Void;
	public function deleteAllItems(): Void;
	public function clearCache(): Void;
	public function update(): Void;
	public function scrollToItem(index: Int): Void;
	
	
}