package com.masuland.loginexample.view.cb
{
	public class AppStackCB
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject(name='appModel', property='loginBoxState')]
		[Bindable]
		public var loginBoxState:String;
	}
}