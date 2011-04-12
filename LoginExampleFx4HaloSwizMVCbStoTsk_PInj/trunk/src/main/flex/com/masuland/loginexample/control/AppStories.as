package com.masuland.loginexample.control
{
	import com.masuland.loginexample.business.IAppDelegate;
	import com.masuland.loginexample.control.event.AppEvent;
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
	import com.masuland.loginexample.vo.AuthenticationVO;
	import com.masuland.loginexample.vo.LayoutVO;
	import com.masuland.loginexample.vo.LocaleVO;
	import com.masuland.loginexample.vo.StyleVO;
	import com.masuland.loginexample.vo.UserVO;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	[Bindable]
	public class AppStories
	{
		//----------------------
		// Properties
		//----------------------
		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
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
		[EventHandler(event='mx.events.FlexEvent.APPLICATION_COMPLETE')]
		public function initApp():void
		{
			appModel.appStackState = AppStackState.LOGIN;
			appModel.loginBoxState = LoginBoxState.LOGIN;
			appModel.settingsBoxState = SettingsBoxState.OPEN;
			
			// get settings
			dispatcher.dispatchEvent(new AppEvent(AppEvent.GET_SETTINGS));
		}
		
		[EventHandler(event='AppEvent.GET_SETTINGS')]
		public function getSettings():void
		{
			getSettingsSeqTask.start();
		}
		
		[EventHandler(event='LoginEvent.EVENT_NAME', properties='auth')]
		public function login(auth:AuthenticationVO, nextEvent:Event=null):void
		{
			loginTask.auth = auth;
			loginTask.start();
		}
		
		[EventHandler(event='AppEvent.LOGOUT')]
		public function logout():void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
			appModel.appStackState = AppStackState.LOGIN;
		}
		
		[EventHandler(event='RegisterEvent.EVENT_NAME', properties='auth')]
		public function register(auth:AuthenticationVO, nextEvent:Event=null):void
		{
			registerTask.auth = auth;
			registerTask.start();
		}
		
		[EventHandler(event='UpdateUserEvent.EVENT_NAME', properties='user')]
		public function updateUser(user:UserVO):void
		{
			updateUserTask.user = user;
			updateUserTask.start();
		}
		
		/**
		 * 
		 */
		[EventHandler(event='AppEvent.GOTO_LOGIN')]
		public function gotoLogin():void 
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
		}
		
		/**
		 * 
		 */
		[EventHandler(event='AppEvent.GOTO_REGISTER')]
		public function gotoRegister():void 
		{
			appModel.loginBoxState = LoginBoxState.REGISTER;
		}
		
		/**
		 * 
		 */
		[EventHandler(event='LoadLocaleEvent.EVENT_NAME', properties='locale')]
		public function loadLocale(locale:LocaleVO):void 
		{
			loadLocaleTask.locale = locale;
			loadLocaleTask.start();
		}
		
		/**
		 * 
		 */
		[EventHandler(event='LoadStyleEvent.EVENT_NAME', properties='style')]
		public function loadStyle(style:StyleVO):void 
		{
			loadStyleTask.style = style;
			loadStyleTask.start();
		}
		
		/**
		 * 
		 */
		[EventHandler(event='LoadLayoutEvent.EVENT_NAME', properties='layout')]
		public function loadLayout(layout:LayoutVO):void 
		{
			loadLayoutSeqTask.loadLayoutTask.layout = layout;
			loadLayoutSeqTask.start();
		}
	}
}
