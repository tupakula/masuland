package com.masuland.loginexample.view.cb
{
	public class AppStackCB
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;

		[Inject(source="appModel.loginBoxState", bind="true")]
		[Bindable]
		public var loginBoxState:String;
	}
}