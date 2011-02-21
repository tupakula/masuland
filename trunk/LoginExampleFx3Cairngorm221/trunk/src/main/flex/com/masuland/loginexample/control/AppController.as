package com.masuland.loginexample.control
{
	import com.adobe.cairngorm.control.FrontController;
	import com.masuland.loginexample.control.command.GetSettingsCommand;
	import com.masuland.loginexample.control.command.GotoLoginCommand;
	import com.masuland.loginexample.control.command.GotoRegisterCommand;
	import com.masuland.loginexample.control.command.InitialiseClientCommand;
	import com.masuland.loginexample.control.command.LoadLayoutCommand;
	import com.masuland.loginexample.control.command.LoadLocaleCommand;
	import com.masuland.loginexample.control.command.LoadStyleCommand;
	import com.masuland.loginexample.control.command.LoginCommand;
	import com.masuland.loginexample.control.command.LogoutCommand;
	import com.masuland.loginexample.control.command.RegisterCommand;
	import com.masuland.loginexample.control.command.UpdateUserCommand;
	import com.masuland.loginexample.control.event.GetSettingsEvent;
	import com.masuland.loginexample.control.event.GotoLoginEvent;
	import com.masuland.loginexample.control.event.GotoRegisterEvent;
	import com.masuland.loginexample.control.event.InitialiseClientEvent;
	import com.masuland.loginexample.control.event.LoadLayoutEvent;
	import com.masuland.loginexample.control.event.LoadLocaleEvent;
	import com.masuland.loginexample.control.event.LoadStyleEvent;
	import com.masuland.loginexample.control.event.LoginEvent;
	import com.masuland.loginexample.control.event.LogoutEvent;
	import com.masuland.loginexample.control.event.RegisterEvent;
	import com.masuland.loginexample.control.event.UpdateUserEvent;
	
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