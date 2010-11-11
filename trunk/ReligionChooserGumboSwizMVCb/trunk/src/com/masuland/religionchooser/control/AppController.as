package com.masuland.religionchooser.control
{
	import com.masuland.religionchooser.event.AppEvent;
	import com.masuland.religionchooser.event.LoadLayoutEvent;
	import com.masuland.religionchooser.event.LoadLocaleEvent;
	import com.masuland.religionchooser.event.LoadStyleEvent;
	import com.masuland.religionchooser.model.AppModel;
	import com.masuland.religionchooser.service.contentxml.ContentXmlService;
	import com.masuland.religionchooser.service.settingsxml.SettingsXmlService;
	import com.masuland.religionchooser.view.ContentBoxState;
	import com.masuland.religionchooser.vo.LayoutVO;
	import com.masuland.religionchooser.vo.LocaleVO;
	import com.masuland.religionchooser.vo.QuestionVO;
	import com.masuland.religionchooser.vo.SettingsVO;
	import com.masuland.religionchooser.vo.StyleVO;
	
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
	
	public class AppController
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[Inject]
		public var appModel:AppModel;
		
/*		[Inject]
		public var appDelegate:IAppDelegate;
*/		
		public function AppController() {}

		/**
		 * Initialises the application
		 */ 
		[Mediate(event="mx.events.FlexEvent.APPLICATION_COMPLETE")]
		public function initApp():void
		{
			dispatcher.dispatchEvent(new AppEvent(AppEvent.GET_SETTINGS));
			dispatcher.dispatchEvent(new AppEvent(AppEvent.GET_CONTENT));
		}

		[Mediate(event="AppEvent.GET_SETTINGS")]
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
				
				dispatcher.dispatchEvent(new LoadLayoutEvent(LayoutVO( settings.layoutVO.getItemAt(0) )));
			}
		}
		
		protected function getSettingsFault(event:FaultEvent):void
		{
			Alert.show('getSettingsFault(): ' + event.fault.faultString);
		}

		[Mediate(event="AppEvent.GET_CONTENT")]
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
		[Mediate(event="AppEvent.CHANGE_SELECTED_QUESTION")]
		public function changeSelectedQuestion(event:AppEvent):void
		{
			appModel.appViewState = ContentBoxState.QUESTION;
			appModel.selectedQuestion = event.question;
		}
		
		/**
		 * Show result
		 */
		[Mediate(event="AppEvent.SHOW_RESULT")]
		public function showResult(event:AppEvent):void
		{
			appModel.appViewState = ContentBoxState.RESULT;
			appModel.selectedResult = event.result;
		}

		/**
		 * Restart
		 */
		[Mediate(event="AppEvent.RESTART")]
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
		[Mediate(event="LoadLayoutEvent.EVENT_NAME")]
		public function loadLayout(event:LoadLayoutEvent):void 
		{
			appModel.currentLayout = event.layout;
			
			// load style
			dispatcher.dispatchEvent(new LoadStyleEvent(StyleVO( appModel.currentLayout.styleVO.getItemAt(0) )));
			
			// load locales
			dispatcher.dispatchEvent(new LoadLocaleEvent(LocaleVO( appModel.currentLayout.localeVO.getItemAt(0) )));
		}
		

		/**
		 * 
		 */
		[Mediate(event="LoadLocaleEvent.EVENT_NAME")]
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
		[Mediate(event="LoadStyleEvent.EVENT_NAME")]
		public function loadStyle(event:LoadStyleEvent):void 
		{
			appModel.currentStyle = event.style;
			
			return;
			
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
//			appModel.isApplicationVisible = true;
		}
		
		/**
		 * 
		 */
		private function onLoadStyleError(event:StyleEvent):void
		{
//			appModel.isApplicationVisible = true;
		}
	}
}
