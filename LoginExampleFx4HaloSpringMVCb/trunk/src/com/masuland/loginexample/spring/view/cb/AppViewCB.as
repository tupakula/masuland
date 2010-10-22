package com.masuland.loginexample.spring.view.cb
{
	import com.masuland.loginexample.spring.control.event.LoadLayoutEvent;
	import com.masuland.loginexample.spring.control.event.LoadLocaleEvent;
	import com.masuland.loginexample.spring.control.event.LoadStyleEvent;
	import com.masuland.loginexample.spring.vo.LayoutVO;
	import com.masuland.loginexample.spring.vo.LocaleVO;
	import com.masuland.loginexample.spring.vo.SettingsVO;
	import com.masuland.loginexample.spring.vo.StyleVO;
	
	import org.springextensions.actionscript.core.event.EventBus;

	public class AppViewCB
	{
		[Autowired(name='appModel', property='isApplicationVisible')]
		[Bindable]
		public var isApplicationVisible:Boolean;

		[Autowired(name='appModel', property='settings')]
		[Bindable]
		public var settings:SettingsVO;
		
		[Autowired(name='appModel', property='currentLayout')]
		[Bindable]
		public var currentLayout:LayoutVO;

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