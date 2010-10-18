package com.masuland.loginexample.parsley.view.cb
{
	import com.masuland.loginexample.parsley.control.event.AppEvent;
	import com.masuland.loginexample.parsley.control.event.LoadLayoutEvent;
	import com.masuland.loginexample.parsley.control.event.LoadLocaleEvent;
	import com.masuland.loginexample.parsley.control.event.LoadStyleEvent;
	import com.masuland.loginexample.parsley.vo.LayoutVO;
	import com.masuland.loginexample.parsley.vo.LocaleVO;
	import com.masuland.loginexample.parsley.vo.SettingsVO;
	import com.masuland.loginexample.parsley.vo.StyleVO;

	public class AppViewCB
	{
		[MessageDispatcher]
		public var dispatcher:Function;

		[Subscribe(scope="AppModel", objectId="isApplicationVisible")]
		[Bindable]
		public var isApplicationVisible:Boolean;
		
		[Subscribe(scope="AppModel", objectId="settings")]
		[Bindable]
		public var settings:SettingsVO;

		[Subscribe(scope="AppModel", objectId="currentLayout")]
		[Bindable]
		public var currentLayout:LayoutVO;

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