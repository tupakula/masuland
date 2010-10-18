package com.masuland.loginexample.swiz.view.cb
{
	import com.masuland.loginexample.swiz.control.event.LoadLayoutEvent;
	import com.masuland.loginexample.swiz.control.event.LoadLocaleEvent;
	import com.masuland.loginexample.swiz.control.event.LoadStyleEvent;
	import com.masuland.loginexample.swiz.vo.LayoutVO;
	import com.masuland.loginexample.swiz.vo.LocaleVO;
	import com.masuland.loginexample.swiz.vo.SettingsVO;
	import com.masuland.loginexample.swiz.vo.StyleVO;
	
	import flash.events.IEventDispatcher;

	public class AppViewCB
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[Inject(source="appModel.isApplicationVisible", bind="true")]
		[Bindable]
		public var isApplicationVisible:Boolean;
		
		[Inject(source="appModel.settings", bind="true")]
		[Bindable]
		public var settings:SettingsVO;
		
		[Inject(source="appModel.currentLayout", bind="true")]
		[Bindable]
		public var currentLayout:LayoutVO;

		public function loadStyle(style:StyleVO):void
		{
			dispatcher.dispatchEvent(new LoadStyleEvent(style));
		}
		
		public function loadLayout(layout:LayoutVO):void
		{
			dispatcher.dispatchEvent(new LoadLayoutEvent(layout));
		}
		
		public function loadLocale(locale:LocaleVO):void
		{
			dispatcher.dispatchEvent(new LoadLocaleEvent(locale));
		}
	}
}