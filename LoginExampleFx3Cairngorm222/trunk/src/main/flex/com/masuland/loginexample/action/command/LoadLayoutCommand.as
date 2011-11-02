package com.masuland.loginexample.action.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.masuland.loginexample.action.event.LoadLayoutEvent;
	import com.masuland.loginexample.action.event.LoadLocaleEvent;
	import com.masuland.loginexample.action.event.LoadStyleEvent;
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.vo.LocaleVO;
	import com.masuland.loginexample.data.vo.StyleVO;
	
	/**
	 * @author masuland.com
	 */
	public class LoadLayoutCommand implements ICommand
	{
		//----------------------
		// Methods
		//----------------------
		
		public function execute(event:CairngormEvent):void
		{
			var appModel:AppModel = AppModel.getInstance();
			appModel.currentLayout = LoadLayoutEvent( event ).layout;
			
			// Load style
			new LoadStyleEvent(StyleVO( appModel.currentLayout.styles.getItemAt(0) )).dispatch();
			
			// Load locale
			new LoadLocaleEvent(LocaleVO( appModel.currentLayout.locales.getItemAt(0) )).dispatch();
		}
	}
}