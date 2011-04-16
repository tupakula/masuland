package com.masuland.loginexample.presentation.codebehind
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