package com.masuland.loginexample.presentation.cb
{
	import com.masuland.loginexample.domain.vo.LayoutVO;

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