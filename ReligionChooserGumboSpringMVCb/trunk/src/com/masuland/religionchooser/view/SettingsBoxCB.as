package com.masuland.religionchooser.view
{
	import com.masuland.religionchooser.event.LoadLocaleEvent;
	import com.masuland.religionchooser.event.LoadStyleEvent;
	import com.masuland.religionchooser.vo.LayoutVO;
	import com.masuland.religionchooser.vo.LocaleVO;
	import com.masuland.religionchooser.vo.StyleVO;
	
	import org.springextensions.actionscript.core.event.EventBus;
	
	import spark.components.supportClasses.SkinnableComponent;
	
	public class SettingsBoxCB extends SkinnableComponent
	{
		[Autowired(name='appModel', property='currentLayout')]
		[Bindable]
		public var currentLayout:LayoutVO;
		
		[Autowired(name='appModel', property='currentStyle')]
		[Bindable]
		public var currentStyle:StyleVO;
		
		[Autowired(name='appModel', property='currentLocale')]
		[Bindable]
		public var currentLocale:LocaleVO;
		
		public function changeStyle(style:StyleVO):void
		{
			EventBus.dispatchEvent(new LoadStyleEvent(style));
		}
		
		public function changeLocale(locale:LocaleVO):void
		{
			EventBus.dispatchEvent(new LoadLocaleEvent(locale));
		}
	}
}