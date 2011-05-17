package com.masuland.religionchooser.action
{
	import com.masuland.religionchooser.action.event.AppEvent;
	import com.masuland.religionchooser.action.event.LoadLayoutEvent;
	import com.masuland.religionchooser.action.event.LoadLocaleEvent;
	import com.masuland.religionchooser.action.event.LoadStyleEvent;
	import com.masuland.religionchooser.business.IAppDelegate;
	import com.masuland.religionchooser.data.AppModel;
	import com.masuland.religionchooser.data.state.ContentBoxState;
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
	import mx.managers.BrowserManager;
	import mx.resources.ResourceManager;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.styles.IStyleManager2;
	import mx.styles.StyleManager;
	
	import org.springextensions.actionscript.core.event.EventBus;
	
	/**
	 * @author masuland.com
	 */
	public class AppController
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject]
		public var appModel:AppModel;
		
		[Inject]
		public var appDelegate:IAppDelegate;
		
		//----------------------
		// Methods
		//----------------------
		
		[EventHandler(name='AppEvent.INIT_APP')]
		public function initApp(event:AppEvent):void
		{
			getSettings();
			getContent();
		}

		[EventHandler(name='AppEvent.GET_SETTINGS')]
		public function getSettings():void
		{
			appDelegate.getSettings(getSettings_resultHandler, getSettings_faultHandler);
		}
		
		[EventHandler(name='AppEvent.GET_CONTENT')]
		public function getContent():void
		{
			appDelegate.getContent(getContent_resultHandler, getContent_faultHandler);
		}
		
		[EventHandler(name='AppEvent.CHANGE_SELECTED_QUESTION')]
		public function changeSelectedQuestion(event:AppEvent):void
		{
			appModel.appViewState = ContentBoxState.QUESTION;
			appModel.selectedQuestion = event.question;
		}
		
		[EventHandler(name='AppEvent.SHOW_RESULT')]
		public function showResult(event:AppEvent):void
		{
			appModel.appViewState = ContentBoxState.RESULT;
			appModel.selectedResult = event.result;
		}
		
		[EventHandler(name='AppEvent.RESTART')]
		public function restart(event:AppEvent):void
		{
			appModel.appViewState = ContentBoxState.QUESTION;
			appModel.selectedQuestion = appModel.rootQuestion;
		}
		
		[EventHandler(name='LoadLayoutEvent.EVENT_NAME')]
		public function loadLayout(event:LoadLayoutEvent):void 
		{
			appModel.currentLayout = event.layout;
			
			// load style
			EventBus.dispatchEvent(new LoadStyleEvent(StyleVO( appModel.currentLayout.styleVO.getItemAt(0) )));
			
			// load locales
			EventBus.dispatchEvent(new LoadLocaleEvent(LocaleVO( appModel.currentLayout.localeVO.getItemAt(0) )));
		}
		
		[EventHandler(name='LoadLocaleEvent.EVENT_NAME')]
		public function loadLocale(event:LoadLocaleEvent):void 
		{
			appModel.currentLocale = event.locale;
			
			ResourceManager.getInstance().localeChain = [ appModel.currentLocale.code ];
			ResourceManager.getInstance().update();
			
			BrowserManager.getInstance().setTitle(ResourceManager.getInstance().getString('resources', 'txt_app_title'));
			
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
		
		[EventHandler(name='LoadStyleEvent.EVENT_NAME')]
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
				
				EventBus.dispatchEvent(new LoadLayoutEvent(LayoutVO( settings.layoutVO.getItemAt(0) )));
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
		
		protected function loadLocale_ErrorHandler(event:ResourceEvent):void
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
