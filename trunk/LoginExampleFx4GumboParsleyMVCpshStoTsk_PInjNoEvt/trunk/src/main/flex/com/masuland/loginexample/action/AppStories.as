package com.masuland.loginexample.action
{
	import com.masuland.loginexample.action.task.GetSettingsSeqTask;
	import com.masuland.loginexample.action.task.LoadLayoutSeqTask;
	import com.masuland.loginexample.action.task.LoadLocaleTask;
	import com.masuland.loginexample.action.task.LoadStyleTask;
	import com.masuland.loginexample.action.task.LoginTask;
	import com.masuland.loginexample.action.task.RegisterTask;
	import com.masuland.loginexample.action.task.UpdateUserTask;
	import com.masuland.loginexample.business.IAppDelegate;
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.state.AppStackState;
	import com.masuland.loginexample.data.state.LoginBoxState;
	import com.masuland.loginexample.data.state.SettingsBoxState;
	import com.masuland.loginexample.data.vo.AuthenticationVO;
	import com.masuland.loginexample.data.vo.LayoutVO;
	import com.masuland.loginexample.data.vo.LocaleVO;
	import com.masuland.loginexample.data.vo.StyleVO;
	import com.masuland.loginexample.data.vo.UserVO;
	
	public class AppStories implements IAppStories
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
		
		[Init]
		public function init():void
		{
			initApp();
		}

		/**
		 * 
		 */
		public function initApp():void
		{
			appModel.appStackState = AppStackState.LOGIN;
			appModel.loginBoxState = LoginBoxState.LOGIN;
			appModel.settingsBoxState = SettingsBoxState.OPEN;
			
			// get settings
			getSettings();
		}
		
		public function getSettings():void
		{
			getSettingsSeqTask.start();
		}
		
		public function login(auth:AuthenticationVO):void
		{
			loginTask.auth = auth;
			loginTask.start();
		}
		
		public function logout():void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
			appModel.appStackState = AppStackState.LOGIN;
		}
		
		public function register(auth:AuthenticationVO):void
		{
			registerTask.auth = auth;
			registerTask.start();
		}
		
		public function updateUser(user:UserVO):void
		{
			updateUserTask.user = user;
			updateUserTask.start();
		}
		
		/**
		 * 
		 */
		public function gotoLogin():void 
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
		}
		
		/**
		 * 
		 */
		public function gotoRegister():void 
		{
			appModel.loginBoxState = LoginBoxState.REGISTER;
		}
		
		/**
		 * 
		 */
		public function loadLocale(locale:LocaleVO):void 
		{
			loadLocaleTask.locale = locale;
			loadLocaleTask.start();
		}
		
		/**
		 * 
		 */
		public function loadStyle(style:StyleVO):void 
		{
			loadStyleTask.style = style;
			loadStyleTask.start();
		}
		
		/**
		 * 
		 */
		public function loadLayout(layout:LayoutVO):void 
		{
			loadLayoutSeqTask.loadLayoutTask.layout = layout;
			loadLayoutSeqTask.start();
		}
	}
}
