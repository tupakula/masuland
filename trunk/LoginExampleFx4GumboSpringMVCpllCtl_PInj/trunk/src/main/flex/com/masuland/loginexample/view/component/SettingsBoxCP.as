package com.masuland.loginexample.view.component
{
	import com.masuland.loginexample.action.event.LoadLayoutEvent;
	import com.masuland.loginexample.action.event.LoadLocaleEvent;
	import com.masuland.loginexample.action.event.LoadStyleEvent;
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.state.SettingsBoxState;
	import com.masuland.loginexample.data.vo.LayoutVO;
	import com.masuland.loginexample.data.vo.LocaleVO;
	import com.masuland.loginexample.data.vo.SettingsVO;
	import com.masuland.loginexample.data.vo.StyleVO;
	
	import flash.events.MouseEvent;
	
	import org.springextensions.actionscript.core.event.EventBus;
	
	import spark.components.supportClasses.SkinnableComponent;

	[SkinState('closed')]
	[SkinState('open')]
	public class SettingsBoxCP extends SkinnableComponent
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
		
		private var _settingsBoxState:String;
		
		//----------------------
		// Getter / Setter
		//----------------------

		[Inject(name='appModel', property='settingsBoxState')]
		[Bindable]
		public function get settingsBoxState():String
		{
			return _settingsBoxState;
		}
		
		public function set settingsBoxState(value:String):void
		{
			_settingsBoxState = value;
			
			invalidateSkinState();
		}

		//----------------------
		// Methods
		//----------------------
		
		override protected function getCurrentSkinState():String
		{
			return _settingsBoxState;
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
		
		//----------------------
		// Handler
		//----------------------
		
		public function btn_settings_clickHandler(event:MouseEvent):void
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
	}
}