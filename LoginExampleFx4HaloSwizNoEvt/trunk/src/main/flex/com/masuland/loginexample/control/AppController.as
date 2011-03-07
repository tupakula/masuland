package com.masuland.loginexample.control
{
	import com.masuland.loginexample.business.IAppDelegate;
	import com.masuland.loginexample.model.AppModel;
	import com.masuland.loginexample.state.AppStackState;
	import com.masuland.loginexample.state.LoginBoxState;
	import com.masuland.loginexample.state.SettingsBoxState;
	import com.masuland.loginexample.vo.AuthenticationVO;
	import com.masuland.loginexample.vo.LayoutVO;
	import com.masuland.loginexample.vo.LocaleVO;
	import com.masuland.loginexample.vo.SettingsVO;
	import com.masuland.loginexample.vo.StyleVO;
	import com.masuland.loginexample.vo.UserVO;
	
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
	public class AppController implements IAppController
	{
		//----------------------
		// Properties
		//----------------------
		
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
		[Mediate(event="mx.events.FlexEvent.APPLICATION_COMPLETE")]
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
			serviceHelper.executeServiceCall(
				appDelegate.getSettings(),
				getSettings_resultHandler,
				getSettings_faultHandler);
		}
		
		public function login(auth:AuthenticationVO):void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN_PROGRESS;
			
			serviceHelper.executeServiceCall(
				appDelegate.login(auth),
				login_resultHandler,
				login_faultHandler);
		}
		
		public function logout():void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
			appModel.appStackState = AppStackState.LOGIN;
		}
		
		public function register(auth:AuthenticationVO):void
		{
			appModel.loginBoxState = LoginBoxState.REGISTER_PROGRESS;
			
			serviceHelper.executeServiceCall(
				appDelegate.register(auth),
				register_resultHandler,
				register_faultHandler);
		}
		
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
		public function loadLayout(layout:LayoutVO):void 
		{
			appModel.currentLayout = layout;
			
			// load style
			loadStyle(StyleVO( appModel.currentLayout.styles.getItemAt(0) ));
			
			// load locales
			loadLocale(LocaleVO( appModel.currentLayout.locales.getItemAt(0) ));
		}
		
		//----------------------
		// Handler
		//----------------------
		
		/**  */
		protected function getSettings_resultHandler(event:ResultEvent):void
		{
			appModel.settings = SettingsVO( event.result );
			
			// load layout
			loadLayout(LayoutVO( appModel.settings.layouts.getItemAt(0) ));
		}
		
		/**  */
		protected function getSettings_faultHandler(event:FaultEvent):void
		{
			Alert.show("getSettings_fault: " + event.fault);
		}
		
		/**  */
		protected function login_resultHandler(event:ResultEvent):void
		{
			appModel.currentUser = UserVO( event.result );
			appModel.appStackState = AppStackState.USER;
			appModel.loginBoxState = LoginBoxState.HIDDEN;
		}
		
		/**  */
		protected function login_faultHandler(event:FaultEvent):void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
		}
		
		/**  */
		protected function register_resultHandler(event:ResultEvent):void
		{
			appModel.currentUser = UserVO( event.result );
			appModel.appStackState = AppStackState.USER;
			appModel.loginBoxState = LoginBoxState.HIDDEN;
		}
		
		/**  */
		protected function register_faultHandler(event:FaultEvent):void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
		}
		
		/**  */
		protected function updateUser_resultHandler(event:ResultEvent):void
		{
			appModel.currentUser = UserVO( event.result );
		}
		
		/**  */
		protected function updateUser_faultHandler(event:FaultEvent):void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
		}
		
		/**
		 * 
		 */
		protected function loadLocale_completeHandler(event:ResourceEvent):void
		{	    	
			ResourceManager.getInstance().localeChain = [ appModel.currentLocale.code ];
		}
		
		/**
		 * 
		 */
		protected function loadLocale_errorHandler(event:ResourceEvent):void
		{	    	
		}

		/**
		 * 
		 */
		protected function loadStyle_completeHandler(event:StyleEvent):void
		{
			appModel.isApplicationVisible = true;
		}
		
		/**
		 * 
		 */
		protected function loadStyle_errorHandler(event:StyleEvent):void
		{
			appModel.isApplicationVisible = true;
		}
	}
}
