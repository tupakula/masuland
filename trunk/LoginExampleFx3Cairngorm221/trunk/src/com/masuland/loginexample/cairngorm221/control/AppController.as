package com.masuland.loginexample.cairngorm221.control
{
	import com.adobe.cairngorm.control.FrontController;
	import com.masuland.loginexample.cairngorm221.control.command.GetSettingsCommand;
	import com.masuland.loginexample.cairngorm221.control.command.GotoLoginCommand;
	import com.masuland.loginexample.cairngorm221.control.command.GotoRegisterCommand;
	import com.masuland.loginexample.cairngorm221.control.command.InitialiseClientCommand;
	import com.masuland.loginexample.cairngorm221.control.command.LoadLayoutCommand;
	import com.masuland.loginexample.cairngorm221.control.command.LoadLocaleCommand;
	import com.masuland.loginexample.cairngorm221.control.command.LoadStyleCommand;
	import com.masuland.loginexample.cairngorm221.control.command.LoginCommand;
	import com.masuland.loginexample.cairngorm221.control.command.LogoutCommand;
	import com.masuland.loginexample.cairngorm221.control.command.RegisterCommand;
	import com.masuland.loginexample.cairngorm221.control.command.UpdateUserCommand;
	import com.masuland.loginexample.cairngorm221.control.event.GetSettingsEvent;
	import com.masuland.loginexample.cairngorm221.control.event.GotoLoginEvent;
	import com.masuland.loginexample.cairngorm221.control.event.GotoRegisterEvent;
	import com.masuland.loginexample.cairngorm221.control.event.InitialiseClientEvent;
	import com.masuland.loginexample.cairngorm221.control.event.LoadLayoutEvent;
	import com.masuland.loginexample.cairngorm221.control.event.LoadLocaleEvent;
	import com.masuland.loginexample.cairngorm221.control.event.LoadStyleEvent;
	import com.masuland.loginexample.cairngorm221.control.event.LoginEvent;
	import com.masuland.loginexample.cairngorm221.control.event.LogoutEvent;
	import com.masuland.loginexample.cairngorm221.control.event.RegisterEvent;
	import com.masuland.loginexample.cairngorm221.control.event.UpdateUserEvent;
	
	public class AppController extends FrontController
	{
		public function AppController()
		{
			super();

			addCommand(InitialiseClientEvent.EVENT_NAME, InitialiseClientCommand, true);

			addCommand(GetSettingsEvent.EVENT_NAME, GetSettingsCommand, true);
			addCommand(LoadLocaleEvent.EVENT_NAME, LoadLocaleCommand, true);
			addCommand(LoadStyleEvent.EVENT_NAME, LoadStyleCommand, true);
			addCommand(LoadLayoutEvent.EVENT_NAME, LoadLayoutCommand, true);

			addCommand(GotoLoginEvent.EVENT_NAME, GotoLoginCommand, true);
			addCommand(GotoRegisterEvent.EVENT_NAME, GotoRegisterCommand, true);
			
			addCommand(LoginEvent.EVENT_NAME, LoginCommand, true);
			addCommand(LogoutEvent.EVENT_NAME, LogoutCommand, true);
			addCommand(RegisterEvent.EVENT_NAME, RegisterCommand, true);
			addCommand(UpdateUserEvent.EVENT_NAME, UpdateUserCommand, true);
		}
	}
}