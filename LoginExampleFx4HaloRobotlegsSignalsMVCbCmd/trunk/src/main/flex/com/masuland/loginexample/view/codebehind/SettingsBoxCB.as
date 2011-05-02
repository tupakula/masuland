package com.masuland.loginexample.view.codebehind
{
	import com.masuland.loginexample.action.signal.LoadLayoutSignal;
	import com.masuland.loginexample.action.signal.LoadLocaleSignal;
	import com.masuland.loginexample.action.signal.LoadStyleSignal;
	import com.masuland.loginexample.data.vo.LayoutVO;
	import com.masuland.loginexample.data.vo.LocaleVO;
	import com.masuland.loginexample.data.vo.StyleVO;

	public class SettingsBoxCB
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject]
		public var loadLayoutSignal:LoadLayoutSignal;
		
		[Inject]
		public var loadStyleSignal:LoadStyleSignal;
		
		[Inject]
		public var loadLocaleSignal:LoadLocaleSignal;

		//----------------------
		// Methods
		//----------------------
		
		public function loadLayout(layout:LayoutVO):void
		{
			loadLayoutSignal.dispatch(layout);
		}
		
		public function loadStyle(style:StyleVO):void
		{
			loadStyleSignal.dispatch(style);
		}
		
		public function loadLocale(locale:LocaleVO):void
		{
			loadLocaleSignal.dispatch(locale);
		}
	}
}