package com.masuland.loginexample.view.cb
{
	public class AppStackCB
	{
		[MessageDispatcher]
		public var dispatcher:Function;

		[Subscribe(scope="AppModel", objectId="loginBoxState")]
		[Bindable]
		public var loginBoxState:String;
	}
}