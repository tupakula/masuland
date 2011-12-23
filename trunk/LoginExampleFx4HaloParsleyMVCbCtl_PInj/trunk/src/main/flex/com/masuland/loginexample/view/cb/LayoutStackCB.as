package com.masuland.loginexample.view.cb
{
	import com.masuland.loginexample.data.vo.LayoutVO;

	public class LayoutStackCB
	{
		//----------------------
		// Properties
		//----------------------
		
		[MessageDispatcher]
		public var dispatcher:Function;

		[Subscribe(scope='appModel', objectId='appStackState')]
		[Bindable]
		public var appStackState:String;

		[Subscribe(scope='appModel', objectId='currentLayout')]
		[Bindable]
		public var currentLayout:LayoutVO;
	}
}