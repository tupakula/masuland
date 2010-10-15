package com.masuland.loginexample.swiz.view.cb
{
	import com.masuland.loginexample.swiz.control.event.AppEvent;
	import com.masuland.loginexample.swiz.control.event.LoadLayoutEvent;
	import com.masuland.loginexample.swiz.control.event.LoadLocaleEvent;
	import com.masuland.loginexample.swiz.control.event.LoadStyleEvent;
	import com.masuland.loginexample.swiz.vo.LayoutVO;
	import com.masuland.loginexample.swiz.vo.LocaleVO;
	import com.masuland.loginexample.swiz.vo.StyleVO;
	
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