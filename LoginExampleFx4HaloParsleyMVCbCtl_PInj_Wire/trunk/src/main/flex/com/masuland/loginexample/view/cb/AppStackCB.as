package com.masuland.loginexample.view.cb
{
	public class AppStackCB
	{
		//----------------------
		// Properties
		//----------------------
		
		[MessageDispatcher]
		public var dispatcher:Function;

		[Wire(id='appModel', propertyName='loginBoxState')]
		[Bindable]
		public var loginBoxState:String;
	}
}