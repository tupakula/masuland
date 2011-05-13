package com.masuland.loginexample.action.command
{
	import com.masuland.loginexample.action.signal.LoadLayoutSignal;
	import com.masuland.loginexample.business.IAppDelegate;
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.vo.LayoutVO;
	import com.masuland.loginexample.data.vo.SettingsVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.robotlegs.mvcs.SignalCommand;
	
	/**
	 * @author masuland.com
	 */
	public class GetSettingsCommand extends SignalCommand
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject]
		public var appModel:AppModel;
		
		[Inject]
		public var appDelegate:IAppDelegate;
		
		[Inject]
		public var loadLayoutSignal:LoadLayoutSignal;
		
		//----------------------
		// Methods
		//----------------------
		
		override public function execute():void
		{
			var token:AsyncToken = appDelegate.getSettings();
			token.addResponder(new Responder(getSettings_resultHandler, getSettings_faultHandler));
		}
		
		//----------------------
		// Handler
		//----------------------
		
		protected function getSettings_resultHandler(event:ResultEvent):void
		{
			appModel.settings = SettingsVO( event.result );
			
			// load layout
			loadLayoutSignal.dispatch(LayoutVO( appModel.settings.layouts.getItemAt(0) ), true);
		}
		
		protected function getSettings_faultHandler(event:FaultEvent):void
		{
//			Alert.show('getSettings_fault: ' + event.fault);
		}
	}
}
