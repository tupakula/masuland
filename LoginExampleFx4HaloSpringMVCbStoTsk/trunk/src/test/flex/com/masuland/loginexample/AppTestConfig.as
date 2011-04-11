package com.masuland.loginexample
{
	import com.masuland.loginexample.business.AppMockDelegate;
	import com.masuland.loginexample.control.AppStories;
	import com.masuland.loginexample.view.cb.LoginBoxCB;
	import com.masuland.loginexample.view.cb.SettingsBoxCB;
	import com.masuland.loginexample.view.cb.UserBoxCB;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.core.IMXMLObject;
	import mx.events.FlexEvent;
	
	import org.springextensions.actionscript.context.support.FlexXMLApplicationContext;
	import org.springextensions.actionscript.core.event.EventBus;
	import org.springextensions.actionscript.ioc.factory.config.EventHandlerMetadataProcessor;
	import org.springextensions.actionscript.ioc.factory.config.RouteEventsMetaDataProcessor;
	import org.springextensions.actionscript.stage.DefaultAutowiringStageProcessor;
	import org.springextensions.actionscript.test.context.flexunit4.SpringFlexUnit4ClassRunner;
	
	import spark.components.Application;

	public class AppTestConfig extends EventDispatcher implements IMXMLObject
	{
		//----------------------
		// Properties
		//----------------------
		
//		[Embed(source='application-config.xml', mimeType ='application/octet-stream')]
//		public var contextConfig:Class;
		
		public var applicationContext:FlexXMLApplicationContext;

		// Force inclusion of classes not referenced elsewhere in the code
		{
			AppStories, 
			AppMockDelegate, 
			EventHandlerMetadataProcessor, 
			DefaultAutowiringStageProcessor, 
			RouteEventsMetaDataProcessor,
			SpringFlexUnit4ClassRunner, 
			SettingsBoxCB, 
			LoginBoxCB, 
			UserBoxCB
		}
		
		//----------------------
		// Methods
		//----------------------
		
		public function initialized(document:Object, id:String):void
		{
			applicationContext = new FlexXMLApplicationContext();
			
			// Embed
//			applicationContext.addEmbeddedConfig(contextConfig);
//			dispatchEvent(new AppEvent(AppEvent.INITIALIZE_CLIENT));
			
			// Load
			(FlexGlobals.topLevelApplication as Application).addEventListener(FlexEvent.INITIALIZE, loadContext);
		}
			
		private function loadContext(event:FlexEvent) : void
		{
			applicationContext.addConfigLocation('application-config-test.xml');
			applicationContext.addEventListener(Event.COMPLETE, loadContext_completeHandler);
			applicationContext.addEventListener(IOErrorEvent.IO_ERROR, loadContext_ioErrorHandler);
			applicationContext.load();
		}
		
		//----------------------
		// Handler
		//----------------------
		
		protected function loadContext_completeHandler(event:Event):void 
		{
		}
		
		protected function loadContext_ioErrorHandler(event:IOErrorEvent):void 
		{
			Alert.show('An error occurred when loading the xml for the application context: "' + event.text + '"', 'Error Loading Application Context');
		}
	}
}