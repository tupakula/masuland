package com.masuland.loginexample.view.cb
{
	import com.masuland.loginexample.control.IAppController;
	import com.masuland.loginexample.vo.LayoutVO;
	import com.masuland.loginexample.vo.LocaleVO;
	import com.masuland.loginexample.vo.SettingsVO;
	import com.masuland.loginexample.vo.StyleVO;

	public class AppViewCB implements IAppViewCB
	{
		[Inject]
		public var appController:IAppController;

		[Inject(name='appModel', property='isApplicationVisible')]
		[Bindable]
		public var isApplicationVisible:Boolean;

		[Inject(name='appModel', property='settings')]
		[Bindable]
		public var settings:SettingsVO;
		
		[Inject(name='appModel', property='currentLayout')]
		[Bindable]
		public var currentLayout:LayoutVO;
		
		public function loadStyle(style:StyleVO):void
		{
			appController.loadStyle(style);
		}
		
		public function loadLayout(layout:LayoutVO):void
		{
			appController.loadLayout(layout);
		}
		
		public function loadLocale(locale:LocaleVO):void
		{
			appController.loadLocale(locale);
		}
	}
}