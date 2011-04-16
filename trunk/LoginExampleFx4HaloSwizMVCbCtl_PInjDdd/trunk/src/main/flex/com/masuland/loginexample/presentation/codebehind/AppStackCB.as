package com.masuland.loginexample.presentation.codebehind
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