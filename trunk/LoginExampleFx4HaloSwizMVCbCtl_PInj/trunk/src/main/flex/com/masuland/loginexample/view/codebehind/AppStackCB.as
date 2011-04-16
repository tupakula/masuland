package com.masuland.loginexample.view.codebehind
{
	public class AppStackCB
	{
		//----------------------
		// Properties
		//----------------------
		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;

		[Inject(source="appModel.loginBoxState", bind="true")]
		[Bindable]
		public var loginBoxState:String;
	}
}