package com.masuland.loginexample.view.codebehind
{
	import com.masuland.loginexample.action.IAppController;
	import com.masuland.loginexample.data.vo.LayoutVO;
	import com.masuland.loginexample.data.vo.LocaleVO;
	import com.masuland.loginexample.data.vo.SettingsVO;
	import com.masuland.loginexample.data.vo.StyleVO;

	public class AppViewCB implements IAppViewCB
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject]
		public var appController:IAppController;

		private var _isApplicationVisible:Boolean;
		
		private var _currentLayout:LayoutVO;
		
		private var _settingsBoxState:String;

		//----------------------
		// Getter / Setter
		//----------------------
		
		[Inject(source='appModel.isApplicationVisible', bind='true')]
		[Bindable]
		public function get isApplicationVisible():Boolean
		{
			return _isApplicationVisible;
		}

		public function set isApplicationVisible(value:Boolean):void
		{
			_isApplicationVisible = value;
		}

		[Inject(source='appModel.currentLayout', bind='true')]
		[Bindable]
		public function get currentLayout():LayoutVO
		{
			return _currentLayout;
		}

		public function set currentLayout(value:LayoutVO):void
		{
			_currentLayout = value;
		}
		
		[Inject(source='appModel.settingsBoxState', bind='true')]
		[Bindable]
		public function get settingsBoxState():String
		{
			return _settingsBoxState;
		}
		
		public function set settingsBoxState(value:String):void
		{
			_settingsBoxState = value;
		}

		//----------------------
		// Methods
		//----------------------
		
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