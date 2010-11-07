package com.masuland.religionchooser.view
{
	import com.masuland.religionchooser.event.LoadLocaleEvent;
	import com.masuland.religionchooser.event.LoadStyleEvent;
	import com.masuland.religionchooser.vo.LayoutVO;
	import com.masuland.religionchooser.vo.LocaleVO;
	import com.masuland.religionchooser.vo.StyleVO;
	
	import spark.components.supportClasses.SkinnableComponent;
	
	public class SettingsBoxCB extends SkinnableComponent
	{
		[MessageDispatcher]
		public var dispatcher:Function;

		[Subscribe(objectId="currentLayout")]
		[Bindable]
		public var currentLayout:LayoutVO;
		
		[Subscribe(objectId="currentStyle")]
		[Bindable]
		public var currentStyle:StyleVO;
		
		[Subscribe(objectId="currentLocale")]
		[Bindable]
		public var currentLocale:LocaleVO;
		
		public function changeStyle(style:StyleVO):void
		{
			dispatcher(new LoadStyleEvent(style));
		}
		
		public function changeLocale(locale:LocaleVO):void
		{
			dispatcher(new LoadLocaleEvent(locale));
		}
	}
}