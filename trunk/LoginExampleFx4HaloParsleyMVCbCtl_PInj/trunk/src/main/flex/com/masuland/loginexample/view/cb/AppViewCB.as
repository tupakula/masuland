package com.masuland.loginexample.view.cb
{
	import com.masuland.loginexample.data.vo.LayoutVO;

	public class AppViewCB
	{
		//----------------------
		// Properties
		//----------------------
		
		[Subscribe(scope='appModel', objectId='isApplicationVisible')]
		[Bindable]
		public var isApplicationVisible:Boolean;

		[Subscribe(scope='appModel', objectId='currentLayout')]
		[Bindable]
		public var currentLayout:LayoutVO;
		
		[Subscribe(scope='appModel', objectId='settingsBoxState')]
		[Bindable]
		public var settingsBoxState:String;
	}
}