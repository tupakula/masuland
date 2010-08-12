package com.masuland.loginexample.swiz10.view.cb
{
	import com.masuland.loginexample.swiz10.control.event.AppEvent;
	import com.masuland.loginexample.swiz10.control.event.LoadLayoutEvent;
	import com.masuland.loginexample.swiz10.control.event.LoadLocaleEvent;
	import com.masuland.loginexample.swiz10.control.event.LoadStyleEvent;
	import com.masuland.loginexample.swiz10.vo.LayoutVO;
	import com.masuland.loginexample.swiz10.vo.LocaleVO;
	import com.masuland.loginexample.swiz10.vo.StyleVO;
	
	import flash.events.IEventDispatcher;

	public class AppViewCB
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;

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