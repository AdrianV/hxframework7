package fw7;

import fw7.Framework7;
import fw7.Dom7;
import fw7.View;

enum abstract PanelPosition(String) to String {
	var ppLeft = "left";
	var ppRight = "right";
}

enum abstract PanelEffect(String) to String {
	var peCover = "cover";
	var peReveal = "reveal";
}

typedef PanelParams = {
	? el: Dom7Container,
	? side: PanelPosition,
	? effect: PanelEffect,
}

extern class PanelApp {
	public function open(side: PanelPosition, animate: Bool): Panel;
	public function close(side: PanelPosition, animate: Bool): Panel;
	public function create(parameters: PanelParams): Panel;
	public function get(side: PanelPosition): Panel;
	public function enableSwipe(side: PanelPosition): Panel;
	public function disableSwipe(side: PanelPosition): Panel;
	public var left(default, never): Panel;
	public var right(default, never): Panel;
	
}

extern class Panel extends Framework7.Fw7Destroyable<PanelParams> {
	public var side(default, never): PanelPosition;
	public var effect: PanelEffect;
	public var opened: Bool;
	public var backdropEl(default, never): js.html.Element;
	@:native("$backdropEl")
	public var dom7BackdropEl(default, never): Dom7;	

	public function open(animate: Bool): Void;
	public function close(animate: Bool): Void;
}