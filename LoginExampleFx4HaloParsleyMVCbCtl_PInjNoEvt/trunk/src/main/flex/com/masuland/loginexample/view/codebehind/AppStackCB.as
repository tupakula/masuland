package com.masuland.loginexample.view.codebehind
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