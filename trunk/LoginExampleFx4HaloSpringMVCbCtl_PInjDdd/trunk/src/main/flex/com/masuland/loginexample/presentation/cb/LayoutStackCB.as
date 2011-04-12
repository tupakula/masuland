package com.masuland.loginexample.presentation.cb
{
	import com.masuland.loginexample.domain.vo.LayoutVO;

	public class LayoutStackCB
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject(name='appModel', property='appStackState')]
		[Bindable]
		public var appStackState:String;

		[Inject(name='appModel', property='currentLayout')]
		[Bindable]
		public var currentLayout:LayoutVO;
	}
}