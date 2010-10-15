package com.masuland.loginexample.swiz10.control
{
	import com.masuland.loginexample.swiz10.business.IAppDelegate;
	import com.masuland.loginexample.swiz10.control.event.AppEvent;
	import com.masuland.loginexample.swiz10.control.event.LoadLayoutEvent;
	import com.masuland.loginexample.swiz10.control.event.LoadLocaleEvent;
	import com.masuland.loginexample.swiz10.control.event.LoadStyleEvent;
	import com.masuland.loginexample.swiz10.model.AppModel;
	import com.masuland.loginexample.swiz10.state.AppStackState;
	import com.masuland.loginexample.swiz10.state.LoginBoxState;
	import com.masuland.loginexample.swiz10.vo.AuthenticationVO;
	import com.masuland.loginexample.swiz10.vo.LayoutVO;
	import com.masuland.loginexample.swiz10.vo.LocaleVO;
	import com.masuland.loginexample.swiz10.vo.SettingsVO;
	import com.masuland.loginexample.swiz10.vo.StyleVO;
	import com.masuland.loginexample.swiz10.vo.UserVO;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	import mx.controls.Alert;
	import mx.events.ResourceEvent;
	import mx.events.StyleEvent;
	import mx.resources.ResourceManager;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.styles.StyleManager;
	
	import org.swizframework.utils.services.ServiceHelper;
	
	[Bindable]
	public class AppController
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[Inject]
		public var serviceHelper:ServiceHelper;
		
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
		[Mediate( event="mx.events.FlexEvent.APPLICATION_COMPLETE" )]
		public function initApp() : void
		{
			appModel.appStackState = AppStackState.LOGIN;
			appModel.loginBoxState = LoginBoxState.LOGIN;
			
			// get settings
			dispatcher.dispatchEvent(new AppEvent(AppEvent.GET_SETTINGS));
		}
		
		[Mediate(event="AppEvent.GET_SETTINGS")]
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
			dispatcher.dispatchEvent(new LoadLayoutEvent(LayoutVO( appModel.settings.layouts.getItemAt(0) )));
		}
		
		/**  */
		public function getSettings_fault(event:FaultEvent):void
		{
			Alert.show("getSettings_fault: " + event.fault);
		}
		
		[Mediate(event="LoginEvent.EVENT_NAME", 
			properties="auth")]
		public function login(auth:AuthenticationVO, nextEvent:Event=null):void
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

		[Mediate(event="AppEvent.LOGOUT")]
		public function logout():void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
			appModel.appStackState = AppStackState.LOGIN;
		}

		[Mediate(event="RegisterEvent.EVENT_NAME", 
			properties="auth")]
		public function register(auth:AuthenticationVO, nextEvent:Event=null):void
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
		
		[Mediate(event="UpdateUserEvent.EVENT_NAME}", 
			properties="user")]
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
		[Mediate(
			event="AppEvent.GOTO_LOGIN"
			)]
		public function gotoLogin():void 
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
		}

		/**
		 * 
		 */
		[Mediate(
			event="AppEvent.GOTO_REGISTER"
			)]
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
		[Mediate(
			event="LoadLocaleEvent.EVENT_NAME", 
			properties="locale"
			)]
		public function loadLocales(locale:LocaleVO):void 
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
		[Mediate(
			event="LoadStyleEvent.EVENT_NAME", 
			properties="style")]
		public function loadStyle(style:StyleVO):void 
		{
			var myEvent:IEventDispatcher;
			
			if (appModel != null)
			{
				if (appModel.currentStyle != null)
				{
					StyleManager.unloadStyleDeclarations(appModel.currentStyle.path, false);
				}

				appModel.currentStyle = style;
				
				myEvent = StyleManager.loadStyleDeclarations(style.path, true);
				myEvent.addEventListener(StyleEvent.COMPLETE, onLoadStyleComplete);
				myEvent.addEventListener(StyleEvent.ERROR, onLoadStyleError);
			}
		}

		/**
		 * 
		 */
		[Mediate(
			event="LoadLayoutEvent.EVENT_NAME", 
			properties="layout")]
		public function loadLayout(layout:LayoutVO):void 
		{
			appModel.currentLayout = layout;
			
			// load style
			dispatcher.dispatchEvent(new LoadStyleEvent(StyleVO( appModel.currentLayout.styles.getItemAt(0) )));
			
			// load locales
			dispatcher.dispatchEvent(new LoadLocaleEvent(LocaleVO( appModel.currentLayout.locales.getItemAt(0) )));
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
