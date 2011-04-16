package com.masuland.loginexample.view.codebehind
{
	import com.masuland.loginexample.data.vo.LayoutVO;

	public class LayoutStackCB implements ILayoutStackCB
	{
		//----------------------
		// Properties
		//----------------------
		
		[Subscribe(scope='appModel', objectId='appStackState')]
		[Bindable]
		public var appStackState:String;

		[Subscribe(scope='appModel', objectId='currentLayout')]
		[Bindable]
		public var currentLayout:LayoutVO;
	}
}