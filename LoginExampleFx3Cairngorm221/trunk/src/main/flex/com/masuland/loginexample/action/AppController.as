package com.masuland.loginexample.action
{
	import com.adobe.cairngorm.control.FrontController;
	import com.masuland.loginexample.action.command.GetSettingsCommand;
	import com.masuland.loginexample.action.command.GotoLoginCommand;
	import com.masuland.loginexample.action.command.GotoRegisterCommand;
	import com.masuland.loginexample.action.command.InitialiseClientCommand;
	import com.masuland.loginexample.action.command.LoadLayoutCommand;
	import com.masuland.loginexample.action.command.LoadLocaleCommand;
	import com.masuland.loginexample.action.command.LoadStyleCommand;
	import com.masuland.loginexample.action.command.LoginCommand;
	import com.masuland.loginexample.action.command.LogoutCommand;
	import com.masuland.loginexample.action.command.RegisterCommand;
	import com.masuland.loginexample.action.command.UpdateUserCommand;
	import com.masuland.loginexample.action.event.GetSettingsEvent;
	import com.masuland.loginexample.action.event.GotoLoginEvent;
	import com.masuland.loginexample.action.event.GotoRegisterEvent;
	import com.masuland.loginexample.action.event.InitialiseClientEvent;
	import com.masuland.loginexample.action.event.LoadLayoutEvent;
	import com.masuland.loginexample.action.event.LoadLocaleEvent;
	import com.masuland.loginexample.action.event.LoadStyleEvent;
	import com.masuland.loginexample.action.event.LoginEvent;
	import com.masuland.loginexample.action.event.LogoutEvent;
	import com.masuland.loginexample.action.event.RegisterEvent;
	import com.masuland.loginexample.action.event.UpdateUserEvent;
	
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