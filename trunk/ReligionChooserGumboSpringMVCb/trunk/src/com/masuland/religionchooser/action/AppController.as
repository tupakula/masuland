package com.masuland.religionchooser.action
{
	import com.masuland.religionchooser.action.event.AppEvent;
	import com.masuland.religionchooser.action.event.LoadLayoutEvent;
	import com.masuland.religionchooser.action.event.LoadLocaleEvent;
	import com.masuland.religionchooser.action.event.LoadStyleEvent;
	import com.masuland.religionchooser.data.AppModel;
	import com.masuland.religionchooser.service.contentxml.ContentXmlService;
	import com.masuland.religionchooser.service.settingsxml.SettingsXmlService;
	import com.masuland.religionchooser.view.component.ContentBoxState;
	import com.masuland.religionchooser.data.vo.LayoutVO;
	import com.masuland.religionchooser.data.vo.LocaleVO;
	import com.masuland.religionchooser.data.vo.QuestionVO;
	import com.masuland.religionchooser.data.vo.SettingsVO;
	import com.masuland.religionchooser.data.vo.StyleVO;
	
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
	
	import org.springextensions.actionscript.core.event.EventBus;
	
	public class AppController
	{
		[Autowired]
		public var appModel:AppModel;
		
/*		[Autowired]
		public var appDelegate:IAppDelegate;
*/		
		public function AppController() {}

		/**
		 * Initialises the application
		 */
		[EventHandler(name="AppEvent.INIT_APP")]
		public function initApp(event:AppEvent):void
		{
			getSettings();
			getContent();
		}

		[EventHandler(name="AppEvent.GET_SETTINGS")]
		public function getSettings():void
		{
			var service:SettingsXmlService = new SettingsXmlService();
			service.addEventListener(ResultEvent.RESULT, getSettingsResult);
			service.addEventListener(FaultEvent.FAULT, getSettingsFault)
			service.getData();
		}
		
		protected function getSettingsResult(event:ResultEvent):void
		{
			var settings:SettingsVO = event.result as SettingsVO;
			
			if (settings)
			{
				appModel.settings = settings;
				
				EventBus.dispatchEvent(new LoadLayoutEvent(LayoutVO( settings.layoutVO.getItemAt(0) )));
			}
		}
		
		protected function getSettingsFault(event:FaultEvent):void
		{
			Alert.show('getSettingsFault(): ' + event.fault.faultString);
		}

		[EventHandler(name="AppEvent.GET_CONTENT")]
		public function getContent():void
		{
			var service:ContentXmlService = new ContentXmlService();
			service.addEventListener(ResultEvent.RESULT, getContentResult);
			service.addEventListener(FaultEvent.FAULT, getContentFault)
			service.getData();
		}

		protected function getContentResult(event:ResultEvent):void
		{
			appModel.rootQuestion = QuestionVO( event.result );
			appModel.selectedQuestion = QuestionVO( event.result );
			
			appModel.appViewState = ContentBoxState.QUESTION;
		}
		
		protected function getContentFault(event:FaultEvent):void
		{
			Alert.show('getContentFault(): ' + event.fault.faultString);
		}
		
		/**
		 * Changes the selected question
		 */
		[EventHandler(name="AppEvent.CHANGE_SELECTED_QUESTION")]
		public function changeSelectedQuestion(event:AppEvent):void
		{
			appModel.appViewState = ContentBoxState.QUESTION;
			appModel.selectedQuestion = event.question;
		}
		
		/**
		 * Show result
		 */
		[EventHandler(name="AppEvent.SHOW_RESULT")]
		public function showResult(event:AppEvent):void
		{
			appModel.appViewState = ContentBoxState.RESULT;
			appModel.selectedResult = event.result;
		}

		/**
		 * Restart
		 */
		[EventHandler(name="AppEvent.RESTART")]
		public function restart(event:AppEvent):void
		{
			appModel.appViewState = ContentBoxState.QUESTION;
			appModel.selectedQuestion = appModel.rootQuestion;
		}
		

		//---------------
		// GUI Loading
		//---------------

		/**
		 * 
		 */
		[EventHandler(name="LoadLayoutEvent.EVENT_NAME")]
		public function loadLayout(event:LoadLayoutEvent):void 
		{
			appModel.currentLayout = event.layout;
			
			// load style
			EventBus.dispatchEvent(new LoadStyleEvent(StyleVO( appModel.currentLayout.styleVO.getItemAt(0) )));
			
			// load locales
			EventBus.dispatchEvent(new LoadLocaleEvent(LocaleVO( appModel.currentLayout.localeVO.getItemAt(0) )));
		}
		

		/**
		 * 
		 */
		[EventHandler(name="LoadLocaleEvent.EVENT_NAME")]
		public function loadLocale(event:LoadLocaleEvent):void 
		{
			appModel.currentLocale = event.locale;
			
			ResourceManager.getInstance().localeChain = [ appModel.currentLocale.code ];
			ResourceManager.getInstance().update();
			
			// TODO ... Resource update bug
			
/*			var oldLoginBoxState:String = appModel.loginBoxState;
			appModel.loginBoxState = LoginBoxState.HIDDEN;
			appModel.loginBoxState = oldLoginBoxState;
			
			var oldAppStackState:String = appModel.appStackState;
			appModel.appStackState = AppStackState.HIDDEN;
			appModel.appStackState = oldAppStackState;
*/			
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
		*/
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
		[EventHandler(name="LoadStyleEvent.EVENT_NAME")]
		public function loadStyle(event:LoadStyleEvent):void 
		{
			appModel.currentStyle = event.style;
			
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
		private function onLoadStyleComplete(event:StyleEvent):void
		{
			trace('');
//			appModel.isApplicationVisible = true;
		}
		
		/**
		 * 
		 */
		private function onLoadStyleError(event:StyleEvent):void
		{
			trace('');
//			appModel.isApplicationVisible = true;
		}
	}
}
