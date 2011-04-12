package com.masuland.loginexample.application
{
	import com.masuland.loginexample.infrastructure.business.IAppDelegate;
	import com.masuland.loginexample.application.event.AppEvent;
	import com.masuland.loginexample.application.event.LoadLayoutEvent;
	import com.masuland.loginexample.application.event.LoadLocaleEvent;
	import com.masuland.loginexample.application.event.LoadStyleEvent;
	import com.masuland.loginexample.domain.AppModel;
	import com.masuland.loginexample.domain.state.AppStackState;
	import com.masuland.loginexample.domain.state.LoginBoxState;
	import com.masuland.loginexample.domain.state.SettingsBoxState;
	import com.masuland.loginexample.domain.vo.AuthenticationVO;
	import com.masuland.loginexample.domain.vo.LayoutVO;
	import com.masuland.loginexample.domain.vo.LocaleVO;
	import com.masuland.loginexample.domain.vo.SettingsVO;
	import com.masuland.loginexample.domain.vo.StyleVO;
	import com.masuland.loginexample.domain.vo.UserVO;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.events.ResourceEvent;
	import mx.events.StyleEvent;
	import mx.resources.ResourceManager;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.styles.IStyleManager2;
	import mx.styles.StyleManager;
	
	import org.swizframework.utils.services.ServiceHelper;
	
	[Bindable]
	public class AppController
	{
		//----------------------
		// Properties
		//----------------------
		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[Inject]
		public var serviceHelper:ServiceHelper;
		
		[Inject]
		public var appModel:AppModel;
		
		[Inject]
		public var appDelegate:IAppDelegate;
		
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
			serviceHelper.executeServiceCall(
				appDelegate.getSettings(),
				getSettings_resultHandler,
				getSettings_faultHandler);
		}
		
		[EventHandler(event='LoginEvent.EVENT_NAME', properties='auth')]
		public function login(auth:AuthenticationVO, nextEvent:Event=null):void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN_PROGRESS;
			
			serviceHelper.executeServiceCall(
				appDelegate.login(auth),
				login_resultHandler,
				login_faultHandler);
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
			appModel.loginBoxState = LoginBoxState.REGISTER_PROGRESS;
			
			serviceHelper.executeServiceCall(
				appDelegate.register(auth),
				register_resultHandler,
				register_faultHandler);
		}
		
		[EventHandler(event='UpdateUserEvent.EVENT_NAME', properties='user')]
		public function updateUser(user:UserVO):void
		{
			serviceHelper.executeServiceCall(
				appDelegate.updateUser(user),
				updateUser_resultHandler,
				updateUser_faultHandler);
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
			appModel.currentLocale = locale;
			
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
				resourceModuleURL = 'AppResources_' + appModel.currentLocale.code + '.swf';
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
		[EventHandler(event='LoadStyleEvent.EVENT_NAME', properties='style')]
		public function loadStyle(style:StyleVO):void 
		{
			var myEvent:IEventDispatcher;
			var myStyleManager:IStyleManager2 = StyleManager.getStyleManager(FlexGlobals.topLevelApplication.moduleFactory);
			
			if (appModel != null)
			{
				if (appModel.currentStyle != null)
				{
					myStyleManager.unloadStyleDeclarations(appModel.currentStyle.path, false);
				}
				
				appModel.currentStyle = style;
				
				myEvent = myStyleManager.loadStyleDeclarations(style.path, true);
				myEvent.addEventListener(StyleEvent.COMPLETE, loadStyle_completeHandler);
				myEvent.addEventListener(StyleEvent.ERROR, loadStyle_errorHandler);
			}
		}
		
		/**
		 * 
		 */
		[EventHandler(event='LoadLayoutEvent.EVENT_NAME', properties='layout')]
		public function loadLayout(layout:LayoutVO):void 
		{
			appModel.currentLayout = layout;
			
			// load style
			dispatcher.dispatchEvent(new LoadStyleEvent(StyleVO( appModel.currentLayout.styles.getItemAt(0) )));
			
			// load locales
			dispatcher.dispatchEvent(new LoadLocaleEvent(LocaleVO( appModel.currentLayout.locales.getItemAt(0) )));
		}
		
		//----------------------
		// Handler
		//----------------------
		
		/**  */
		public function getSettings_resultHandler(event:ResultEvent):void
		{
			appModel.settings = SettingsVO( event.result );
			
			// load layout
			dispatcher.dispatchEvent(new LoadLayoutEvent(LayoutVO( appModel.settings.layouts.getItemAt(0) )));
		}
		
		/**  */
		public function getSettings_faultHandler(event:FaultEvent):void
		{
			Alert.show('getSettings_fault: ' + event.fault);
		}
		
		/**  */
		public function login_resultHandler(event:ResultEvent):void
		{
			appModel.currentUser = UserVO( event.result );
			appModel.appStackState = AppStackState.USER;
			appModel.loginBoxState = LoginBoxState.HIDDEN;
		}
		
		/**  */
		public function login_faultHandler(event:FaultEvent):void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
		}
		
		/**  */
		public function register_resultHandler(event:ResultEvent):void
		{
			appModel.currentUser = UserVO( event.result );
			appModel.appStackState = AppStackState.USER;
			appModel.loginBoxState = LoginBoxState.HIDDEN;
		}
		
		/**  */
		public function register_faultHandler(event:FaultEvent):void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
		}
		
		/**  */
		public function updateUser_resultHandler(event:ResultEvent):void
		{
			appModel.currentUser = UserVO( event.result );
		}
		
		/**  */
		public function updateUser_faultHandler(event:FaultEvent):void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
		}
		
		/**
		 * 
		 */
		private function loadLocale_completeHandler(event:ResourceEvent):void
		{	    	
			ResourceManager.getInstance().localeChain = [ appModel.currentLocale.code ];
		}
		
		/**
		 * 
		 */
		private function loadLocale_errorHandler(event:ResourceEvent):void
		{	    	
		}

		/**
		 * 
		 */
		private function loadStyle_completeHandler(event:StyleEvent):void
		{
			appModel.isApplicationVisible = true;
		}
		
		/**
		 * 
		 */
		private function loadStyle_errorHandler(event:StyleEvent):void
		{
			appModel.isApplicationVisible = true;
		}
	}
}
