package com.masuland.loginexample.view.cb
{
	import com.masuland.loginexample.vo.LayoutVO;

	public class LayoutStackCB implements ILayoutStackCB
	{
		[Subscribe(scope="AppModel", objectId="appStackState")]
		[Bindable]
		public var appStackState:String;

		[Subscribe(scope="AppModel", objectId="currentLayout")]
		[Bindable]
		public var currentLayout:LayoutVO;
	}
}