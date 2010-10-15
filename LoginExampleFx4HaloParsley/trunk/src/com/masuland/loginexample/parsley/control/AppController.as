package com.masuland.loginexample.parsley.control
{
	import com.masuland.loginexample.parsley.business.IAppDelegate;
	import com.masuland.loginexample.parsley.control.event.AppEvent;
	import com.masuland.loginexample.parsley.control.event.LoadLayoutEvent;
	import com.masuland.loginexample.parsley.control.event.LoadLocaleEvent;
	import com.masuland.loginexample.parsley.control.event.LoadStyleEvent;
	import com.masuland.loginexample.parsley.control.event.LoginEvent;
	import com.masuland.loginexample.parsley.control.event.RegisterEvent;
	import com.masuland.loginexample.parsley.control.event.UpdateUserEvent;
	import com.masuland.loginexample.parsley.model.AppModel;
	import com.masuland.loginexample.parsley.state.AppStackState;
	import com.masuland.loginexample.parsley.state.LoginBoxState;
	import com.masuland.loginexample.parsley.vo.LayoutVO;
	import com.masuland.loginexample.parsley.vo.LocaleVO;
	import com.masuland.loginexample.parsley.vo.SettingsVO;
	import com.masuland.loginexample.parsley.vo.StyleVO;
	import com.masuland.loginexample.parsley.vo.UserVO;
	
	import flash.events.IEventDispatcher;
	
	import mx.controls.Alert;
	import mx.core.Application;
	import mx.core.FlexGlobals;
	import mx.events.ResourceEvent;
	import mx.events.StyleEvent;
	import mx.resources.ResourceManager;
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.styles.IStyleManager2;
	import mx.styles.StyleManager;
	
	public class AppController
	{
		[MessageDispatcher]
		public var dispatcher:Function;
		
		[Inject]
		public var appModel:AppModel;
		
		[Inject]
		public var appDelegate:IAppDelegate;
		
		public function AppController() {}

		//---------------
		// Action Events
		//---------------

		/**
		 * Load the User collection.
		 */
		[MessageHandler(selector="AppEvent.INITIALIZE_CLIENT")]
		public function initApp(event:AppEvent):void
		{
			appModel.appStackState = AppStackState.LOGIN;
			appModel.loginBoxState = LoginBoxState.LOGIN;
			
			// get settings
			dispatcher(new AppEvent(AppEvent.GET_SETTINGS));
		}
		
		[MessageHandler(selector="AppEvent.GET_SETTINGS")]
		public function getSettings(event:AppEvent):void
		{
			var token:AsyncToken = appDelegate.getSettings();
			token.addResponder(new Responder(getSettings_result, getSettings_fault));
		}
		
		/**  */
		public function getSettings_result(event:ResultEvent):void
		{
			appModel.settings = SettingsVO( event.result );
			
			// load layout
			dispatcher(new LoadLayoutEvent(LayoutVO( appModel.settings.layouts.getItemAt(0) )));
		}
		
		/**  */
		public function getSettings_fault(event:FaultEvent):void
		{
			Alert.show("getSettings_fault: " + event.fault);
		}
		
		[MessageHandler]
		public function login(event:LoginEvent):void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN_PROGRESS;
			
			var token:AsyncToken = appDelegate.login(event.auth);
			token.addResponder(new Responder(login_result, login_fault));
		}
		
		/**  */
		public function login_result(event:ResultEvent):void
		{
			appModel.currentUser = UserVO( event.result );
			appModel.appStackState = AppStackState.USER;
			appModel.loginBoxState = LoginBoxState.HIDDEN;
		}
		
		/**  */
		public function login_fault(event:FaultEvent):void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
		}

		[MessageHandler(selector="AppEvent.LOGOUT")]
		public function logout(event:AppEvent):void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
			appModel.appStackState = AppStackState.LOGIN;
		}

		[MessageHandler]
		public function register(event:RegisterEvent):void
		{
			appModel.loginBoxState = LoginBoxState.REGISTER_PROGRESS;
			
			var token:AsyncToken = appDelegate.register(event.auth);
			token.addResponder(new Responder(register_result, register_fault));
		}
		
		/**  */
		public function register_result(event:ResultEvent):void
		{
			appModel.currentUser = UserVO( event.result );
			appModel.appStackState = AppStackState.USER;
			appModel.loginBoxState = LoginBoxState.HIDDEN;
		}
		
		/**  */
		public function register_fault(event:FaultEvent):void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
		}
		
		[MessageHandler]
		public function updateUser(event:UpdateUserEvent):void
		{
			var token:AsyncToken = appDelegate.updateUser(event.user);
			token.addResponder(new Responder(updateUser_result, updateUser_fault));
		}
		
		/**  */
		public function updateUser_result(event:ResultEvent):void
		{
			appModel.currentUser = UserVO( event.result );
		}
		
		/**  */
		public function updateUser_fault(event:FaultEvent):void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
		}

		
		//---------------
		// GUI Events
		//---------------
		
		/**
		 * 
		 */
		[MessageHandler(selector="AppEvent.GOTO_LOGIN")]
		public function gotoLogin():void 
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
		}

		/**
		 * 
		 */
		[MessageHandler(selector="AppEvent.GOTO_REGISTER")]
		public function gotoRegister():void 
		{
			appModel.loginBoxState = LoginBoxState.REGISTER;
		}

		//---------------
		// GUI Loading
		//---------------

		/**
		 * 
		 */
		[MessageHandler]
		public function loadLocale(event:LoadLocaleEvent):void 
		{
			appModel.currentLocale = event.locale;
			
			ResourceManager.getInstance().localeChain = [ appModel.currentLocale.code ];
			ResourceManager.getInstance().update();

			// TODO ... Resource update bug
			
			var oldLoginBoxState:String = appModel.loginBoxState;
			appModel.loginBoxState = LoginBoxState.HIDDEN;
			appModel.loginBoxState = oldLoginBoxState;
			
			var oldAppStackState:String = appModel.appStackState;
			appModel.appStackState = AppStackState.HIDDEN;
			appModel.appStackState = oldAppStackState;
			
/*			var resourceModuleURL:String;
			var eventDispatcher:IEventDispatcher;
			
			if (appModel.currentLocale != null)
			{
				resourceModuleURL = "AppResources_" + appModel.currentLocale.code + ".swf";
				eventDispatcher = ResourceManager.getInstance().loadResourceModule(resourceModuleURL);
				
				if (eventDispatcher != null)
				{
					eventDispatcher.addEventListener(ResourceEvent.COMPLETE, onLoadLocaleComplete);
					eventDispatcher.addEventListener(ResourceEvent.ERROR, onLoadLocaleError);
				}
			}
*/		}
		
		/**
		 * 
		 */
		[MessageHandler]
		public function loadStyle(event:LoadStyleEvent):void 
		{
			var myEvent:IEventDispatcher;
			var myStyleManager:IStyleManager2 = StyleManager.getStyleManager(FlexGlobals.topLevelApplication.moduleFactory);
			
			if (appModel != null)
			{
				if (appModel.currentStyle != null)
				{
					myStyleManager.unloadStyleDeclarations(appModel.currentStyle.path, false);
				}

				appModel.currentStyle = event.style;
				
				myEvent = myStyleManager.loadStyleDeclarations(event.style.path, true);
				myEvent.addEventListener(StyleEvent.COMPLETE, onLoadStyleComplete);
				myEvent.addEventListener(StyleEvent.ERROR, onLoadStyleError);
			}
		}

		/**
		 * 
		 */
		[MessageHandler]
		public function loadLayout(event:LoadLayoutEvent):void 
		{
			appModel.currentLayout = event.layout;
			
			// load style
			dispatcher(new LoadStyleEvent(StyleVO( appModel.currentLayout.styles.getItemAt(0) )));
			
			// load locales
			dispatcher(new LoadLocaleEvent(LocaleVO( appModel.currentLayout.locales.getItemAt(0) )));
		}
		
		/**
		 * 
		 */
		private function onLoadLocaleComplete(event:ResourceEvent):void
		{	    	
			ResourceManager.getInstance().localeChain = [ appModel.currentLocale.code ];
		}
		
		/**
		 * 
		 */
		private function onLoadLocaleError(event:ResourceEvent):void
		{	    	
		}

		/**
		 * 
		 */
		private function onLoadStyleComplete(event:StyleEvent):void
		{
			appModel.isApplicationVisible = true;
		}
		
		/**
		 * 
		 */
		private function onLoadStyleError(event:StyleEvent):void
		{
			appModel.isApplicationVisible = true;
		}
	}
}
