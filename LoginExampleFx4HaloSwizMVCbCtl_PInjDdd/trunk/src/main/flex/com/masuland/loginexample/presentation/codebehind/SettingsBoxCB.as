package com.masuland.loginexample.presentation.codebehind
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
	
	import flash.events.IEventDispatcher;

	public class SettingsBoxCB
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject]
		[Bindable]
		public var appModel:AppModel;
		
		[Inject(source="appModel.settings", bind="true")]
		[Bindable]
		public var settings:SettingsVO;
		
		[Inject(source="appModel.currentLayout", bind="true")]
		[Bindable]
		public var currentLayout:LayoutVO;
		
		[Inject(source="appModel.settingsBoxState", bind="true")]
		[Bindable]
		public var settingsBoxState:String;

		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
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