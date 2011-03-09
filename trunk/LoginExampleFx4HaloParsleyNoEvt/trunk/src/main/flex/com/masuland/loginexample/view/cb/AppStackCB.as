package com.masuland.loginexample.view.cb
{
	public class AppStackCB implements IAppStackCB
	{
		//----------------------
		// Properties
		//----------------------
		
		[Subscribe(scope='appModel', objectId='loginBoxState')]
		[Bindable]
		public var loginBoxState:String;
	}
}