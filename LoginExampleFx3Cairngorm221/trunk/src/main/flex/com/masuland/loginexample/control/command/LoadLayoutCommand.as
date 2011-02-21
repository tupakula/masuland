package com.masuland.loginexample.control.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.masuland.loginexample.control.event.LoadLayoutEvent;
	import com.masuland.loginexample.control.event.LoadLocaleEvent;
	import com.masuland.loginexample.control.event.LoadStyleEvent;
	import com.masuland.loginexample.model.AppModel;
	import com.masuland.loginexample.vo.LocaleVO;
	import com.masuland.loginexample.vo.StyleVO;
	
	public class LoadLayoutCommand implements ICommand
	{
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