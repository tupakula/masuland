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
	
	import org.springextensions.actionscript.core.event.EventBus;

	public class SettingsBoxCB
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject]
		[Bindable]
		public var appModel:AppModel;

		[Inject(name='appModel', property='settings')]
		[Bindable]
		public var settings:SettingsVO;
		
		[Inject(name='appModel', property='currentLayout')]
		[Bindable]
		public var currentLayout:LayoutVO;
		
		[Inject(name='appModel', property='currentStyle')]
		[Bindable]
		public var currentStyle:StyleVO;
		
		[Inject(name='appModel', property='currentLocale')]
		[Bindable]
		public var currentLocale:LocaleVO;
		
		[Inject(name='appModel', property='settingsBoxState')]
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
			EventBus.dispatchEvent(new LoadStyleEvent(style));
		}
		
		public function loadLayout(layout:LayoutVO):void
		{
			EventBus.dispatchEvent(new LoadLayoutEvent(layout));
		}
		
		public function loadLocale(locale:LocaleVO):void
		{
			EventBus.dispatchEvent(new LoadLocaleEvent(locale));
		}
	}
}