package com.masuland.loginexample.view.cb
{
	import com.masuland.loginexample.data.vo.LayoutVO;

	public class AppViewCB
	{
		//----------------------
		// Properties
		//----------------------
		
		[Bindable]
		[Wire(id='appModel', propertyName='isApplicationVisible')]
		public var isApplicationVisible:Boolean;

		[Wire(id='appModel', propertyName='currentLayout')]
		[Bindable]
		public var currentLayout:LayoutVO;
		
		[Wire(id='appModel', propertyName='settingsBoxState')]
		[Bindable]
		public var settingsBoxState:String;
	}
}