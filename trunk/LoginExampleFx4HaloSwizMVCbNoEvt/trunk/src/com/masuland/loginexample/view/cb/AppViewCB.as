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

		private var _isApplicationVisible:Boolean;
		
		private var _settings:SettingsVO;
		
		private var _currentLayout:LayoutVO;

		[Inject(source="appModel.isApplicationVisible", bind="true")]
		[Bindable]
		public function get isApplicationVisible():Boolean
		{
			return _isApplicationVisible;
		}

		public function set isApplicationVisible(value:Boolean):void
		{
			_isApplicationVisible = value;
		}

		[Inject(source="appModel.settings", bind="true")]
		[Bindable]
		public function get settings():SettingsVO
		{
			return _settings;
		}

		public function set settings(value:SettingsVO):void
		{
			_settings = value;
		}

		[Inject(source="appModel.currentLayout", bind="true")]
		[Bindable]
		public function get currentLayout():LayoutVO
		{
			return _currentLayout;
		}

		public function set currentLayout(value:LayoutVO):void
		{
			_currentLayout = value;
		}

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
			appController.loadLocales(locale);
		}
	}
}