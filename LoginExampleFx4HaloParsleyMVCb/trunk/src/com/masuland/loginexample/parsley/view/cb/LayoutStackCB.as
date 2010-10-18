package com.masuland.loginexample.parsley.view.cb
{
	import com.masuland.loginexample.parsley.vo.LayoutVO;

	public class LayoutStackCB
	{
		[MessageDispatcher]
		public var dispatcher:Function;

		[Subscribe(scope="AppModel", objectId="appStackState")]
		[Bindable]
		public var appStackState:String;

		[Subscribe(scope="AppModel", objectId="currentLayout")]
		[Bindable]
		public var currentLayout:LayoutVO;
	}
}