package fw7.i18n;

/**
 * ...
 * @author 
 */

class ParamFill
{

	static public function fill<T:{}>(param: T, def: T): T {
		var result: T = Reflect.copy(def);
		for (f in Reflect.fields(param)) {
			var v = Reflect.field(param, f);
			if (v != null) Reflect.setField(result, f, v);
		}
		return result;
	}
	
}