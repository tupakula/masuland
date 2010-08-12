package com.masuland.loginexample.spring.view.cb
{
	import com.masuland.loginexample.spring.control.event.AppEvent;
	import com.masuland.loginexample.spring.control.event.LoadLayoutEvent;
	import com.masuland.loginexample.spring.control.event.LoadLocaleEvent;
	import com.masuland.loginexample.spring.control.event.LoadStyleEvent;
	import com.masuland.loginexample.spring.vo.LayoutVO;
	import com.masuland.loginexample.spring.vo.LocaleVO;
	import com.masuland.loginexample.spring.vo.StyleVO;
	
	import flash.events.EventDispatcher;

	[RouteEvents(events="LoadStyleEvent.EVENT_NAME, LoadLayoutEvent.EVENT_NAME, LoadLocaleEvent.EVENT_NAME")]
	
	[Event(name="LoadStyleEvent.EVENT_NAME", type="com.masuland.loginexample.spring.control.event.LoadStyleEvent")]
	[Event(name="LoadLayoutEvent.EVENT_NAME", type="com.masuland.loginexample.spring.control.event.LoadLayoutEvent")]
	[Event(name="LoadLocaleEvent.EVENT_NAME", type="com.masuland.loginexample.spring.control.event.LoadLocaleEvent")]

	public class AppViewCB extends EventDispatcher
	{
		public function loadStyle(style:StyleVO):void
		{
			dispatchEvent(new LoadStyleEvent(style));
		}
		
		public function loadLayout(layout:LayoutVO):void
		{
			dispatchEvent(new LoadLayoutEvent(layout));
		}
		
		public function loadLocale(locale:LocaleVO):void
		{
			dispatchEvent(new LoadLocaleEvent(locale));
		}
	}
}