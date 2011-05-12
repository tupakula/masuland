package com.masuland.loginexample.action
{
	import com.masuland.loginexample.business.IAppDelegate;
	import com.masuland.loginexample.action.event.AppEvent;
	import com.masuland.loginexample.action.event.LoadLayoutEvent;
	import com.masuland.loginexample.action.event.LoadLocaleEvent;
	import com.masuland.loginexample.action.event.LoadStyleEvent;
	import com.masuland.loginexample.action.event.LoginEvent;
	import com.masuland.loginexample.action.event.RegisterEvent;
	import com.masuland.loginexample.action.event.UpdateUserEvent;
	import com.masuland.loginexample.action.task.GetSettingsSeqTask;
	import com.masuland.loginexample.action.task.LoadLayoutSeqTask;
	import com.masuland.loginexample.action.task.LoadLocaleTask;
	import com.masuland.loginexample.action.task.LoadStyleTask;
	import com.masuland.loginexample.action.task.LoginTask;
	import com.masuland.loginexample.action.task.RegisterTask;
	import com.masuland.loginexample.action.task.UpdateUserTask;
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.state.AppStackState;
	import com.masuland.loginexample.data.state.LoginBoxState;
	import com.masuland.loginexample.data.state.SettingsBoxState;
	
	public class AppStories
	{
		//----------------------
		// Properties
		//----------------------
		
		[MessageDispatcher]
		public var dispatcher:Function;
		
		[Inject]
		public var appModel:AppModel;
		
		[Inject]
		public var appDelegate:IAppDelegate;

		[Inject]
		public var getSettingsSeqTask:GetSettingsSeqTask;

		[Inject]
		public var loadLayoutSeqTask:LoadLayoutSeqTask;

		[Inject]
		public var loadStyleTask:LoadStyleTask;
		
		[Inject]
		public var loadLocaleTask:LoadLocaleTask;

		[Inject]
		public var loginTask:LoginTask;
		
		[Inject]
		public var registerTask:RegisterTask;
		
		[Inject]
		public var updateUserTask:UpdateUserTask;

		//----------------------
		// Methods
		//----------------------
		
		[Init]
		public function init():void
		{
			dispatcher(new AppEvent(AppEvent.INIT_APP));
		}

		/**
		 * 
		 */
		[MessageHandler(selector='AppEvent.INIT_APP')]
		public function initApp(event:AppEvent):void
		{
			appModel.appStackState = AppStackState.LOGIN;
			appModel.loginBoxState = LoginBoxState.LOGIN;
			appModel.settingsBoxState = SettingsBoxState.OPEN;
			
			// get settings
			dispatcher(new AppEvent(AppEvent.GET_SETTINGS));
		}
		
		[MessageHandler(selector='AppEvent.GET_SETTINGS')]
		public function getSettings(event:AppEvent):void
		{
			getSettingsSeqTask.start();
		}
		
		[MessageHandler]
		public function login(event:LoginEvent):void
		{
			loginTask.auth = event.auth;
			loginTask.start();
		}
		
		[MessageHandler(selector='AppEvent.LOGOUT')]
		public function logout(event:AppEvent):void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
			appModel.appStackState = AppStackState.LOGIN;
		}
		
		[MessageHandler]
		public function register(event:RegisterEvent):void
		{
			registerTask.auth = event.auth;
			registerTask.start();
		}
		
		[MessageHandler]
		public function updateUser(event:UpdateUserEvent):void
		{
			updateUserTask.user = event.user;
			updateUserTask.start();
		}
		
		/**
		 * 
		 */
		[MessageHandler(selector='AppEvent.GOTO_LOGIN')]
		public function gotoLogin():void 
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
		}
		
		/**
		 * 
		 */
		[MessageHandler(selector='AppEvent.GOTO_REGISTER')]
		public function gotoRegister():void 
		{
			appModel.loginBoxState = LoginBoxState.REGISTER;
		}
		
		/**
		 * 
		 */
		[MessageHandler]
		public function loadLocale(event:LoadLocaleEvent):void 
		{
			loadLocaleTask.locale = event.locale;
			loadLocaleTask.start();
		}
		
		/**
		 * 
		 */
		[MessageHandler]
		public function loadStyle(event:LoadStyleEvent):void 
		{
			loadStyleTask.style = event.style;
			loadStyleTask.start();
		}
		
		/**
		 * 
		 */
		[MessageHandler]
		public function loadLayout(event:LoadLayoutEvent):void 
		{
			loadLayoutSeqTask.loadLayoutTask.layout = event.layout;
			loadLayoutSeqTask.start();
		}
	}
}
