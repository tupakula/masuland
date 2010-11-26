package com.masuland.loginexample.view.cb
{
	import com.masuland.loginexample.vo.LayoutVO;

	[Bindable]
	public interface ILayoutStackCB
	{
		function get appStackState():String;
		function set appStackState(value:String):void;
		
		function get currentLayout():LayoutVO;
		function set currentLayout(value:LayoutVO):void;
	}
}