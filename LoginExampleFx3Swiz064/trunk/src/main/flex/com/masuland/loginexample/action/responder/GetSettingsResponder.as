package com.masuland.loginexample.action.responder
{	
	import com.masuland.loginexample.action.event.LoadLayoutEvent;
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.vo.LayoutVO;
	import com.masuland.loginexample.data.vo.SettingsVO;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	import org.swizframework.Swiz;

	/**  */
	public class GetSettingsResponder implements IResponder
	{
		/**  */
		[Bindable]
		[Autowire]
		public var appModel:AppModel;
		
		/** Konstruktur */
		public function GetSettingsResponder() 
		{
			Swiz.autowire(this);
		}

		/**  */
		public function result(data:Object):void
		{
			appModel.settings = SettingsVO( data.result );
			
			// load layout
			Swiz.dispatchEvent(new LoadLayoutEvent(LayoutVO( appModel.settings.layouts.getItemAt(0) )));
		}
		
		/**  */
		public function fault(info:Object):void
		{
			Alert.show('GetSettingsResponder.fault(info:Object)');
		}
	}
}