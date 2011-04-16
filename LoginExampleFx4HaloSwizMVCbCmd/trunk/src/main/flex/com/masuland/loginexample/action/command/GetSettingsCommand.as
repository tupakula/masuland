package com.masuland.loginexample.action.command
{
	import com.masuland.loginexample.business.IAppDelegate;
	import com.masuland.loginexample.action.event.AppEvent;
	import com.masuland.loginexample.action.event.LoadLayoutEvent;
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.vo.LayoutVO;
	import com.masuland.loginexample.data.vo.SettingsVO;
	
	import flash.events.IEventDispatcher;
	
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class GetSettingsCommand
	{
		//----------------------
		// Properties
		//----------------------
		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[Inject]
		public var appModel:AppModel;
		
		[Inject]
		public var appDelegate:IAppDelegate;
		
		//----------------------
		// Methods
		//----------------------
		
		[EventHandler(event='AppEvent.GET_SETTINGS')]
		public function getSettings(event:AppEvent):void
		{
			var token:AsyncToken = appDelegate.getSettings();
			token.addResponder(new Responder(getSettings_resultHandler, getSettings_faultHandler));
		}
		
		//----------------------
		// Handler
		//----------------------
		
		/**  */
		protected function getSettings_resultHandler(event:ResultEvent):void
		{
			appModel.settings = SettingsVO( event.result );
			
			// load layout
			dispatcher.dispatchEvent(new LoadLayoutEvent(LayoutVO( appModel.settings.layouts.getItemAt(0) )));
		}
		
		/**  */
		protected function getSettings_faultHandler(event:FaultEvent):void
		{
			Alert.show('getSettings_fault: ' + event.fault);
		}
	}
}