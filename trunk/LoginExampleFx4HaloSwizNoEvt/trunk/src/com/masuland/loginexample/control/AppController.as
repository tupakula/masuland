package com.masuland.loginexample.control
{
	import com.masuland.loginexample.business.IAppDelegate;
	import com.masuland.loginexample.model.AppModel;
	import com.masuland.loginexample.state.AppStackState;
	import com.masuland.loginexample.state.LoginBoxState;
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
		[Inject]
		public var serviceHelper:ServiceHelper;
		
		[Inject]
		public var appModel:AppModel;
		
		[Inject]
		public var appDelegate:IAppDelegate;

		//---------------
		// Action Events
		//---------------

		/**
		 * Load the User collection.
		 */ 
		[Mediate(event="mx.events.FlexEvent.APPLICATION_COMPLETE")]
		public function initApp():void
		{
			appModel.appStackState = AppStackState.LOGIN;
			appModel.loginBoxState = LoginBoxState.LOGIN;
			
			// get settings
			getSettings();
		}
		
		public function getSettings():void
		{
			serviceHelper.executeServiceCall(
				appDelegate.getSettings(),
				getSettings_result,
				getSettings_fault);
		}
		
		/**  */
		public function getSettings_result(event:ResultEvent):void
		{
			appModel.settings = SettingsVO( event.result );
			
			// load layout
			loadLayout(LayoutVO( appModel.settings.layouts.getItemAt(0) ));
		}
		
		/**  */
		public function getSettings_fault(event:FaultEvent):void
		{
			Alert.show("getSettings_fault: " + event.fault);
		}
		
		public function login(auth:AuthenticationVO):void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN_PROGRESS;
			
			serviceHelper.executeServiceCall(
				appDelegate.login(auth),
				login_result,
				login_fault);
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
				register_result,
				register_fault);
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
		
		public function updateUser(user:UserVO):void
		{
			serviceHelper.executeServiceCall(
				appDelegate.updateUser(user),
				updateUser_result,
				updateUser_fault);
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

		//---------------
		// GUI Loading
		//---------------

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
				myEvent.addEventListener(StyleEvent.COMPLETE, onLoadStyleComplete);
				myEvent.addEventListener(StyleEvent.ERROR, onLoadStyleError);
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
