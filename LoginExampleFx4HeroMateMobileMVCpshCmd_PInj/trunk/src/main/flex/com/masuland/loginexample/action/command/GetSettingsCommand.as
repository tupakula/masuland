package com.masuland.loginexample.action.command
{
	import com.masuland.loginexample.action.event.LoadLayoutEvent;
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.vo.LayoutVO;
	import com.masuland.loginexample.data.vo.SettingsVO;
	
	import flash.events.IEventDispatcher;
	
	import mx.rpc.events.FaultEvent;

	/**
	 * @author masuland.com
	 */
	public class GetSettingsCommand
	{
		//----------------------
		// Properties
		//----------------------
		
		public var appModel:AppModel;
		
		private var dispatcher:IEventDispatcher;
		
		//----------------------
		// Constructor
		//----------------------
		
		public function GetSettingsCommand(dispatcher:IEventDispatcher)
		{
			this.dispatcher = dispatcher;
		}
		
		//----------------------
		// Handler
		//----------------------
		
		public function getSettings_resultHandler(settings:SettingsVO):void
		{
			appModel.settings = settings;
			
			// Load layout
			dispatcher.dispatchEvent(new LoadLayoutEvent(LayoutVO( appModel.settings.layouts.getItemAt(0) )));
		}
		
		public function getSettings_faultHandler(event:FaultEvent):void
		{
//			Alert.show('getSettings_fault: ' + event.fault);
		}
	}
}
