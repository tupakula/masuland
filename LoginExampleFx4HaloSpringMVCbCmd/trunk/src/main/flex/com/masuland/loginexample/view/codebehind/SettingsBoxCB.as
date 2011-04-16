package com.masuland.loginexample.view.codebehind
{
	import com.masuland.loginexample.action.event.AppEvent;
	import com.masuland.loginexample.action.event.LoadLayoutEvent;
	import com.masuland.loginexample.action.event.LoadLocaleEvent;
	import com.masuland.loginexample.action.event.LoadStyleEvent;
	import com.masuland.loginexample.data.vo.LayoutVO;
	import com.masuland.loginexample.data.vo.LocaleVO;
	import com.masuland.loginexample.data.vo.StyleVO;
	
	import flash.events.EventDispatcher;

	[RouteEvents(events='LoadStyleEvent.EVENT_NAME, LoadLayoutEvent.EVENT_NAME, LoadLocaleEvent.EVENT_NAME')]
	
	[Event(name='LoadStyleEvent.EVENT_NAME', type='com.masuland.loginexample.control.event.LoadStyleEvent')]
	[Event(name='LoadLayoutEvent.EVENT_NAME', type='com.masuland.loginexample.control.event.LoadLayoutEvent')]
	[Event(name='LoadLocaleEvent.EVENT_NAME', type='com.masuland.loginexample.control.event.LoadLocaleEvent')]

	public class SettingsBoxCB extends EventDispatcher
	{
		//----------------------
		// Methods
		//----------------------
		
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