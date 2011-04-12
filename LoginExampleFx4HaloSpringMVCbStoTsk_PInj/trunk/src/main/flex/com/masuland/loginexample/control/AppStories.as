package com.masuland.loginexample.control
{
	import com.masuland.loginexample.business.IAppDelegate;
	import com.masuland.loginexample.control.event.AppEvent;
	import com.masuland.loginexample.control.event.LoadLayoutEvent;
	import com.masuland.loginexample.control.event.LoadLocaleEvent;
	import com.masuland.loginexample.control.event.LoadStyleEvent;
	import com.masuland.loginexample.control.event.LoginEvent;
	import com.masuland.loginexample.control.event.RegisterEvent;
	import com.masuland.loginexample.control.event.UpdateUserEvent;
	import com.masuland.loginexample.control.task.GetSettingsSeqTask;
	import com.masuland.loginexample.control.task.LoadLayoutSeqTask;
	import com.masuland.loginexample.control.task.LoadLocaleTask;
	import com.masuland.loginexample.control.task.LoadStyleTask;
	import com.masuland.loginexample.control.task.LoginTask;
	import com.masuland.loginexample.control.task.RegisterTask;
	import com.masuland.loginexample.control.task.UpdateUserTask;
	import com.masuland.loginexample.model.AppModel;
	import com.masuland.loginexample.state.AppStackState;
	import com.masuland.loginexample.state.LoginBoxState;
	import com.masuland.loginexample.state.SettingsBoxState;
	
	import flash.events.EventDispatcher;
	
	[RouteEvents(events='AppEvent.GET_SETTINGS, LoadLayoutEvent.EVENT_NAME, LoadStyleEvent.EVENT_NAME, LoadLocaleEvent.EVENT_NAME')]
	
	[Event(name='AppEvent.GET_SETTINGS', type='com.masuland.loginexample.control.event.AppEvent')]
	[Event(name='LoadLayoutEvent.EVENT_NAME', type='com.masuland.loginexample.control.event.LoadLayoutEvent')]
	[Event(name='LoadStyleEvent.EVENT_NAME', type='com.masuland.loginexample.control.event.LoadStyleEvent')]
	[Event(name='LoadLocaleEvent.EVENT_NAME', type='com.masuland.loginexample.control.event.LoadLocaleEvent')]
	
	public class AppStories extends EventDispatcher
	{
		//----------------------
		// Properties
		//----------------------
		
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
		
		/**
		 * 
		 */
		[EventHandler(name='AppEvent.INITIALIZE_CLIENT')]
		public function initApp(event:AppEvent):void
		{
			appModel.appStackState = AppStackState.LOGIN;
			appModel.loginBoxState = LoginBoxState.LOGIN;
			appModel.settingsBoxState = SettingsBoxState.OPEN;
			
			// get settings
			dispatchEvent(new AppEvent(AppEvent.GET_SETTINGS));
		}
		
		[EventHandler(name='AppEvent.GET_SETTINGS')]
		public function getSettings(event:AppEvent):void
		{
			getSettingsSeqTask.start();
		}
		
		[EventHandler(name='LoginEvent.EVENT_NAME')]
		public function login(event:LoginEvent):void
		{
			loginTask.auth = event.auth;
			loginTask.start();
		}
		
		[EventHandler(name='AppEvent.LOGOUT')]
		public function logout(event:AppEvent):void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
			appModel.appStackState = AppStackState.LOGIN;
		}
		
		[EventHandler(name='RegisterEvent.EVENT_NAME')]
		public function register(event:RegisterEvent):void
		{
			registerTask.auth = event.auth;
			registerTask.start();
		}
		
		[EventHandler(name='UpdateUserEvent.EVENT_NAME')]
		public function updateUser(event:UpdateUserEvent):void
		{
			updateUserTask.user = event.user;
			updateUserTask.start();
		}
		
		/**
		 * 
		 */
		[EventHandler(name='AppEvent.GOTO_LOGIN')]
		public function gotoLogin():void 
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
		}
		
		/**
		 * 
		 */
		[EventHandler(name='AppEvent.GOTO_REGISTER')]
		public function gotoRegister():void 
		{
			appModel.loginBoxState = LoginBoxState.REGISTER;
		}
		
		
		/**
		 * 
		 */
		[EventHandler(name='LoadLocaleEvent.EVENT_NAME')]
		public function loadLocale(event:LoadLocaleEvent):void 
		{
			loadLocaleTask.locale = event.locale;
			loadLocaleTask.start();
		}
		
		/**
		 * 
		 */
		[EventHandler(name='LoadStyleEvent.EVENT_NAME')]
		public function loadStyle(event:LoadStyleEvent):void 
		{
			loadStyleTask.style = event.style;
			loadStyleTask.start();
		}
		
		/**
		 * 
		 */
		[EventHandler(name='LoadLayoutEvent.EVENT_NAME')]
		public function loadLayout(event:LoadLayoutEvent):void 
		{
			loadLayoutSeqTask.loadLayoutTask.layout = event.layout;
			loadLayoutSeqTask.start();
		}
	}
}
