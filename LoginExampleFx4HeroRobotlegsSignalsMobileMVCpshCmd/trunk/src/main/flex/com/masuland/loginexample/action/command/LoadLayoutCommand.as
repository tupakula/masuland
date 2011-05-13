package com.masuland.loginexample.action.command
{
	import com.masuland.loginexample.action.signal.LoadLocaleSignal;
	import com.masuland.loginexample.action.signal.LoadStyleSignal;
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.vo.LayoutVO;
	import com.masuland.loginexample.data.vo.LocaleVO;
	import com.masuland.loginexample.data.vo.StyleVO;
	
	import org.robotlegs.mvcs.SignalCommand;

	/**
	 * @author masuland.com
	 */
	public class LoadLayoutCommand extends SignalCommand
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject]
		public var appModel:AppModel;

		[Inject]
		public var layout:LayoutVO;
		
		[Inject]
		public var refreshStyleAndLocales:Boolean;
		
		[Inject]
		public var loadStyleSignal:LoadStyleSignal;
		
		[Inject]
		public var loadLocaleSignal:LoadLocaleSignal;

		//----------------------
		// Methods
		//----------------------
		
		override public function execute():void
		{
			appModel.currentLayout = layout;

			if (refreshStyleAndLocales)
			{
				// load style
				loadStyleSignal.dispatch(StyleVO( appModel.currentLayout.styles.getItemAt(0) ));
				
				// load locales
				loadLocaleSignal.dispatch(LocaleVO( appModel.currentLayout.locales.getItemAt(0) ));
			}
		}
	}
}
