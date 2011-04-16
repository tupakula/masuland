package com.masuland.loginexample.view.codebehind
{
	import com.masuland.loginexample.data.vo.LayoutVO;

	[Bindable]
	public interface ILayoutStackCB
	{
		function get appStackState():String;
		function set appStackState(value:String):void;
		
		function get currentLayout():LayoutVO;
		function set currentLayout(value:LayoutVO):void;
	}
}