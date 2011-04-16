package com.masuland.loginexample.view.codebehind
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