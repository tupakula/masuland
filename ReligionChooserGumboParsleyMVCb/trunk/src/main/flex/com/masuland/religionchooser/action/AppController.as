package com.masuland.religionchooser.action
{
	import com.masuland.religionchooser.action.event.AppEvent;
	import com.masuland.religionchooser.action.event.LoadLayoutEvent;
	import com.masuland.religionchooser.action.event.LoadLocaleEvent;
	import com.masuland.religionchooser.action.event.LoadStyleEvent;
	import com.masuland.religionchooser.data.AppModel;
	import com.masuland.religionchooser.service.contentxml.ContentXmlService;
	import com.masuland.religionchooser.service.settingsxml.SettingsXmlService;
	import com.masuland.religionchooser.data.state.ContentBoxState;
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
	
	/**
	 * @author masuland.com
	 */
	public class AppController
	{
		//----------------------
		// Properties
		//----------------------
		
		[MessageDispatcher]
		public var dispatcher:Function;
		
		[Inject]
		public var appModel:AppModel;
		
/*		[Inject]
		public var appDelegate:IAppDelegate;
*/		
		//----------------------
		// Methods
		//----------------------
		
		[MessageHandler(selector='AppEvent.INIT_APP')]
		public function initApp(event:AppEvent):void
		{
			dispatcher(new AppEvent(AppEvent.GET_SETTINGS));
			dispatcher(new AppEvent(AppEvent.GET_CONTENT));
		}

		[MessageHandler(selector='AppEvent.GET_SETTINGS')]
		public function getSettings():void
		{
			var service:SettingsXmlService = new SettingsXmlService();
			service.addEventListener(ResultEvent.RESULT, getSettings_resultHandler);
			service.addEventListener(FaultEvent.FAULT, getSettings_faultHandler);
			service.getData();
		}
		
		[MessageHandler(selector='AppEvent.GET_CONTENT')]
		public function getContent():void
		{
			var service:ContentXmlService = new ContentXmlService();
			service.addEventListener(ResultEvent.RESULT, getContent_resultHandler);
			service.addEventListener(FaultEvent.FAULT, getContent_faultHandler);
			service.getData();
		}
		
		[MessageHandler(selector='AppEvent.CHANGE_SELECTED_QUESTION')]
		public function changeSelectedQuestion(event:AppEvent):void
		{
			appModel.appViewState = ContentBoxState.QUESTION;
			appModel.selectedQuestion = event.question;
		}
		
		[MessageHandler(selector='AppEvent.SHOW_RESULT')]
		public function showResult(event:AppEvent):void
		{
			appModel.appViewState = ContentBoxState.RESULT;
			appModel.selectedResult = event.result;
		}
		
		[MessageHandler(selector='AppEvent.RESTART')]
		public function restart(event:AppEvent):void
		{
			appModel.appViewState = ContentBoxState.QUESTION;
			appModel.selectedQuestion = appModel.rootQuestion;
		}
		
		[MessageHandler]
		public function loadLayout(event:LoadLayoutEvent):void 
		{
			appModel.currentLayout = event.layout;
			
			// load style
			dispatcher(new LoadStyleEvent(StyleVO( appModel.currentLayout.styleVO.getItemAt(0) )));
			
			// load locales
			dispatcher(new LoadLocaleEvent(LocaleVO( appModel.currentLayout.localeVO.getItemAt(0) )));
		}
		
		[MessageHandler]
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
				resourceModuleURL = 'AppResources_' + appModel.currentLocale.code + '.swf';
				eventDispatcher = ResourceManager.getInstance().loadResourceModule(resourceModuleURL);
				
				if (eventDispatcher != null)
				{
					eventDispatcher.addEventListener(ResourceEvent.COMPLETE, onLoadLocaleComplete);
					eventDispatcher.addEventListener(ResourceEvent.ERROR, onLoadLocaleError);
				}
			}
*/
		}
		
		[MessageHandler]
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
				myEvent.addEventListener(StyleEvent.COMPLETE, loadStyle_completeHandler);
				myEvent.addEventListener(StyleEvent.ERROR, loadStyle_errorHandler);
			}
		}
		
		//----------------------
		// Handler
		//----------------------
		
		protected function getSettings_resultHandler(event:ResultEvent):void
		{
			var settings:SettingsVO = event.result as SettingsVO;
			
			if (settings)
			{
				appModel.settings = settings;
				
				dispatcher(new LoadLayoutEvent(LayoutVO( settings.layoutVO.getItemAt(0) )));
			}
		}
		
		protected function getSettings_faultHandler(event:FaultEvent):void
		{
			Alert.show('getSettingsFault(): ' + event.fault.faultString);
		}

		protected function getContent_resultHandler(event:ResultEvent):void
		{
			appModel.rootQuestion = QuestionVO( event.result );
			appModel.selectedQuestion = QuestionVO( event.result );
			
			appModel.appViewState = ContentBoxState.QUESTION;
		}
		
		protected function getContent_faultHandler(event:FaultEvent):void
		{
			Alert.show('getContentFault(): ' + event.fault.faultString);
		}

		protected function loadLocale_completeHandler(event:ResourceEvent):void
		{	    	
			ResourceManager.getInstance().localeChain = [ appModel.currentLocale.code ];
		}
		
		protected function loadLocale_errorHandler(event:ResourceEvent):void
		{	    	
		}
		
		protected function loadStyle_completeHandler(event:StyleEvent):void
		{
			appModel.isApplicationVisible = true;
		}
		
		protected function loadStyle_errorHandler(event:StyleEvent):void
		{
			appModel.isApplicationVisible = true;
		}
	}
}
