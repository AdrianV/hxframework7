package fw7;

/**
 * ...
 * @author 
 */
typedef VirtualListParams<T> =  {
	items: Array<T>,
	? rowsBefore: Int,
	? rowsAfter: Int,
	? cols: Int,
	? height: haxe.extern.EitherType<Int, T->Int>,
	? template: haxe.extern.EitherType<String, T->String>,
	? renderItem: Int->T->Void,
	? dynamicHeightBufferSize: Float,
	? cache: Bool,
	? updatableScroll: Bool,
	? searchByItem: String->Int->T->Bool,
	? searchAll: String->Array<T>->Array<Int>,
	? onItemBeforeInsert: VirtualList<T>->T->Void,
	? onBeforeClear: VirtualList<T>->js.html.HtmlElement->Void,
	? onItemsBeforeInsert: VirtualList<T>->js.html.HtmlElement->Void,
	? onItemsAfterInsert: VirtualList<T>->js.html.HtmlElement->Void,
	
}

extern class VirtualList<T>
{
	public var items: Array<T>;
	public var filteredItems: Array<T>;
	public var domCache: Dynamic;
	public var params: VirtualListParams<T>;
	public var listBlock: fw7.Dom7;
	public var pageContent: fw7.Dom7;
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
	public function destroy(): Void;
	public function update(): Void;
	public function scrollToItem(index: Int): Void;
	
	
}