package com.masuland.loginexample.swiz064.control.responder
{	
	import com.masuland.loginexample.swiz064.control.event.LoadLayoutEvent;
	import com.masuland.loginexample.swiz064.control.event.LoadLocaleEvent;
	import com.masuland.loginexample.swiz064.control.event.LoadStyleEvent;
	import com.masuland.loginexample.swiz064.model.AppModel;
	import com.masuland.loginexample.swiz064.vo.LayoutVO;
	import com.masuland.loginexample.swiz064.vo.LocaleVO;
	import com.masuland.loginexample.swiz064.vo.SettingsVO;
	import com.masuland.loginexample.swiz064.vo.StyleVO;
	
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

			// load style
			Swiz.dispatchEvent(new LoadStyleEvent(StyleVO( appModel.settings.styles.getItemAt(0) )));
			
			// load locales
			Swiz.dispatchEvent(new LoadLocaleEvent(LocaleVO( appModel.settings.locales.getItemAt(0) )));
		}
		
		/**  */
		public function fault(info:Object):void
		{
			Alert.show("GetSettingsResponder.fault(info:Object)");
		}
	}
}