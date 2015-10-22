package fw7;

/**
 * ...
 * @author 
 */

typedef MessagebarParams = {
	? maxHeight: Float,
}

extern class Messagebar
{

	public var params(default, null): MessagebarParams;
	public var container: fw7.Dom7;
	public var textarea: fw7.Dom7;
	
	public function value(newValue: String): Void;
	public function clear(): Void;
	public function destroy(): Void;
	
}