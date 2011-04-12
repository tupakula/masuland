package com.masuland.loginexample.presentation.cb
{
	public class AppStackCB
	{
		//----------------------
		// Properties
		//----------------------
		
		[MessageDispatcher]
		public var dispatcher:Function;

		[Subscribe(scope='appModel', objectId='loginBoxState')]
		[Bindable]
		public var loginBoxState:String;
	}
}