package com.masuland.loginexample.presentation.cb
{
	import com.masuland.loginexample.domain.vo.LayoutVO;

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