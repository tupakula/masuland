package com.masuland.loginexample.cairngorm221.control.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.masuland.loginexample.cairngorm221.business.AppMockDelegate;
	import com.masuland.loginexample.cairngorm221.business.IAppDelegate;
	import com.masuland.loginexample.cairngorm221.control.event.LoadLayoutEvent;
	import com.masuland.loginexample.cairngorm221.control.event.LoadLocaleEvent;
	import com.masuland.loginexample.cairngorm221.control.event.LoadStyleEvent;
	import com.masuland.loginexample.cairngorm221.model.AppModel;
	import com.masuland.loginexample.cairngorm221.vo.LayoutVO;
	import com.masuland.loginexample.cairngorm221.vo.LocaleVO;
	import com.masuland.loginexample.cairngorm221.vo.SettingsVO;
	import com.masuland.loginexample.cairngorm221.vo.StyleVO;
	
	import mx.rpc.IResponder;
	
	public class GetSettingsCommand implements ICommand, IResponder
	{
		public function execute(event:CairngormEvent):void
		{
			var delegate:IAppDelegate = new AppMockDelegate(this);
			delegate.getSettings();
		}
		
		public function result(data:Object):void
		{
			var appModel:AppModel = AppModel.getInstance();
			
			appModel.settings = SettingsVO( data.result );
			
			// Load style
			new LoadStyleEvent(StyleVO( appModel.settings.styles.getItemAt(0) )).dispatch();
			
			// Load layout
			new LoadLayoutEvent(LayoutVO( appModel.settings.layouts.getItemAt(0) )).dispatch();
			
			// Load locale
			new LoadLocaleEvent(LocaleVO( appModel.settings.locales.getItemAt(0) )).dispatch();
		}

		public function fault(info:Object):void
		{
			// TODO
		}
	}
}