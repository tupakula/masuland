package com.masuland.loginexample.view.cb
{
	import com.masuland.loginexample.vo.LayoutVO;

	public class LayoutStackCB
	{
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