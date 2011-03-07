package com.masuland.loginexample.view.cb
{
	public class AppStackCB implements IAppStackCB
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject(name='appModel', property='loginBoxState')]
		[Bindable]
		public var loginBoxState:String;
	}
}