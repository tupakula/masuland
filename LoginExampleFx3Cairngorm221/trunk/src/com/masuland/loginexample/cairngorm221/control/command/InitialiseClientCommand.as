package com.masuland.loginexample.cairngorm221.control.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.masuland.loginexample.cairngorm221.control.event.GetSettingsEvent;
	import com.masuland.loginexample.cairngorm221.model.AppModel;
	import com.masuland.loginexample.cairngorm221.state.AppStackState;
	import com.masuland.loginexample.cairngorm221.state.LoginBoxState;
	
	import mx.core.Application;

	public class InitialiseClientCommand implements ICommand
	{
		public function execute(event:CairngormEvent):void
		{
			var appModel:AppModel = AppModel.getInstance();
			appModel.appStackState = AppStackState.LOGIN;
			appModel.loginBoxState = LoginBoxState.LOGIN;
			
			// Get settings
			new GetSettingsEvent().dispatch();
		}
	}
}