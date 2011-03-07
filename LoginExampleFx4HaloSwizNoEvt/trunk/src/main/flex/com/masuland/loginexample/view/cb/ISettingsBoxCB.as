package com.masuland.loginexample.view.cb
{
	import com.masuland.loginexample.vo.LayoutVO;
	import com.masuland.loginexample.vo.LocaleVO;
	import com.masuland.loginexample.vo.SettingsVO;
	import com.masuland.loginexample.vo.StyleVO;

	[Bindable]
	public interface ISettingsBoxCB
	{
		function get settings():SettingsVO;
		function set settings(value:SettingsVO):void;
		
		function get currentLayout():LayoutVO;
		function set currentLayout(value:LayoutVO):void;
		
		function get settingsBoxState():String;
		function set settingsBoxState(value:String):void;
		
		function toggleSettingsBox():void;
			
		function loadStyle(style:StyleVO):void;
		
		function loadLayout(layout:LayoutVO):void;
		
		function loadLocale(locale:LocaleVO):void;
	}
}