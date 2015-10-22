package fw7;

/**
 * ...
 * @author 
 */

 
#if ! macro
typedef Dom = fw7.Dom7;
#end

@:noPackageRestrict
#if js extern #end class Dom7Helper 
{
	macro public static function D(exprs:Array<haxe.macro.Expr>) {
		return macro new fw7.Dom7($a{exprs});
	}
	
	#if !macro
	public static var THIS(get, null) : fw7.Dom7;

	static inline private function get_THIS() : fw7.Dom7 {
		return new fw7.Dom7(js.Lib.nativeThis);
	}
	#end
	
}	
