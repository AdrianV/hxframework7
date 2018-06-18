package fw7;

import fw7.Framework7;
import fw7.Dom7;
import fw7.View;


extern class PullToRefreshApp {
	public function create(el: Dom7Container): PullToRefresh;
	public function get(el: Dom7Container): PullToRefresh;
	public function done(el: Dom7Container): PullToRefresh;	
	public function refresh(el: Dom7Container): PullToRefresh;
}

extern class PullToRefresh {
	public function done(): Void;
	public function refresh(): Void;
	public function destroy(): Void;	
}