package com.masuland.loginexample.presentation.cb
{
	import com.masuland.loginexample.domain.vo.LayoutVO;

	public class LayoutStackCB
	{
		//----------------------
		// Properties
		//----------------------
		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;

		[Inject(source="appModel.appStackState", bind="true")]
		[Bindable]
		public var appStackState:String;

		[Inject(source="appModel.currentLayout", bind="true")]
		[Bindable]
		public var currentLayout:LayoutVO;
	}
}