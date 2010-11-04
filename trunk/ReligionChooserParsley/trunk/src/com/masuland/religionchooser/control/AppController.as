package com.masuland.religionchooser.control
{
	import com.masuland.religionchooser.event.AppEvent;
	import com.masuland.religionchooser.model.AppModel;
	import com.masuland.religionchooser.service.contentxml.ContentXmlService;
	import com.masuland.religionchooser.view.ContentBoxState;
	import com.masuland.religionchooser.vo.LocaleVO;
	import com.masuland.religionchooser.vo.QuestionVO;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class AppController
	{
		[MessageDispatcher]
		public var dispatcher:Function;
		
		[Inject]
		public var appModel:AppModel;
		
/*		[Inject]
		public var appDelegate:IAppDelegate;
*/		
		public function AppController() {}

		/**
		 * Initialises the application
		 */
		[MessageHandler(selector="AppEvent.INIT_APP")]
		public function initApp(event:AppEvent):void
		{
			getSettings();
			getContent();
		}

		public function getSettings():void
		{
			var coll:ArrayCollection = new ArrayCollection();
			
			var locale:LocaleVO = new LocaleVO();
			locale.name = 'Deutsch';
			locale.index = 0;
			locale.code = 'de_DE';
			coll.addItem(locale);

			locale = new LocaleVO();
			locale.name = 'English';
			locale.index = 1;
			locale.code = 'en_US';
			coll.addItem(locale);
			
			appModel.locales = coll;
			appModel.selectedLocale = coll.getItemAt(0) as LocaleVO;
		}
		
		protected function getSettingsResult(event:ResultEvent):void
		{
		}
		
		protected function getSettingsFault(event:FaultEvent):void
		{
			Alert.show('getSettingsFault(): ' + event.fault.faultString);
		}

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
		[MessageHandler(selector="AppEvent.CHANGE_SELECTED_QUESTION")]
		public function changeSelectedQuestion(event:AppEvent):void
		{
			appModel.appViewState = ContentBoxState.QUESTION;
			appModel.selectedQuestion = event.question;
		}
		
		/**
		 * Show result
		 */
		[MessageHandler(selector="AppEvent.SHOW_RESULT")]
		public function showResult(event:AppEvent):void
		{
			appModel.appViewState = ContentBoxState.RESULT;
			appModel.selectedResult = event.result;
		}

		/**
		 * Restart
		 */
		[MessageHandler(selector="AppEvent.RESTART")]
		public function restart(event:AppEvent):void
		{
			appModel.appViewState = ContentBoxState.QUESTION;
			appModel.selectedQuestion = appModel.rootQuestion;
		}
		
		/**
		 * Restart
		 */
		[MessageHandler(selector="AppEvent.CHANGE_LANGUAGE")]
		public function changeLanguage(event:AppEvent):void
		{
			appModel.selectedLocale = event.locale;
		}
	}
}
