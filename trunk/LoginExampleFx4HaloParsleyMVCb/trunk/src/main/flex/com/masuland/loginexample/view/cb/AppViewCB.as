package com.masuland.loginexample.view.cb
{
	import com.masuland.loginexample.control.event.AppEvent;
	import com.masuland.loginexample.control.event.LoadLayoutEvent;
	import com.masuland.loginexample.control.event.LoadLocaleEvent;
	import com.masuland.loginexample.control.event.LoadStyleEvent;
	import com.masuland.loginexample.vo.LayoutVO;
	import com.masuland.loginexample.vo.LocaleVO;
	import com.masuland.loginexample.vo.SettingsVO;
	import com.masuland.loginexample.vo.StyleVO;

	public class AppViewCB
	{
		//----------------------
		// Properties
		//----------------------
		
		[MessageDispatcher]
		public var dispatcher:Function;

		[Subscribe(scope='appModel', objectId='isApplicationVisible')]
		[Bindable]
		public var isApplicationVisible:Boolean;
		
		[Subscribe(scope='appModel', objectId='settings')]
		[Bindable]
		public var settings:SettingsVO;

		[Subscribe(scope='appModel', objectId='currentLayout')]
		[Bindable]
		public var currentLayout:LayoutVO;

		//----------------------
		// Methods
		//----------------------
		
		public function loadStyle(style:StyleVO):void
		{
			dispatcher(new LoadStyleEvent(style));
		}
		
		public function loadLayout(layout:LayoutVO):void
		{
			dispatcher(new LoadLayoutEvent(layout));
		}
		
		public function loadLocale(locale:LocaleVO):void
		{
			dispatcher(new LoadLocaleEvent(locale));
		}
	}
}