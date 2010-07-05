package com.masuland.loginexample.cairngorm221.control.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.masuland.loginexample.cairngorm221.control.event.LoadLayoutEvent;
	import com.masuland.loginexample.cairngorm221.model.AppModel;
	
	public class LoadLayoutCommand implements ICommand
	{
		public function execute(event:CairngormEvent):void
		{
			var appModel:AppModel = AppModel.getInstance();
			appModel.currentLayout = LoadLayoutEvent( event ).layout;
		}
	}
}