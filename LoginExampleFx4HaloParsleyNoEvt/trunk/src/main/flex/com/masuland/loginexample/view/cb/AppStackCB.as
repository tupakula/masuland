package com.masuland.loginexample.view.cb
{
	public class AppStackCB implements IAppStackCB
	{
		[Subscribe(scope="AppModel", objectId="loginBoxState")]
		[Bindable]
		public var loginBoxState:String;
	}
}