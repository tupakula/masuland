package com.masuland.loginexample.control.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.masuland.loginexample.business.AppMockDelegate;
	import com.masuland.loginexample.business.IAppDelegate;
	import com.masuland.loginexample.control.event.LoadLayoutEvent;
	import com.masuland.loginexample.model.AppModel;
	import com.masuland.loginexample.vo.LayoutVO;
	import com.masuland.loginexample.vo.SettingsVO;
	
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
			
			// Load layout
			new LoadLayoutEvent(LayoutVO( appModel.settings.layouts.getItemAt(0) )).dispatch();
		}

		public function fault(info:Object):void
		{
			// TODO
		}
	}
}