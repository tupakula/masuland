package com.masuland.loginexample
{
	import com.masuland.loginexample.action.command.GetSettingsCommand;
	import com.masuland.loginexample.action.command.GotoLoginCommand;
	import com.masuland.loginexample.action.command.GotoRegisterCommand;
	import com.masuland.loginexample.action.command.InitAppCommand;
	import com.masuland.loginexample.action.command.LoadLayoutCommand;
	import com.masuland.loginexample.action.command.LoadLocaleCommand;
	import com.masuland.loginexample.action.command.LoadStyleCommand;
	import com.masuland.loginexample.action.command.LoginCommand;
	import com.masuland.loginexample.action.command.LogoutCommand;
	import com.masuland.loginexample.action.command.RegisterCommand;
	import com.masuland.loginexample.action.command.UpdateUserCommand;
	import com.masuland.loginexample.action.signal.GetSettingsSignal;
	import com.masuland.loginexample.action.signal.GotoLoginSignal;
	import com.masuland.loginexample.action.signal.GotoRegisterSignal;
	import com.masuland.loginexample.action.signal.InitAppSignal;
	import com.masuland.loginexample.action.signal.LoadLayoutSignal;
	import com.masuland.loginexample.action.signal.LoadLocaleSignal;
	import com.masuland.loginexample.action.signal.LoadStyleSignal;
	import com.masuland.loginexample.action.signal.LoginSignal;
	import com.masuland.loginexample.action.signal.LogoutSignal;
	import com.masuland.loginexample.action.signal.RegisterSignal;
	import com.masuland.loginexample.action.signal.UpdateUserSignal;
	import com.masuland.loginexample.business.AppMockDelegate;
	import com.masuland.loginexample.business.IAppDelegate;
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.view.component.AppStackCP;
	import com.masuland.loginexample.view.component.AppViewCP;
	import com.masuland.loginexample.view.component.LayoutStackCP;
	import com.masuland.loginexample.view.component.LoginBoxCP;
	import com.masuland.loginexample.view.component.SettingsBoxCP;
	import com.masuland.loginexample.view.component.UserBoxCP;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.SignalContext;
	
	public class AppContext extends SignalContext
	{
		private const VIEW_PACKAGE:String = 'com.masuland.loginexample.view';
		
		override public function startup():void
		{
			viewMap.mapPackage(VIEW_PACKAGE);
			
			// Data
			injector.mapSingleton(AppModel);
			
			// Business
			injector.mapSingletonOf(IAppDelegate, AppMockDelegate);
			
			// Action
			injector.mapSingleton(InitAppSignal);
			injector.mapSingleton(GetSettingsSignal);
			injector.mapSingleton(LoadLayoutSignal);
			injector.mapSingleton(LoadStyleSignal);
			injector.mapSingleton(LoadLocaleSignal);
			
			injector.mapSingleton(GotoLoginSignal);
			injector.mapSingleton(GotoRegisterSignal);
			injector.mapSingleton(LoginSignal);
			injector.mapSingleton(RegisterSignal);
			injector.mapSingleton(UpdateUserSignal);
			injector.mapSingleton(LogoutSignal);
			
			signalCommandMap.mapSignalClass(InitAppSignal, InitAppCommand);
			signalCommandMap.mapSignalClass(GetSettingsSignal, GetSettingsCommand);
			signalCommandMap.mapSignalClass(LoadLayoutSignal, LoadLayoutCommand);
			signalCommandMap.mapSignalClass(LoadStyleSignal, LoadStyleCommand);
			signalCommandMap.mapSignalClass(LoadLocaleSignal, LoadLocaleCommand);
			
			signalCommandMap.mapSignalClass(GotoLoginSignal, GotoLoginCommand);
			signalCommandMap.mapSignalClass(GotoRegisterSignal, GotoRegisterCommand);
			signalCommandMap.mapSignalClass(LoginSignal, LoginCommand);
			signalCommandMap.mapSignalClass(RegisterSignal, RegisterCommand);
			signalCommandMap.mapSignalClass(UpdateUserSignal, UpdateUserCommand);
			signalCommandMap.mapSignalClass(LogoutSignal, LogoutCommand);

			// View
			injector.mapSingleton(AppViewCP);
			injector.mapSingleton(SettingsBoxCP);
			injector.mapSingleton(LayoutStackCP);
			injector.mapSingleton(AppStackCP);
			injector.mapSingleton(LoginBoxCP);
			injector.mapSingleton(UserBoxCP);
			
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, InitAppCommand);
			super.startup();
		}
	}
}