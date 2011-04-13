package com.masuland.loginexample.control.command
{
	import com.masuland.loginexample.business.IAppDelegate;
	import com.masuland.loginexample.control.event.AppEvent;
	import com.masuland.loginexample.control.event.LoadLayoutEvent;
	import com.masuland.loginexample.model.AppModel;
	import com.masuland.loginexample.vo.LayoutVO;
	import com.masuland.loginexample.vo.SettingsVO;
	
	import flash.events.EventDispatcher;
	
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	[RouteEvents(events='LoadLayoutEvent.EVENT_NAME')]
	[Event(name='LoadLayoutEvent.EVENT_NAME', type='com.masuland.loginexample.control.event.LoadLayoutEvent')]
	public class GetSettingsCommand extends EventDispatcher
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
		
		[EventHandler(name='AppEvent.GET_SETTINGS')]
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
			dispatchEvent(new LoadLayoutEvent(LayoutVO( appModel.settings.layouts.getItemAt(0) )));
		}
		
		/**  */
		protected function getSettings_faultHandler(event:FaultEvent):void
		{
			Alert.show('getSettings_fault: ' + event.fault);
		}
	}
}