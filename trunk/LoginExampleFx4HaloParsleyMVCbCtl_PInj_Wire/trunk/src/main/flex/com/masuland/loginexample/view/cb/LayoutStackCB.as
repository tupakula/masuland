package com.masuland.loginexample.view.cb
{
	import com.masuland.loginexample.vo.LayoutVO;

	public class LayoutStackCB
	{
		//----------------------
		// Properties
		//----------------------
		
		[MessageDispatcher]
		public var dispatcher:Function;

		[Wire(id='appModel', propertyName='appStackState')]
		[Bindable]
		public var appStackState:String;

		[Wire(id='appModel', propertyName='currentLayout')]
		[Bindable]
		public var currentLayout:LayoutVO;
	}
}