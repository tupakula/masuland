package com.masuland.loginexample.view.cb
{
	import com.masuland.loginexample.vo.LayoutVO;
	
	import flash.events.IEventDispatcher;

	public class AppViewCB
	{
		//----------------------
		// Properties
		//----------------------
		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[Inject(source="appModel.isApplicationVisible", bind="true")]
		[Bindable]
		public var isApplicationVisible:Boolean;
		
		[Inject(source="appModel.currentLayout", bind="true")]
		[Bindable]
		public var currentLayout:LayoutVO;
		
		[Inject(source="appModel.settingsBoxState", bind="true")]
		[Bindable]
		public var settingsBoxState:String;
	}
}