package com.masuland.loginexample.control
{
	import com.masuland.loginexample.business.IAppDelegate;
	import com.masuland.loginexample.control.event.LoadLocaleEvent;
	import com.masuland.loginexample.control.event.LoadStyleEvent;
	import com.masuland.loginexample.control.responder.GetSettingsResponder;
	import com.masuland.loginexample.control.responder.LoginResponder;
	import com.masuland.loginexample.control.responder.RegisterResponder;
	import com.masuland.loginexample.control.responder.UpdateUserResponder;
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
		//----------------------
		// Properties
		//----------------------
		
		[Autowire]
		public var appModel:AppModel;
		
		[Autowire]
		public var appEventNames:AppEventNames;

		[Autowire]
		public var appDelegate:IAppDelegate;
		
		//----------------------
		// Methods
		//----------------------
		
		/**
		 * 
		 */
		[Mediate(event='${appEventNames.INITIALIZE_CLIENT}')]
		public function onInitComplete(event:Event):void 
		{	
			appModel.appStackState = AppStackState.LOGIN;
			appModel.loginBoxState = LoginBoxState.LOGIN;
			appModel.settingsBoxState = SettingsBoxState.OPEN;
			
			// get settings
			Swiz.dispatch(AppEventNames.GET_SETTINGS);
		}

		[Mediate(event='${appEventNames.GET_SETTINGS}')]
		public function getSettings():void
		{
			var responder:GetSettingsResponder = new GetSettingsResponder();
			
			executeServiceCall(
				appDelegate.getSettings(),
				responder.result,
				responder.fault);
		}
		
		[Mediate(event='${appEventNames.LOGIN}', properties='auth')]
		public function login(auth:AuthenticationVO, nextEvent:Event=null):void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN_PROGRESS;
			
			var responder:LoginResponder = new LoginResponder(nextEvent);
			
			executeServiceCall(
				appDelegate.login(auth),
				responder.result,
				responder.fault);
		}

		[Mediate(event='${appEventNames.LOGOUT}')]
		public function logout():void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
			appModel.appStackState = AppStackState.LOGIN;
		}

		[Mediate(event='${appEventNames.REGISTER}', properties='auth')]
		public function register(auth:AuthenticationVO, nextEvent:Event=null):void
		{
			appModel.loginBoxState = LoginBoxState.REGISTER_PROGRESS;
			
			var responder:RegisterResponder = new RegisterResponder(nextEvent);
			
			executeServiceCall(
				appDelegate.register(auth),
				responder.result,
				responder.fault);
		}

		[Mediate(event='${appEventNames.UPDATE_USER}', properties='user')]
		public function updateUser(user:UserVO):void
		{
			var responder:UpdateUserResponder = new UpdateUserResponder();
			
			executeServiceCall(
				appDelegate.updateUser(user),
				responder.result,
				responder.fault);
		}
		
		/**
		 * 
		 */
		[Mediate(event='${appEventNames.GOTO_LOGIN}')]
		public function gotoLogin():void 
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
		}

		/**
		 * 
		 */
		[Mediate(event='${appEventNames.GOTO_REGISTER}')]
		public function gotoRegister():void 
		{
			appModel.loginBoxState = LoginBoxState.REGISTER;
		}

		/**
		 * 
		 */
		[Mediate(event='${appEventNames.LOAD_LOCALE}', properties='locale')]
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
		[Mediate(event='${appEventNames.LOAD_STYLE}', properties='style')]
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
				myEvent.addEventListener(StyleEvent.COMPLETE, loadStyle_completeHandler);
				myEvent.addEventListener(StyleEvent.ERROR, loadStyle_errorHandler);
			}
		}

		/**
		 * 
		 */
		[Mediate(event='${appEventNames.LOAD_LAYOUT}', properties='layout')]
		public function loadLayout(layout:LayoutVO):void 
		{
			appModel.currentLayout = layout;
			
			// load style
			Swiz.dispatchEvent(new LoadStyleEvent(StyleVO( appModel.currentLayout.styles.getItemAt(0) )));
			
			// load locales
			Swiz.dispatchEvent(new LoadLocaleEvent(LocaleVO( appModel.currentLayout.locales.getItemAt(0) )));
		}
		
		//----------------------
		// Handler
		//----------------------
		
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
