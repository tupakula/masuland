package com.masuland.loginexample.view.cb
{
	import com.masuland.loginexample.control.event.LoadLayoutEvent;
	import com.masuland.loginexample.control.event.LoadLocaleEvent;
	import com.masuland.loginexample.control.event.LoadStyleEvent;
	import com.masuland.loginexample.model.AppModel;
	import com.masuland.loginexample.state.SettingsBoxState;
	import com.masuland.loginexample.vo.LayoutVO;
	import com.masuland.loginexample.vo.LocaleVO;
	import com.masuland.loginexample.vo.SettingsVO;
	import com.masuland.loginexample.vo.StyleVO;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;

	public class SettingsBoxCB extends EventDispatcher
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
		
		[Subscribe(scope='appModel', objectId='currentStyle')]
		[Bindable]
		public var currentStyle:LocaleVO;
		
		[Subscribe(scope='appModel', objectId='currentLocale')]
		[Bindable]
		public var currentLocale:LocaleVO;
		
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