package com.masuland.loginexample.view.cb
{
	import com.masuland.loginexample.vo.LayoutVO;
	import com.masuland.loginexample.vo.LocaleVO;
	import com.masuland.loginexample.vo.SettingsVO;
	import com.masuland.loginexample.vo.StyleVO;

	[Bindable]
	public interface IAppViewCB
	{
		function get isApplicationVisible():Boolean;
		function set isApplicationVisible(value:Boolean):void;
		
		function get currentLayout():LayoutVO;
		function set currentLayout(value:LayoutVO):void;
		
		function get settingsBoxState():String;
		function set settingsBoxState(value:String):void;
		
		function loadStyle(style:StyleVO):void;
		
		function loadLayout(layout:LayoutVO):void;
		
		function loadLocale(locale:LocaleVO):void;
	}
}