package com.masuland.loginexample.presentation.cb
{
	import com.masuland.loginexample.application.event.LoadLayoutEvent;
	import com.masuland.loginexample.application.event.LoadLocaleEvent;
	import com.masuland.loginexample.application.event.LoadStyleEvent;
	import com.masuland.loginexample.domain.AppModel;
	import com.masuland.loginexample.domain.state.SettingsBoxState;
	import com.masuland.loginexample.domain.vo.LayoutVO;
	import com.masuland.loginexample.domain.vo.LocaleVO;
	import com.masuland.loginexample.domain.vo.SettingsVO;
	import com.masuland.loginexample.domain.vo.StyleVO;

	public class SettingsBoxCB
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject]
		[Bindable]
		public var appModel:AppModel;
		
		[MessageDispatcher]
		public var dispatcher:Function;

		[Subscribe(scope='appModel', objectId='settings')]
		[Bindable]
		public var settings:SettingsVO;

		[Subscribe(scope='appModel', objectId='currentLayout')]
		[Bindable]
		public var currentLayout:LayoutVO;
		
		[Subscribe(scope='appModel', objectId='settingsBoxState')]
		[Bindable]
		public var settingsBoxState:String;

		//----------------------
		// Methods
		//----------------------
		
		public function toggleSettingsBox():void
		{
			if (appModel.settingsBoxState == SettingsBoxState.CLOSED)
			{
				appModel.settingsBoxState = SettingsBoxState.OPEN;
			}
			else
			{
				appModel.settingsBoxState = SettingsBoxState.CLOSED;
			}
		}
		
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