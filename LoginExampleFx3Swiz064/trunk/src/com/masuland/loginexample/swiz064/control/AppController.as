package com.masuland.loginexample.swiz064.control
{
	import com.masuland.loginexample.swiz064.business.IAppDelegate;
	import com.masuland.loginexample.swiz064.control.responder.GetSettingsResponder;
	import com.masuland.loginexample.swiz064.control.responder.LoginResponder;
	import com.masuland.loginexample.swiz064.control.responder.RegisterResponder;
	import com.masuland.loginexample.swiz064.control.responder.UpdateUserResponder;
	import com.masuland.loginexample.swiz064.model.AppModel;
	import com.masuland.loginexample.swiz064.state.AppStackState;
	import com.masuland.loginexample.swiz064.state.LoginBoxState;
	import com.masuland.loginexample.swiz064.vo.AuthenticationVO;
	import com.masuland.loginexample.swiz064.vo.LayoutVO;
	import com.masuland.loginexample.swiz064.vo.LocaleVO;
	import com.masuland.loginexample.swiz064.vo.StyleVO;
	import com.masuland.loginexample.swiz064.vo.UserVO;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	import mx.core.Application;
	import mx.events.ResourceEvent;
	import mx.events.StyleEvent;
	import mx.resources.ResourceManager;
	import mx.styles.StyleManager;
	
	import org.swizframework.Swiz;
	import org.swizframework.controller.AbstractController;
	
	[Bindable]
	public class AppController extends AbstractController
	{
		[Autowire]
		public var appModel:AppModel;
		
		[Autowire]
		public var appEventNames:AppEventNames;

		[Autowire]
		public var appDelegate:IAppDelegate;
		
		public function AppController() {}

		//---------------
		// Action Events
		//---------------

		/**
		 * 
		 */
		[Mediate(
			event="${appEventNames.INITIALIZE_CLIENT}"
			)]
		public function onInitComplete(event:Event):void 
		{	
			appModel.appStackState = AppStackState.LOGIN;
			appModel.loginBoxState = LoginBoxState.LOGIN;
			
			// get settings
			Swiz.dispatch(AppEventNames.GET_SETTINGS);
		}

		[Mediate(event="${appEventNames.GET_SETTINGS}")]
		public function getSettings():void
		{
			var responder:GetSettingsResponder = new GetSettingsResponder();
			
			executeServiceCall(
				appDelegate.getSettings(),
				responder.result,
				responder.fault);
		}
		
		[Mediate(event="${appEventNames.LOGIN}", 
			properties="auth")]
		public function login(auth:AuthenticationVO, nextEvent:Event=null):void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN_PROGRESS;
			
			var responder:LoginResponder = new LoginResponder(nextEvent);
			
			executeServiceCall(
				appDelegate.login(auth),
				responder.result,
				responder.fault);
		}

		[Mediate(event="${appEventNames.LOGOUT}")]
		public function logout():void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
			appModel.appStackState = AppStackState.LOGIN;
		}

		[Mediate(event="${appEventNames.REGISTER}", 
			properties="auth")]
		public function register(auth:AuthenticationVO, nextEvent:Event=null):void
		{
			appModel.loginBoxState = LoginBoxState.REGISTER_PROGRESS;
			
			var responder:RegisterResponder = new RegisterResponder(nextEvent);
			
			executeServiceCall(
				appDelegate.register(auth),
				responder.result,
				responder.fault);
		}

		[Mediate(event="${appEventNames.UPDATE_USER}", 
			properties="user")]
		public function updateUser(user:UserVO):void
		{
			var responder:UpdateUserResponder = new UpdateUserResponder();
			
			executeServiceCall(
				appDelegate.updateUser(user),
				responder.result,
				responder.fault);
		}
		
		//---------------
		// GUI Events
		//---------------
		
		/**
		 * 
		 */
		[Mediate(
			event="${appEventNames.GOTO_LOGIN}"
			)]
		public function gotoLogin():void 
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
		}

		/**
		 * 
		 */
		[Mediate(
			event="${appEventNames.GOTO_REGISTER}"
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
			event="${appEventNames.LOAD_LOCALE}", 
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
			event="${appEventNames.LOAD_STYLE}", 
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
			event="${appEventNames.LOAD_LAYOUT}", 
			properties="layout")]
		public function loadLayout(layout:LayoutVO):void 
		{
			appModel.currentLayout = layout;
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
