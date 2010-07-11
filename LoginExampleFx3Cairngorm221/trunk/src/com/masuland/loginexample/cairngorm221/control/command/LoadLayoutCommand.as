package com.masuland.loginexample.cairngorm221.control.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.masuland.loginexample.cairngorm221.control.event.LoadLayoutEvent;
	import com.masuland.loginexample.cairngorm221.control.event.LoadLocaleEvent;
	import com.masuland.loginexample.cairngorm221.control.event.LoadStyleEvent;
	import com.masuland.loginexample.cairngorm221.model.AppModel;
	import com.masuland.loginexample.cairngorm221.vo.LocaleVO;
	import com.masuland.loginexample.cairngorm221.vo.StyleVO;
	
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